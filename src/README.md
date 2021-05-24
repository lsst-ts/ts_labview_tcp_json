# Use of LabVIEW Component Simulator

The Component Simulator allows you to call the a LabVIEW TcpServer to test the tcp communication between the tcp Server and the tcp Client. The LabVIEW Tcp Server receives json commands from a Python Tcp Client, and send Ack and Events back to the Client, using tcp packets.

## Platform

- LabVIEW Professional 2018 Sp1

## Needed Package

- Caraya 1.0.2.115 (for Unit Testing)

## Use of TcpServer

**Start Component Simulator:**

From terminal:

Go to the build directory:
```sh
cd  ts_labview_tcp_json/build
```
Execute Component Simulator:

```sh
./componentSimulator
```

Check:
- IP = 127.0.0.1
- Port = 8888

note: this configuration cannot be modify in runtime

**Start Tcp Client:**

Go to python tcp client directory:

```sh
cd ts_labview_tcp_json/python
```
Use IPython to interact with tcp server:

```sh
ipython
```
To start Tcp Client, do:

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
The command should appears in the TcpServer  json_cmd indicator.

To receive the ack sent by the server, do:

```python
await tcpClient.read(timeout=1.0)
```

The ack will appear with the same "cmdId" received by the server, and the "cmdStatus" (ack or noAck).

Repeat same command and you will see that the "cmdId" will increment every time you send the command from client.

To modify the Command Status, do:

- Go to tab "Send Ack Cmd Status"
- Press "Send Ack" to send success to the client
- Press "Send noAck" to send fail to the client

After that, you have to send another command from tcp Client and do the timeout command, you will see that the ack received has the same cmdId that the last command received in Server.

To receive and Event in the Client, do:

- Go to tab "Send Event" in tcp Server
- Modify the "Event Name" control
- Press "Send Event" button
- Go the python tcp Client
- Write the tcpClient.read command, 

```python
await tcpClient.read(timeout=10.0)
```
You should see the event name you wrote in tcp Server.

To close the tcp Client, do:

```python
await tcpClient.close()
```

To stop the tcp Server:

- Go tp tcp Server
- Press "Stop Server" button

To close the Component Simulator:

- press "Stop Simulator" button 

note: you only can stop the simulator if you stop de server before.

note: if you want to stop the client, while the server is running, the server will wait for a tcp client connection, until you stop the server. If you want to start the client again, don´t stop the server and try to connect the client.



