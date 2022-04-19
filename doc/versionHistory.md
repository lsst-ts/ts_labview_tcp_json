# Version History

0.4.1

- Add **integrationTest.vi** in `test/` directory.
- Modify **testProcessEvt.vi**, **testSendCmdStatus.vi**, and **testSendEvent.vi** to avoid blocking test when an error is in the prevoius VI.

0.4.0

- Modify **TcpServerBase.tcpServerSenderLoop.vi** to detect when Python TCP client is disconnected.
User will receive error 1 or 66 when this happens, only one time.
- Add **TcpServerBase.flushQueueTcpClient.vi** to flush `queueTcpClient` when Python TCP client is disconnected and there are still elements in the queue.
- Modify **TcpServerCmd.tcpServerStateMachine.vi** to flush `TcpServerCmd.queueTcpClient`.
- Modify **TcpServerTel.tcpServerStateMachine.vi** to flush `TcpServerTel.queueTcpClient`.

0.3.9

- Replace `areClientsConnected` boolean by `areClientsConnected` enum in **TcpServerBase.connStatusCluster.ctl**. 
- Update `README.md` in the `src/` directory.
- Update `userManual.md` in the `doc/` directory.
- The user needs to update the use of **GenRead** user event to judge the connection is on or off with the `areClientsConnected` enum.

0.3.8

- Add the `communicationDiagramQueues.md` in the `doc/` directory.
- Add the `commandToComponent.uml`, `flushTelQueue.uml`, `getQueueStatus.uml`, `getTelElement.uml`, `telemetryToClient.uml`, and `telemetryToComponent.uml` in the `doc/uml` directory.
- Update `README.md` in the `src/` directory.

0.3.7

- Create the **configServerTypeDef&#46;ctl** to help to configure the server.
This is used by the **TcpServer.configServer&#46;vi**.
User needs to update this change in its callers.
- Rename **serverTimeout (ms)** by **timeoutServerInMs** and its dependencies.
- Rename **tcpClientQueueMaxSize** by **maxSizeQueueTcpClient** and its dependencies.
- Rename **maxSizeQueueTel** by **maxSizeQueueTcpClientFromDds** and its dependencies.
- Rename **telQueueServerTimeout** and **timeoutQueueTel**  by **timeoutQueueTcpClientFromDds** and its dependencies.
- Modify **isQueueTcpClientFull&#46;vi**, **getTelElement&#46;vi** and **flushTelQueue&#46;vi** in `TcpServer` class.
User needs to update these vis in their callers."
- Update `userManual.md` in the `doc/` directory.
- Update `README.md` in the `simulator/` directory.
- Update `README.md` in the `src/` directory.

0.3.6

- Rename **tcpServerQueue** by **queueTcpServer** and update its dependences.
- Rename **tcpclientQueue** by **queueTcpClient** and update its dependences.
- Rename **tcpClientQueueFromDds** by **queueTcpClientFromDds** and update its dependences.
- Rename **isTcpClientQueueFull.vi** by **isQueueTcpClientFull.vi** in `TcpServer` class so the user will need to update this VI in its callers.

0.3.5

- Add `server timeout` value to avoid the blocking code in **TCP Read&#46;vi**.
This is done in **TcpServerCmd&#46;tcpServerStateMachine&#46;vi** and in **TcpServerTel&#46;tcpServerStateMachine&#46;vi**.

0.3.4

- Create the `userManual.md` in the `doc/` directory.

0.3.3

- Modify **TcpServerCmd.processCmd.vi** to save the last `sequence_id`, even though the received command is not registered.

0.3.2

- Create **TcpServerBase.clearErrorAndSendExplanation.vi** to inform the errors in TCP server.
- Move `GenRead` user event from `TcpServerCmd` to `TcpServerBase`.
- Create **TcpServerBase.regGenReadUserEvent.vi** and **TcpServerBase.unregGenReadUserEvent.vi**.

0.3.1

- Remove the `GenWrite` user event from the project.
- Update the **testRegUserEvent.vi**`.
- Update the `communicationDiagram.md` file.

0.3.0

- Add the `TcpServerCommDiagramTopLevel.uml` and `TcpServerCommDiagramLowLevel.uml` in `doc/uml` directory.
- Add `communicationDiagram.md` to explain both uml files.

0.2.9

- Replace the use of user events by occurrence to stop the servers.
- This will help to stop the servers as soon as possible, requiered in [ticket DM-31770](https://jira.lsstcorp.org/browse/DM-31770).

0.2.8

- Add the `stateMachineTcpServerCmd.uml` in `doc/uml` directory.

0.2.7

- Modify **sendCmdStatus.vi** to receive the `sequence_id` as an input instead of the JSON packet.

0.2.6

- TCP Server provides the TCP/IP connection status to LabVIEW Component.
- Create the **TcpServer.getClientStatus.vi** to send an user event to LabVIEW Component.
This vi is stopped with an occurrence sent by **TcpServer.stopGetClientStatus.vi**.

0.2.5

- Solve bug detected in [ticket DM-31916](https://jira.lsstcorp.org/browse/DM-31916).
- TCP Server now sends same TCP packet that comes from TCP Client, after processing it.

0.2.4

- Replace `Line Feed` constant by `End of Line` constant in **handleMsgDetails.vi**.

0.2.3

- **TcpServerCmd.tcpServerStateMachine.vi** and **TcpServerTel.tcpServerStateMachine.vi** share the `connectionID` using a notifier when TCP Client just connects.

0.2.2

- TCP Server can receive telemetry from TCP Client.
- TCP Server can send telemetry to TCP Client.
- Move the attributes of `firstPacket`, `firstConnection` and `lastSequenceId` from **tcpServerBase** to **tcpServerCmd**.

0.2.1

- Create **sendEvt.vi** to write the event to TCP Client.
- Modify **sendCmdStatus.vi** to hide user event instance to the user.

0.2.0

- Create the **default.ini** file to store commands, events and telemetry that will be registerd by TCP Server.
- Provide a group of functions to read this **default.ini** file.
- Create `simulator/README.md` file.
- Modify `{root}/README.md` and `src/README.md` to point the `simulator/README.md` file out.

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
