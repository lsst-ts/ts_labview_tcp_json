import asyncio
import json


async def handle_echo(reader, writer):
    """Handle the echo.

    Parameters
    ----------
    reader : asyncio.StreamReader
        Reader of the socket.
    writer : asyncio.StreamWriter
        Writer of the socket.
    """

    while True:

        try:
            dataEncode = await asyncio.wait_for(reader.read(n=1000), 1)

            data = dataEncode.decode()
            if data is not None or data != "":
                message = json.loads(data)

                # Print the message
                addr = writer.get_extra_info("peername")
                print(f"Received {message} from {addr}")

                # Acknowledge the command
                await _ackCmd(writer, message)

        except asyncio.TimeoutError:
            await asyncio.sleep(1)

        if reader.at_eof():
            print("Command reader at eof; closing client")
            break

    print("Close the client socket")
    writer.close()
    await writer.wait_closed()


async def _ackCmd(writer, msg):
    """Acknowledgement the command.

    Parameters
    ----------
    writer : asyncio.StreamWriter
        Writer of the socket.
    msg : dict
        Message received.
    """

    if "cmdName" in msg.keys():
        ackMsg = dict()
        ackMsg["cmdName"] = msg["cmdName"]
        ackMsg["cmdId"] = msg["cmdId"]
        ackMsg["cmdStatus"] = "ack"

        msgEncode = json.dumps(ackMsg, indent=4).encode()

        writer.write(msgEncode)
        await writer.drain()


if __name__ == "__main__":

    loop = asyncio.get_event_loop()
    coro = asyncio.start_server(handle_echo, "127.0.0.1", 8888, loop=loop)
    server = loop.run_until_complete(coro)

    # Serve requests until Ctrl+C is pressed
    print("Serving on {}".format(server.sockets[0].getsockname()))
    try:
        loop.run_forever()
    except KeyboardInterrupt:
        pass

    # Close the server
    server.close()
    loop.run_until_complete(server.wait_closed())
    loop.close()

    print("Server is closed.")
