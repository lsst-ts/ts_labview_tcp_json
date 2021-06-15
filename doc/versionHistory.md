# Version History

0.1.2

- TCP Server sends noAck to TCP Client if command recived is not registered.
- TCP Server replies noAck to TCP Client when cmdId and lastCmdId are different by more than 1 unit.
- TCP Server sends ack to TCP Client for every commmad is received.
- TCP Client decides which cmdId is the first, and TCP Server saves it as lastCmdId.

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
