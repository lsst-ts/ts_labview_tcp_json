# Use of Python Test Scripts

The Python test scripts to test the TCP/IP communication with the JSON string packet.
These are used with the LabVIEW project to test the communication and interface.

## Platform

- python: 3.7.10

## Needed Package

- [black](https://github.com/psf/black) (optional)

## Format the Code

Use the `black` (v19.10b0) to format the Python code.

## Use TCP/IP Server

Under the command line, do:

```bash
python tcpServerComp.py
```

The localhost and ports are hard-coded in the script.
The ports of command and telemetry are 8888 and 8889.
The server will check the incoming message in the frequency of 10 Hz.
Use the Ctrl+C to close the server.

For the test purpose, you can put `cmdExpect` in command details to get the result when you use the client.

## Use TCP/IP Client

Assume the IPython is used.
To set up the client and connects to the localhost server (assume the ports of command and telemetry are 8888 and 8889), do:

```python
import asyncio
from tcpClient import TopicType, TcpClient

tcp_client_cmd = TcpClient()
tcp_client_tel = TcpClient() 

localhost = "127.0.0.1"
await asyncio.gather(
    tcp_client_cmd.connect(localhost, 8888),
    tcp_client_tel.connect(localhost, 8889),
)
```

To write a command message, do:

```python
cmd_details = {"state": 1, "move": [1, 2, 3]}
await tcp_client_cmd.write("cmd_name", cmd_details, TopicType.CMD)
```

For the event, do:

```python
evt_details = {"state": 2, "compName": "comp1"}
await tcp_client_cmd.write("evt_name", evt_details, TopicType.EVT)
```

For the telemetry, do:

```python
tel_details = {"state": 2, "compName": "comp2"}
await tcp_client_tel.write("tel_name", tel_details, TopicType.TEL)
```

If you want to issue a command and check the results from server, do:

```python
cmd_details = {"state": 1, "move": [1, 2, 3], "cmdExpect": "success"}
await tcp_client_cmd.write_cmd_and_wait_result("cmd_name", cmd_details)
```

The result will be stored in `tcp_client_cmd.queue`.
The result of command will base on the `cmdExpect`.
This is intentional for the test purpose only.
You should see the acknowledgement and result of command in the queue by:

```python
while not tcp_client_cmd.queue.empty():
    print(tcp_client_cmd.queue.get_nowait())
```

The argument of `custom_id` in `write()` can be used to put a specific Id for the test purpose.
For example, assume your command ID is 2 now, do:

```python
custom_id = 5
await tcp_client_cmd.write_cmd_and_wait_result("cmd_name", cmd_details, custom_id=custom_id)
```

To publish multiple telemetry continuously, do the register first followed by publishment:

```python
tcp_client_tel.register_tel("tel_name_1", tel_details)
tcp_client_tel.register_tel("tel_name_2", tel_details)

frequency = 10
duration = 2
await tcp_client_tel.pub_tel_continuous(frequency, duration)
```

To reset all registered telemetry, do:

```python
tcp_client_tel.reset_list_tel()
```

To get the message from the command port, do:

```python
await tcp_client_cmd.read(timeout=1.0)
```

To subscribe the message continuously from the telemetry port and put the received message into queue, do:

```python
await tcp_client_tel.sub_msg_continuous(frequency, duration)
```

It is normal to do the command and publish the telemetry in the same time.
The following is an example to do this:

```python
async def cmd_at_specific_time(cmd_time_in_sec, client, cmd_topic, cmd_details):
    await asyncio.sleep(cmd_time_in_sec)
    await client.write_cmd_and_wait_result(cmd_topic, cmd_details)

frequency = 2
duration = 10
await asyncio.gather(
    cmd_at_specific_time(3, tcp_client_cmd, "cmd_name", cmd_details),
    tcp_client_tel.pub_tel_continuous(frequency, duration),
)
```

To close the client, do:

```python
await asyncio.gather(
    tcp_client_cmd.close(),
    tcp_client_tel.close(),
)
```
