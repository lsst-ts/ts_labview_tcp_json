# Version History

0.1.9

- Remove **firstConnection** and **firstPacket** booleans from **tcpPacketTypeDef.ctl**.
- Remove **tcpPacketTypeDef.ctl** from project.

0.1.8

- Update the JSON packet interface in LabVIEW TCP Server.
- Change **cmdName**, **evtNane** and **telName** by **id**.
- Change **cmdId** by **sequence_id**.
- Support the custom message in LabVIEW TCP Server.
- Add a new string indicator in Component Simulator to get the custom message.

0.1.7

- Update the JSON packet interface in Python TCP Client.
- Support the custom message.
- Remove the restriction that the sending message from server needs to have a short sleep time by using the `readuntil()` in **asyncio.StreamReader**.

0.1.6

- Create a new class hierarchy with **TcpServerBase** as the parent class, while **TcpServerCmd** and **TcpServerTel** are children of **TcpServerBase**.
- **TcpServerCmd** will handle commands and events.
- **TcpServerTel** will handle telemetry.

0.1.5

- Provide a group of functions to transform the controls to string for the event/telemetry publish, in Polymorphic VIs.

0.1.4

- LabVIEW Component can register events using `registerEvent.vi`.
- TCP Server can filter incoming events checking if are registered or not.
- Replace event names for Msg (message) to have more generic functions and use them in Events and Telemetry.
- Modify Cmd and Event user event instances for CmdRead, CmdWrite, MsgRead and MsgWrite.
- Add the new user event instance GenRead and GenWrite to handle generic packets in TCP Server.
- Two string indicators to receive Commands and Events independently in Component Simulator.

0.1.3

- Add `evtDetailsToJSON.vi` to format event name and event details into JSON string.
- Add error constant -375003 when User puts an empty string in evtName.
- Add test case for `evtDetailsToJSON.vi`.
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
