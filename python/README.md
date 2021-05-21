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
python tcpServer.py
```

The localhost and port (8888) are hard-coded in the script.
The server will check the incoming message in the frequency of 10 Hz.
Use the Ctrl+C to close the server.

For the test purpose, you can put `cmdExpect` in command details to get the result when you use the client.

## Use TCP/IP Client

Assume the IPython is used.
To set up the client and connects to the localhost server (assume the port is `8888`), do:

```python
from tcpClient import TopicType, TcpClient
tcpClient = TcpClient()
await tcpClient.connect("127.0.0.1", 8888)
```

To write a command message, do:

```python
cmd_details = {"state": 1, "move": [1, 2, 3]}
await tcpClient.write("cmd_name", cmd_details, TopicType.CMD)
```

For the event, do:

```python
evt_details = {"state": 2}
await tcpClient.write("evt_name", evt_details, TopicType.EVT)
```

For the telemetry, do:

```python
tel_details = {"state": 2}
await tcpClient.write("tel_name", tel_details, TopicType.TEL)
```

If you want to issue a command and check the results from server, do:

```python
cmd_details = {"state": 1, "move": [1, 2, 3], "cmdExpect": "success"}
await tcpClient.write_cmd_and_wait_result("cmd_name", cmd_details)
```

The result will be stored in `tcpClient.queue`.
The result of command will base on the `cmdExpect`.
This is intentional for the test purpose only.
You should see the acknowledgement and result of command in the queue.

To publish multiple telemetry continuously, do the register first followed by publishment:

```python
tcpClient.register_tel("tel_name_1", tel_details)
tcpClient.register_tel("tel_name_2", tel_details)

frequency = 10
duration = 2
await tcpClient.pub_tel_continuous(frequency, duration)
```

To reset all registed telemetry, do:

```python
tcpClient.reset_list_tel()
```

To get the message, do:

```python
await tcpClient.read(timeout=1.0)
```

To subscribe the message continuously from server and put the received message into queue, do:

```python
await tcpClient.sub_msg_continuous(frequency, duration)
```

To close the client, do:

```python
await tcpClient.close()
```
