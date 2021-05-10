import asyncio
from enum import auto, IntEnum
import json
import copy


class TopicType(IntEnum):
    CMD = 1
    EVT = auto()


class TcpClient(object):
    """TCP/IP client."""

    def __init__(self):

        # Reader of socker
        self.reader = None

        # Writer of socker
        self.writer = None

        # Unique ID
        self._uniq_id = self._uniq_id_gen()

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

    async def write(self, topic, topic_details, topic_type):
        """Write the message.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.
        topic_type : TopicType
            Topic type.
        """

        topic_details_with_header = copy.copy(topic_details)
        if topic_type == TopicType.CMD:
            self._add_cmd_header(topic, topic_details_with_header)
        elif topic_type == TopicType.EVT:
            self._add_evt_header(topic, topic_details_with_header)
        else:
            raise ValueError(f"The topic type: {topic_type} is not supported.")

        # Transfer to json string and do the encode
        # Add the "\r\n" in end for LabVIEW server to use
        msg = (json.dumps(topic_details_with_header, indent=4) + "\r\n").encode()

        self.writer.write(msg)
        await self.writer.drain()

    def _add_cmd_header(self, topic, topic_details):
        """Add the command header.

        Parameters
        ----------
        topic : str
            Topic name.
        topic_details : dict
            Topic details.

        Raises
        ------
        ValueError
            The 'cmdName' is in the topic details already.
        """

        if "cmdName" in topic_details.keys():
            raise ValueError("The 'cmdName' is in the topic details already.")

        topic_details["cmdName"] = topic
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

    async def read(self, timeout=1.0):
        """Read the message.

        Parameters
        ----------
        timeout : float, optional
            Timeout. (the default is 1.0)
        """

        try:
            data = await asyncio.wait_for(self.reader.read(n=1000), timeout)

            if data is not None:
                message = json.loads(data.decode())

                # Print the message
                print(f"Received: {message}.")

        except asyncio.TimeoutError:
            print("Timeout!")

    async def close(self):
        """Close the connection."""

        # Close the writer
        self.writer.close()
        await self.writer.wait_closed()
