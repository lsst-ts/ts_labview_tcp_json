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
parser.add_argument("--ncmd", type=int, metavar="N", default=10, help="set the number of commands to be sent (default 10)")
parser.add_argument("--frec", type=int, metavar="F", default=10, help="set the frecuency in Hz of the telemetry to be published (default 10 Hz)")
parser.add_argument("--dur", type=int, metavar="D", default=2, help="set the duration in seconds of the telemetry to be published (default 2 seconds)")
args = parser.parse_args()
port_cmd = args.port_cmd
port_tel = args.port_tel
num_cmd = args.ncmd
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

    # Send commands based on user input
    print(f'Sending {num_cmd} commands.')
    for i in range(num_cmd):
        cmd_details = {"move": i}
        await tcp_client_cmd.write("move", cmd_details, TopicType.CMD)
        await asyncio.sleep(0.5)

    # Send 5 events
    print(f'Sending events.')
    evt_details = {"compName": "MTMount"}
    event_names = ["elevationInPosition", "azimuthInPosition", "elevationInPosition", "azimuthInPosition", "elevationInPosition", "azimuthInPosition"]
    for i in event_names:
        await tcp_client_cmd.write(i, evt_details, TopicType.EVT)
        await asyncio.sleep(0.5)

    # Issue a command with custom id and wait for response
    cmd_details = {"state": 1, "move": [1, 2, 3], "cmdExpect": "success"} 
    await tcp_client_cmd.write_cmd_and_wait_result("move", cmd_details, custom_id=20) 
    while not tcp_client_cmd.queue.empty(): 
        print(tcp_client_cmd.queue.get_nowait()) 

    # Wait for an event sent by the component simulator
    print(f'You have 10 seconds to send an event from the Component Simulator.')
    await tcp_client_cmd.read(timeout=10.0) 
     
    # Wait for telemetry sent by the component simulator
    print(f'You have 10 seconds to send telemetry from the Component Simulator.')
    await tcp_client_tel.read(timeout=10.0) 

    # Publish multiple telemetry to the component simulator
    print(f'Publishing multiple telemetry to the Component Simulator.')
    print(f'Frequency = {frequency} Hz.')
    print(f'Duration = {duration} seconds.')
    tel_details = {"state": 2, "compName": "MTMount"} 
    tcp_client_tel.register_tel("elevation", tel_details) 
    tcp_client_tel.register_tel("azimuth", tel_details) 
    await tcp_client_tel.pub_tel_continuous(frequency, duration) 
    await asyncio.sleep(3)

    # Disconnect from the server A
    print(f'Disconnect from the server.')
    await asyncio.gather(
        tcp_client_cmd.close(),
        tcp_client_tel.close(),
    )

# Run the main        
asyncio.run(main())