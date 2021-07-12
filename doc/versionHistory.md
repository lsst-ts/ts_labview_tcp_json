# Version History

0.1.4

- LabVIEW Component can register events using registerEvent.vi.
- TCP Server can filter incoming events checking if are registered or not.
- Replace event names for Msg (message) to have more generic functions and use them in Events and Telemetry.
- Modify Cmd and Event user event instances for CmdRead, CmdWrite, MsgRead and MsgWrite.
- Add the new user event instance GenRead and GenWrite to handle generic packets in TCP Server.
- Two string indicators to receive Commands and Events independiently.

0.1.3

- Add evtDetailsToJSON.vi to format event name and event details into JSON string.
- Add error constant -375003 when User puts an empty string in evtName.
- Add test case for evtDetailsToJSON.vi.
- Remove tcpConnectionId references and replace them by Notifier with tcpConnectionId in all dependecies.

0.1.2

- TCP Server sends noAck to TCP Client if command received is not registered.
- TCP Server replies noAck to TCP Client when cmdId and lastCmdId are different by more than 1 unit. 
- TCP Server sends ack to TCP Client for every command is received and if this command is registered.
- TCP Client decides which cmdId is the first if the received command is registered, and TCP Server saves it as lastCmdId.

0.1.1

- Add the Python **TcpServerComp** class.
- Update the details of JSON string in **README.md**.
- Support to assign the specific command ID instead of the auto-generated one.

0.1.0

- Add the LabVIEW TCP server.
- Add the Component Simulator to interact with server and slient.
- Add the Jenkinsfile to do Unit Test.

0.0.2

- Publish and subscribe the telemetry in Python test TCP/IP client.
- Add the Python **TcpServer** class.

0.0.1

- Add the Python test scripts of TCP/IP client and server.

0.0.0

- Initial add of the package.
