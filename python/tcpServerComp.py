import asyncio
from tcpServer import TcpServer, MsgType


class TcpServerComp(object):
    """Component TCP/IP server.

    Attributes
    ----------
    server_cmd : TcpServer
        Server of the command and event.
    server_tel : TcpServer
        Server of the telemetry.
    """

    def __init__(self):

        self.server_cmd = TcpServer()
        self.server_tel = TcpServer()

    async def main(self, ip_addr, port_cmd, port_tel):
        """Main function.

        Parameters
        ----------
        ip_addr : str
            IP address.
        port_cmd : int
            Port of command to connect.
        port_tel : int
            Port of telemetry to connect.
        """

        await asyncio.gather(
            self.server_cmd.main(ip_addr, port_cmd, MsgType.CMDEVL),
            self.server_tel.main(ip_addr, port_tel, MsgType.TEL),
        )


if __name__ == "__main__":

    tcpServerComp = TcpServerComp()

    ip_addr = "127.0.0.1"
    port_cmd = 8888
    port_tel = 8889

    asyncio.run(tcpServerComp.main(ip_addr, port_cmd, port_tel))
