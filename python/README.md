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
Use the Ctrl+C to close the server.

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

To get the message, do:

```python
await tcpClient.read(timeout=1.0)
```

To close the client, do:

```python
await tcpClient.close()
```
