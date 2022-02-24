# Tcp Server Communication Diagram for Queues

## Overview

This Communication Diagram shows how queues interact in **TcpServer**.

## Diagram Conventions

The [PlantUML](https://plantuml.com) is used to draw the Communication Diagram.
Although it does not support this diagram natively, it is still possible to emulate the expected behavior.
The objects with functions related to communication are in rectangle boxes.
The arrow between objects gives the direction of communication and the related LabVIEW queue name.

## List of Queues

The following is the list of queues in **TcpServer**:

| id | Queue Name |
|:--:|:----------:|
| 1  | queueTcpServer    |
| 2  | queueTcpClient    |
| 3  | queueTcpClientFromDds    |

In the following queues description...

- `queueTcpServer`
- `queueTcpClient`
- `queueTcpClientFromDds`

The following table shows the queues with their publishers and subscribers:

| Queue | Enqueue | Dequeue |
|:--------:|:----------:|:-----------:|
| queueTcpServer  | TcpServerCmd.tcpServerStateMachine&#46;vi   | TcpServerCmd.tcpServerCallBack&#46;vi     |
| queueTcpServer  | TcpServerTel.tcpServerStateMachine&#46;vi   | TcpServerTel.tcpServerCallBack&#46;vi     |
| queueTcpClient  |    | TcpServerBase.tcpServerSenderLoop&#46;vi     |
| queueTcpClientFromDds  | TcpServerTel.enqueueTelToComponent&#46;vi   | TcpServerTel.getTel&#46;vi     |

This table shows the vi that publishes an user event and which vi subscribes to that user event.

**TcpServerCmd** is the class that handles commands and events.
**TcpServerTel** is the class that handles telemetry messages.
Both are part of the **TcpServer** class.

The Communication Diagram for the Queues is in [here](../doc/uml/queues.uml).