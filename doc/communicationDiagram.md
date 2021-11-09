# Tcp Server Communication Diagram

## Overview

The Communication Diagram shows how objects interact in TcpServer, along with messages that travel from one to another.

## Diagram Conventions

We will use PlantUML to draw the Communication Diagram, but it does not support this type of diagram, so we will adapt it to get what we need.
We will consider objects as the VIs in yellow boxes, with a label `[object:class]`; the messages as user events with red arrows, labeled 1:message1, 2:message2, 3:message3, etc., where the numerical prefix to the message name indicates its user event reference id in the sequence; and a yellow label at the left of the boxes with the id and name of user events.

## User Events

This is a list of user events in TcpServer, with a numeric id to indetify them in the Communication Diagram.

| id | User Event |
|:--:|:----------:|
| 1 | CmdWrite |
| 2 | CmdRead  |
| 3 | EvtWrite |
| 4 | EvtRead  |
| 5 | GenWrite |
| 6 | GenRead  |

The following table shows the user events with their publisher and subscriber.

| User Event | id | Publisher | Subscriber |
|:--------:|:----:|----------:|-----------:|
| CmdRead  | 2 | TcpServerCmd:processCmd.vi  | ComponentSimulator.vi     |
| CmdWrite | 1 | TcpServer:sendCmdStatus.vi  | TcpServerCmd.runServer.vi |
| EvtRead  | 4 | TcpServerCmd:processEvt.vi  | ComponentSimulator.vi     |
| EvtWrite | 3 | TcpServer.sendEvt.vi         | TcpServerCmd.runServer.vi |
| GenRead  | 6 | TcpServer:getClientStatus.vi | ComponentSimulator.vi     |
| GenWrite | 5 |                              | TcpServerCmd:runServer.vi |
|          |   | TcpServerCmd.runServer.vi    |                           |

## Top Level User Events

We will define a group of user events closest to the User and we will name them `Top Level User Events`.
These user events are what the User needs to know and use.
They are defined in the following table.

| id | User Event |
|:--:|:----------:|
| 2 | CmdRead  |
| 4 | EvtRead  |
| 6 | GenRead  |

The Communication Diagram for the Top Level User Events is in `doc/uml` directory.
You can follow [here](../doc/uml/TcpServerCommDiagramTopLevel.uml) for detailes.

TCP server receives a JSON packet from the TCP client, and then the **processCmd.vi** checks the command `id` and sends the `tcpPacket` as a message to the Component if the command is in the registered commands list.
This uses the `CmdRead` user event reference. If the incoming JSON packet is not a command nor an event, the "unknown" `tcpPacket` will be sent to the Component using the `GenRead` user event reference, from **processPacket.vi**.

The **processEvt.vi** checks the `compname` (component name) and event `id`, and if the event is in the registered event list, this `event` is sent to the Component using the `EvtRead` user event reference.

The Component receives the connection status of TCP clients, from **getClientStatus.vi**. This uses the `connStatusCluster` typedef with a boolean and a string inside and sends them using the `GenRead` user event reference.

## Low Level User Events

We will define a group of user events not close to the User and we will name them `Low Level User Events`.
These user events are used by other processes that the User does not necessarily know.
They are defined in the following table.

| id | User Event |
|:--:|:----------:|
| 1 | CmdWrite  |
| 3 | EvtWrite  |
| 5 | GenWrite  |

The Communication Diagram for the Low Level User Events is in `doc/uml` directory.
You can follow [here](../doc/uml/TcpServerCommDiagramLowLevel.uml) for detailes.

After the TCP server receives the command from the TCP client, it is processed and sent to the Component, and then it is necessary to send the ACK to the client.
This is done by the **sendCmdStatus.vi**, sending the `ack` to the **runServer.vi**, using the `CmdWrite` user event reference.

If there is an `event` that is required to be sent to the TCP client, the **sendEvt.vi** is used to send it as a user event with the `EvtWrite` reference to the **runServer.vi**.
