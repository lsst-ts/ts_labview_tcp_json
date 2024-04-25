#!/usr/bin/env python3

import asyncio
from inspect import ArgSpec
import time
import argparse
from tcpClient import TopicType, TcpClient

tcp_client_cmd = TcpClient()
tcp_client_tel = TcpClient() 

localhost = "127.0.0.1"

# Set the parser
parser = argparse.ArgumentParser()
parser.add_argument("port_cmd", type=int, metavar="pcmd", help="set the command port")
parser.add_argument("port_tel", type=int, metavar="ptel", help="set the telemetry port")
args = parser.parse_args()
port_cmd = args.port_cmd
port_tel = args.port_tel
frequency = 10

# define the main
async def main(duration):
    # Connect to the server
    print(f'Connect to the server.')
    await asyncio.gather(
        tcp_client_cmd.connect(localhost, port_cmd),
        tcp_client_tel.connect(localhost, port_tel),
    )
    await asyncio.sleep(1)

    # Publish multiple telemetry to the component simulator
    print(f'Publishing multiple telemetry to the Component Simulator.')
    number = 5  # times to run the next for loop
    print(f'Frequency = {frequency} Hz.')
    print(f'Duration = {duration} seconds.')
    tel_details = {"state": 2, "compName": "MTMount"} 
    tcp_client_tel.register_tel("elevation", tel_details) 
    await tcp_client_tel.pub_tel_continuous(frequency, duration) 
    await asyncio.sleep(2)

    # Disconnect from the server A
    print(f'Disconnect from the server.')
    await asyncio.gather(
        tcp_client_cmd.close(),
        tcp_client_tel.close(),
    )

# Run the main        
asyncio.run(main(2))
time.sleep(2)
asyncio.run(main(10))
time.sleep(2)
