#!/usr/bin/env python3

import asyncio
import time
from tcpClient import TopicType, TcpClient

tcp_client_cmd = TcpClient()
tcp_client_tel = TcpClient() 

localhost = "127.0.0.1"

# define the main
async def main():
    # Connect to the server B
    print(f'Connect to the server B.')
    await asyncio.gather(
        tcp_client_cmd.connect(localhost, 50010),
        tcp_client_tel.connect(localhost, 50011),
    )
    await asyncio.sleep(1)

    # Send 5 commands
    print(f'Sending commands.')
    cmd_details = {"move": [1, 2, 3]}
    for i in range(10):
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

    # Wait for an event sent by the component simulator B
    print(f'You have 10 seconds to send an event from the Component Simulator B.')
    await tcp_client_cmd.read(timeout=10.0) 
     
    # Wait for telemetry sent by the component simulator B
    print(f'You have 10 seconds to send telemetry from the Component Simulator B.')
    await tcp_client_tel.read(timeout=10.0) 
    
    # Publish multiple telemetry to the component simulator B
    print(f'Publishing multiple telemetry to the Component Simulator B.')
    tel_details = {"state": 2, "compName": "MTMount"} 
    tcp_client_tel.register_tel("elevation", tel_details) 
    tcp_client_tel.register_tel("azimuth", tel_details) 
    frequency = 10 
    duration = 2 
    await tcp_client_tel.pub_tel_continuous(frequency, duration) 
    await asyncio.sleep(3)

    # Disconnect from the server B
    print(f'Disconnect from the server B.')
    await asyncio.gather(
        tcp_client_cmd.close(),
        tcp_client_tel.close(),
    )

# Run the main        
asyncio.run(main())
