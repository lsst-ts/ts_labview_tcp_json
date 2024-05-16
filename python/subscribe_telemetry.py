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
parser.add_argument("--frec", type=int, metavar="F", default=10, help="set the frecuency in Hz of the telemetry to be published (default 10 Hz)")
parser.add_argument("--dur", type=int, metavar="D", default=2, help="set the duration in seconds of the telemetry to be published (default 2 seconds)")
args = parser.parse_args()
port_cmd = args.port_cmd
port_tel = args.port_tel
frequency = args.frec
duration = args.dur

# define the main
async def main():
    # Connect to the server
    print(f'Connect to the server.')
    await asyncio.gather(
        tcp_client_cmd.connect(localhost, port_cmd),
        tcp_client_tel.connect(localhost, port_tel),
    )
    await asyncio.sleep(1)
    
    # Subscribe the telemetry
    print(f'Receiving packets at {frequency} Hz for {duration} seconds.')
    
    time_start = time.monotonic()
    await tcp_client_tel.sub_msg_continuous(frequency, duration) 
    time_end = time.monotonic()
    
    await asyncio.sleep(2)

    # Print the elements in the queue
    qsize = tcp_client_tel.queue.qsize()
    time_duration = time_end - time_start
    rate = qsize / time_duration
    print(f'{qsize} elements were received at {rate} Hz.')
    
    # Clean the queue
    # while not tcp_client_tel.queue.empty(): 
    #   print(tcp_client_tel.queue.get_nowait()) 

    # Disconnect from the server A
    print(f'Disconnect from the server.')
    await asyncio.gather(
        tcp_client_cmd.close(),
        tcp_client_tel.close(),
    )

# Run the main        
asyncio.run(main())
time.sleep(2)
