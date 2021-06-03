import asyncio
from enum import auto, IntEnum
import json
import copy


class TopicType(IntEnum):
    CMD = 1
    EVT = auto()
    TEL = auto()


class TcpClient(object):
    """TCP/IP client.

    Attributes
    ----------
    reader : asyncio.StreamReader or None
        Reader of socker.
    writer : asyncio.StreamWriter or None
        Writer of the socket.
    queue : asyncio.Queue
        Queue of the message.
    """

    def __init__(self, maxsize_queue_tel=1000):

        self.reader = None
        self.writer = None

        # Unique ID
        self._uniq_id = self._uniq_id_gen()

        # List of telemetry
        self._list_tel = []

        self.queue = asyncio.Queue(maxsize=maxsize_queue_tel)

    def _uniq_id_gen(self):
        """Unique ID generator.

        Yields
        ------
        Generator
            Unique Id generator object.
        """

        value = 0
        while True:
            yield value
            value += 1

    def reset_list_tel(self):
        """Reset the list of telemetry."""

        self._list_tel = []

    def get_uniq_id(self):
        """Get the unique ID.

        Returns
        -------
        int
            Unique ID.
        """

        return next(self._uniq_id)

    async def connect(self, ip_addr, port):
        """Connect to the server.

        Parameters
        ----------
        ip_addr : str
            IP address.
        port : int
            Port to connect.
        """

        self.reader, self.writer = await asyncio.open_connection(
            host=ip_addr, port=port
        )

    async def write(self, topic, topic_details, topic_type, custom_id=None):
        """Write the message.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.
        topic_type : TopicType
            Topic type.
        custom_id : int or None, optional
            Customed Id of command if not None. This is for the test purpose
            only. (the default is None)
        """

        topic_details_with_header = copy.copy(topic_details)
        if topic_type == TopicType.CMD:
            self._check_cmd_expect(topic_details)
            self._add_cmd_header(topic, topic_details_with_header, custom_id=custom_id)
        elif topic_type == TopicType.EVT:
            self._add_evt_header(topic, topic_details_with_header)
        elif topic_type == TopicType.TEL:
            self._add_tel_header(topic, topic_details_with_header)
        else:
            raise ValueError(f"The topic type: {topic_type} is not supported.")

        await self._write_msg_to_socket(topic_details_with_header)

    def _check_cmd_expect(self, cmd_details):
        """Check the expect result of command.

        Parameters
        ----------
        cmd_details : dict
            Command details.

        Raises
        ------
        ValueError
            The 'cmdExpect' can only be 'success' or 'fail'.
        """
        if "cmdExpect" in cmd_details.keys():
            if cmd_details["cmdExpect"] not in ("success", "fail"):
                raise ValueError("The 'cmdExpect' can only be 'success' or 'fail'.")

    def _add_cmd_header(self, topic, topic_details, custom_id=None):
        """Add the command header.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.
        custom_id : int or None, optional
            Customed Id of command if not None. This is for the test purpose
            only. (the default is None)

        Raises
        ------
        ValueError
            The 'cmdName' is in the topic details already.
        """

        if "cmdName" in topic_details.keys():
            raise ValueError("The 'cmdName' is in the topic details already.")

        topic_details["cmdName"] = topic

        if custom_id is not None:
            topic_details["cmdId"] = int(custom_id)
        else:
            topic_details["cmdId"] = self.get_uniq_id()

    def _add_evt_header(self, topic, topic_details):
        """Add the event header.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.

        Raises
        ------
        ValueError
            The 'evtName' is in the topic details already.
        """

        if "evtName" in topic_details.keys():
            raise ValueError("The 'evtName' is in the topic details already.")

        topic_details["evtName"] = topic

    def _add_tel_header(self, topic, topic_details):
        """Add the telemetry header.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.

        Raises
        ------
        ValueError
            The 'telName' is in the topic details already.
        """

        if "telName" in topic_details.keys():
            raise ValueError("The 'telName' is in the topic details already.")

        topic_details["telName"] = topic

    async def _write_msg_to_socket(self, input_msg):
        """Write the message to socket.

        Parameters
        ----------
        input_msg : dict
            Input message.
        """

        # Transfer to json string and do the encode
        # Add the "\r\n" in end for LabVIEW server to use
        msg = (json.dumps(input_msg, indent=4) + "\r\n").encode()

        self.writer.write(msg)
        await self.writer.drain()

    async def write_cmd_and_wait_result(
        self, cmd, cmd_details, timeout=5.0, custom_id=None
    ):
        """Write the command and wait for the result.

        This function is used to check the feedback of command from the server.
        The result will be stored in the queue.

        Parameters
        ----------
        cmd : str
            Command name.
        cmd_details : dict
            Command details.
        timeout : float, optional
            Timeout of command. (the default is 5.0)
        custom_id : int or None, optional
            Customed Id of command if not None. This is for the test purpose
            only. (the default is None)
        """

        self._check_cmd_expect(cmd_details)
        command_details_with_header = copy.copy(cmd_details)
        self._add_cmd_header(cmd, command_details_with_header, custom_id=custom_id)

        await asyncio.gather(
            self._write_msg_to_socket(command_details_with_header),
            self.sub_msg_continuous(10, timeout),
        )

    async def sub_msg_continuous(self, frequency, duration):
        """Subscribe the message continuously.

        Parameters
        ----------
        frequency : float
            Frequency of publishment in Hz.
        duration : float
            Duration of publishment in second.
        """

        times = int(duration * frequency)
        sleep_time = 1 / frequency

        for counter in range(times):
            await self.read(put_to_queue=True, timeout=sleep_time)

    async def read(self, put_to_queue=False, timeout=1.0):
        """Read the message.

        Parameters
        ----------
        put_to_queue : bool, optional
            Put the message into the queue or not. Print the message if False.
            (the default is False).
        timeout : float, optional
            Timeout. (the default is 1.0)
        """

        try:
            data = await asyncio.wait_for(self.reader.read(n=1000), timeout)

            if data is not None:
                dataDecode = data.decode()
                message = json.loads(dataDecode)

                if put_to_queue:
                    self.queue.put_nowait(message)
                else:
                    # Print the message
                    print(f"Received: {message}.")

        except asyncio.TimeoutError:
            if not put_to_queue:
                print("Timeout!")

        except json.JSONDecodeError:
            print(f"Can not decode the message: {dataDecode}.")

    def register_tel(self, topic, topic_details):
        """Register the telemetry.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.
        """

        topic_details_with_header = copy.copy(topic_details)
        self._add_tel_header(topic, topic_details_with_header)

        self._list_tel.append(topic_details_with_header)

    async def pub_tel_continuous(self, frequency, duration):
        """Publish the telemetry continuously.

        Parameters
        ----------
        frequency : float
            Frequency of publishment in Hz.
        duration : float
            Duration of publishment in second.
        """

        times = int(duration * frequency)
        sleep_time = 1 / frequency

        for counter in range(times):
            for tel in self._list_tel:
                await self._write_msg_to_socket(tel)
                await asyncio.sleep(0.01)

            await asyncio.sleep(sleep_time)

    async def close(self):
        """Close the connection."""

        # Write the EOF
        if self.writer.can_write_eof():
            self.writer.write_eof()

        # Close the writer
        self.writer.close()
        await self.writer.wait_closed()
