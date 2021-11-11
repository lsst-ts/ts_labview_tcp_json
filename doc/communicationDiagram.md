# Tcp Server Communication Diagram

## Overview

The Communication Diagram shows how internal objects interact in **TcpServer** top-level class, along with messages that travel from one to another.

## Diagram Conventions

The [PlantUML](https://plantuml.com) is used to draw the Communication Diagram.
Although it does not support this diagram natively, it is still possible to emulate the expected behavior.
The objects with functions related to communication are in rectangle boxes.
The arrow between objects gives the direction of communication and the related LabVIEW user event name.

## List of User Events

The following is the list of user events in **TcpServer**:

| id | User Event |
|:--:|:----------:|
| 1  | CmdRead    |
| 2  | EvtRead    |
| 3  | GenRead    |
| 4  | CmdWrite   |
| 5  | EvtWrite   |
| 6  | GenWrite   |

- `CmdRead` is used to send the `tcpPacket` to the Component if the incoming command is legal.
- `EvtRead` is used to send the `tcpPacket` to the Component if the incoming event is legal.
- `GenRead` is used to send the `tcpPacket` to the Component if the incoming message is unknown.
- `CmdWrite` is used to send the ACK to the TCP client with the command result (success or fail).
- `EvtWrite` is used to send an event to the TCP client from the Component.
- `GenWrite`  not used. Ticket [DM-32272](https://jira.lsstcorp.org/browse/DM-32272) was created to evaluate this user event is needed or not.

The following table shows the user events with their publishers and subscribers:

| User Event | Publisher | Subscriber |
|:--------:|:----------:|:-----------:|
| CmdRead  | TcpServerCmd.processCmd.vi   | ComponentSimulator.vi     |
| EvtRead  | TcpServerCmd.processEvt.vi   | ComponentSimulator.vi     |
| GenRead  | TcpServer.getClientStatus.vi | ComponentSimulator.vi     |
| GenRead  | TcpServerCmd.runServer.vi    | ComponentSimulator.vi     |
| CmdWrite | TcpServer.sendCmdStatus.vi   | TcpServerCmd.runServer.vi |
| EvtWrite | TcpServer.sendEvt.vi         | TcpServerCmd.runServer.vi |
| GenWrite |              N/A             | TcpServerCmd.runServer.vi |

This table shows the vi that publishes an user event and which vi subscribes to that user event.

**TcpServerCmd** is the class that handles commands and events, and **TcpServerTel** is the class that handles telemetry messages.
Both are part of the **TcpServer** class.
Go [here](../doc/uml/TcpServerClass.uml) to know more details about the class diagram.

The **ComponentSimulator.vi** is used to test the API and allows the user know how to use the API.
You can see that **ComponentSimulator.vi** will subscribe to the first three user events.
They are defined in the following section.

## Top-Level User Events

The top-level user events are closest to the user.
The following is the list:

| id | User Event |
|:--:|:----------:|
| 1 | CmdRead  |
| 2 | EvtRead  |
| 3 | GenRead  |

The Communication Diagram for the top-level user events is in [here](../doc/uml/TcpServerCommDiagramTopLevel.uml).

The TCP server will inspect if the received JSON packet from the TCP client is valid or not.
In the **TcpServerCmd.processCmd.vi**, it will check if the received command is registered or not.
The sequence ID will be compared with the previous messages to see it is in the order or not.
If this is a legal command, the server will send the `tcpPacket` to the Component by the `CmdRead` user event.

If the incoming message is not a command nor an event, the "unknown" `tcpPacket` will be sent to the Component using the `GenRead` user event from **TcpServerCmd.processPacket.vi**.

The **TcpServerCmd.processEvt.vi** checks the `compname` (component name) and `id`.
If the event is registered, it will be sent to the Component by the `EvtRead` user event.

For any change of TCP/IP connection status, the Component receives a `GenRead` user event from **TcpServer.getClientStatus.vi**.
It uses the `connStatusCluster` typedef with a boolean and a string.
The former gives the connection status and the latter gives the detailed information.

## Down-Level User Events

The down-level user events are not closest to the user.
The following is the list:

| id | User Event |
|:--:|:----------:|
| 4 | CmdWrite  |
| 5 | EvtWrite  |
| 6 | GenWrite  |

The Communication Diagram for the down-level user events is in [here](../doc/uml/TcpServerCommDiagramDownLevel.uml).

After the TCP server inspects if the received JSON packet from the TCP client is valid or not, the **TcpServer.sendCmdStatus.vi** sends the ACK to the **TcpServerCmd.runServer.vi** by the `CmdWrite` user event.
It uses the `ackTypeDef` with the `sequence_id` and the `cmdStatus`.

If an `event` is sent to the TCP client, the Component uses the **TcpServerCmd.sendEvt.vi** with the `event id` and the `event details`. It uses the `EvtWrite` user event.
