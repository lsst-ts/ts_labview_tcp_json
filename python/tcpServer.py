import asyncio
import json


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
    """

    def __init__(self):

        self.reader = None
        self.writer = None

        self.server = None

        self.loop = None
        self.task_monitor_msg = None
        self.done_task = None

    async def start_server(self, ip_addr, port):
        """Run to the server.

        Parameters
        ----------
        ip_addr : str
            IP address.
        port : int
            Port to connect.
        """

        self.server = await asyncio.start_server(
            self.set_reader_writer, host=ip_addr, port=port
        )

        print("Wait for the connection.")

        while not self.is_connected():
            await asyncio.sleep(1)

        # Create the task to monitor the incoming message from client
        self.task_monitor_msg = asyncio.create_task(self.monitor_msg())

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

    async def monitor_msg(self):
        """Monitor the message."""

        # Client address
        addr = self.writer.get_extra_info("peername")

        while True:

            try:

                dataEncode = await asyncio.wait_for(self.reader.read(n=1000), 1)

                if self.reader.at_eof():
                    print("Command reader at eof; closing client...")
                    break

                data = dataEncode.decode()
                if data is not None or data != "":

                    message = json.loads(data)

                    # Print the message
                    print(f"Received {message} from {addr}.")

                    # Acknowledge the command
                    await self._ack_cmd(message)
                    await asyncio.sleep(0.01)

                    # Reply the message
                    await self._reply_cmd(message)
                    await asyncio.sleep(0.01)

            except asyncio.TimeoutError:
                await asyncio.sleep(0.1)

            except json.JSONDecodeError:
                print(f"Can not decode the message: {data}.")

        self.done_task.set_result("Monitor is done.")

    async def _ack_cmd(self, msg):
        """Acknowledgement the command.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        if "cmdName" in msg.keys():
            ackMsg = dict()
            ackMsg["cmdName"] = msg["cmdName"]
            ackMsg["cmdId"] = msg["cmdId"]
            ackMsg["cmdStatus"] = "ack"

            msgEncode = json.dumps(ackMsg, indent=4).encode()

            self.writer.write(msgEncode)
            await self.writer.drain()

    async def _reply_cmd(self, msg):
        """Reply the command.

        Parameters
        ----------
        msg : dict
            Message received.
        """

        if "cmdName" in msg.keys() and "cmdExpect" in msg.keys():
            replyMsg = dict()
            replyMsg["cmdName"] = msg["cmdName"]
            replyMsg["cmdId"] = msg["cmdId"]
            replyMsg["cmdStatus"] = msg["cmdExpect"]

            msgEncode = json.dumps(replyMsg, indent=4).encode()

            self.writer.write(msgEncode)
            await self.writer.drain()

    async def main(self, ip_addr, port):
        """Main function.

        Parameters
        ----------
        ip_addr : str
            IP address.
        port : int
            Port to connect.
        """

        self.loop = asyncio.get_running_loop()
        self.done_task = self.loop.create_future()

        await self.start_server(ip_addr, port)

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


if __name__ == "__main__":

    tcpServer = TcpServer()

    ip_addr = "127.0.0.1"
    port = 8888
    asyncio.run(tcpServer.main(ip_addr, port))
