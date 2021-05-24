import asyncio
from enum import auto, IntEnum
import json


class MsgType(IntEnum):
    CMDEVL = 1
    TEL = auto()


class TcpServer(object):
    """TCP/IP server.

    Attributes
    ----------
    reader : asyncio.StreamReader or None
        Reader of socker.
    writer : asyncio.StreamWriter or None
        Writer of the socket.
    server : asyncio.base_events.Server
        TCP/IP server.
    loop : asyncio.unix_events._UnixSelectorEventLoop or None.
        Event loop in the running.
    task_monitor_msg : asyncio.Task or None
        Task to monitor the incoming message.
    done_task : asyncio.Future or None
        Task is done or not.
    last_cmd_id : int
        Last command ID.
    """

    def __init__(self):

        self.reader = None
        self.writer = None

        self.server = None

        self.loop = None
        self.task_monitor_msg = None
        self.done_task = None

        self.last_cmd_id = -1

    async def start_server(self, ip_addr, port, msg_type):
        """Run to the server.

        Parameters
        ----------
        ip_addr : str
            IP address.
        port : int
            Port to connect.
        msg_type : MsgType
            Message type to listen.
        """

        self.server = await asyncio.start_server(
            self.set_reader_writer, host=ip_addr, port=port
        )

        print("Wait for the connection.")

        while not self.is_connected():
            await asyncio.sleep(1)

        # Create the task to monitor the incoming message from client
        self.task_monitor_msg = asyncio.create_task(self.monitor_msg(msg_type))

    def set_reader_writer(self, reader, writer):
        """Set the reader and writer.

        Parameters
        ----------
        reader : asyncio.StreamReader
            Reader of the socket.
        writer : asyncio.StreamWriter
            Writer of the socket.
        """

        self.reader = reader
        self.writer = writer

    def is_connected(self):
        """Is connected with the client or not.

        Returns
        -------
        bool
            True if is connected. Else, False.
        """

        if self.writer is None or self.reader is None:
            return False
        else:
            return True

    async def monitor_msg(self, msg_type):
        """Monitor the message.

        Parameters
        ----------
        msg_type : MsgType
            Message type to listen.

        Raises
        ------
        ValueError
            This message type is not supported.
        """

        # Client address
        addr = self.writer.get_extra_info("peername")

        while True:

            try:

                data_encode = await asyncio.wait_for(self.reader.read(n=1000), 1)

                if self.reader.at_eof():
                    if msg_type == MsgType.CMDEVL:
                        print("Command/event reader at eof; closing client...")
                    elif msg_type == MsgType.TEL:
                        print("Telemetry reader at eof; closing client...")
                    else:
                        raise ValueError(
                            f"This message type: {msg_type} is not supported."
                        )
                    break

                data = data_encode.decode()
                if data is not None or data != "":

                    message = json.loads(data)

                    # Print the message
                    print(f"Received {message} from {addr}.")

                    # Deal with the message
                    await self._deal_msg(message, msg_type)

            except asyncio.TimeoutError:
                await asyncio.sleep(0.1)

            except json.JSONDecodeError:
                print(f"Can not decode the message: {data}.")

        self.done_task.set_result("Monitor is done.")

    async def _deal_msg(self, msg, msg_type):
        """Deal with the incoming message.

        Parameters
        ----------
        msg : dict
            Message received.
        msg_type : MsgType
            Message type to listen.

        Raises
        ------
        ValueError
            This message type is not supported.
        """

        if msg_type == MsgType.CMDEVL:
            await self._deal_cmd(msg)
            self._deal_evt(msg)
        elif msg_type == MsgType.TEL:
            self._deal_tel(msg)
        else:
            raise ValueError(f"This message type: {msg_type} is not supported.")

    async def _deal_cmd(self, msg):
        """Deal with the command.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        if "cmdName" in msg.keys():
            # Acknowledge the command
            await self._ack_cmd(msg)
            await asyncio.sleep(0.01)

            # Acknowledge the command with noAck
            await self._noack_cmd_id(msg)

            # Reply the message
            await self._reply_cmd(msg)
            await asyncio.sleep(0.01)

    async def _ack_cmd(self, msg):
        """Acknowledgement the command.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        ack_msg = dict()
        ack_msg["cmdName"] = msg["cmdName"]
        ack_msg["cmdId"] = msg["cmdId"]
        ack_msg["cmdStatus"] = "ack"

        await self._write_msg_to_socket(ack_msg)

    async def _write_msg_to_socket(self, input_msg):
        """Write the message to socket.

        Parameters
        ----------
        input_msg : dict
            Input message.
        """

        # Transfer to json string and do the encode
        msg = json.dumps(input_msg, indent=4).encode()

        self.writer.write(msg)
        await self.writer.drain()

    async def _noack_cmd_id(self, msg):
        """Acknowledgement the command with noAck based on the command ID.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        diff = msg["cmdId"] - self.last_cmd_id
        if diff > 1:
            noack_msg = dict()
            noack_msg["cmdStatus"] = "noAck"
            for noack_id in range(self.last_cmd_id + 1, msg["cmdId"]):
                noack_msg["cmdId"] = noack_id

                await self._write_msg_to_socket(noack_msg)
                await asyncio.sleep(0.01)

        self.last_cmd_id = msg["cmdId"]

    async def _reply_cmd(self, msg):
        """Reply the command.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        if "cmdExpect" in msg.keys():
            reply_msg = dict()
            reply_msg["cmdName"] = msg["cmdName"]
            reply_msg["cmdId"] = msg["cmdId"]
            reply_msg["cmdStatus"] = msg["cmdExpect"]

            msg_encode = json.dumps(reply_msg, indent=4).encode()

            self.writer.write(msg_encode)
            await self.writer.drain()

    def _deal_evt(self, msg):
        """Deal with the event.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        if "evtName" in msg.keys():
            if "compName" in msg.keys():
                comp_name = msg["compName"]
                print(f"Received the event from the {comp_name}")
            else:
                print("The message should contain the 'compName'.")

    def _deal_tel(self, msg):
        """Deal with the telemetry.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        if "telName" in msg.keys():
            if "compName" in msg.keys():
                comp_name = msg["compName"]
                print(f"Received the telemetry from the {comp_name}")
            else:
                print("The message should contain the 'compName'.")

    async def main(self, ip_addr, port, msg_type):
        """Main function.

        Parameters
        ----------
        ip_addr : str
            IP address.
        port : int
            Port to connect.
        msg_type : MsgType
            Message type to listen.
        """

        self.loop = asyncio.get_running_loop()
        self.done_task = self.loop.create_future()

        await self.start_server(ip_addr, port, msg_type)

        print("Serving on {}.".format(self.server.sockets[0].getsockname()))

        # Check the task is done or not. And print the result.
        print(await self.done_task)

        print("Close the client socket.")
        await self.close()

    async def close(self):
        """Close the connection."""

        # Close the writer
        self.writer.close()
        await self.writer.wait_closed()
