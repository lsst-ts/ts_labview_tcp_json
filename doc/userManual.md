# Tcp Server User Manual

## Overview

The `TcpServer` is a module to exchange commands, events and telemetry with a TCP client, using a TCP/IP conexion.
You can use this module as an interface between a TCP client and a LabVIEW component.

## Download

You can download the module from the [GitHub repository](https://github.com/lsst-ts/ts_labview_tcp_json).

## Design

This `TcpServer` is developed with the Object Oriented Design (OOD).
There is a base class called **TcpServerBase** with two child: **TcpSeverCmd** and **TcpServerTel**; the former is to handle commands and events, and the latter is to handle telemetry.
**TcpServer** class has the **TcpServerCmd** and the **TcpServerTel**.

## TcpServer Functions

The `TcpServer` module provides a library of VIs for TCP/IP communication.
All of these VIs are public functions of the **TcpServer** class.
In the following table you can find all of these functions with their descriptions:

| Function Name   | Description         |
|:---------------:|:-------------------:|
|  configServer   | Configure the TCP Server Command and TCP Server Telemetry. |
|  flushTelQueue  |  Flush the queue with telemetry. Use the queueName enum control to select either queueFromDds or queueToDds. This function will not handle any error internally, so the user must handle the errors when call it.  |
| getClientStatus | Get the notification from TCP Server that TCP Client connects or disconnects and then send an user event to the Component. |
| getInstanceCmd  | Get the CmdRead user event instance, to read commands from TCP Client. |
| getInstanceEvt  | Get the EvtRead user event instance, to receive an event from TCP Client. |
| getInstanceGen  | Get the GenRead user event instance to receive either a generic packet from TCP Client or internal messages, such as errors. |
| getTelElement   | Get telemetry elements one by one from queue. Timeout is set in **configServer&#46;vi** but you can modify this timeout through this telQueueServerTimeout control. This function will not handle any error internally, so the user must handle the errors when call it. |
| isTcpClientQueueFull | Check if queue is full to send or receive telemetry. This returns TRUE if queue is full and FALSE if  not. Use the queueName enum control to select queueFromDds or queueToDds options. This function will not handle any error internally, so the user must handle the errors when call it. |
| readNotifierStatus | Read the notifier sent from **tcpServerStateMachine&#46;vi**. Put this VI in Prealocated reentrant clone execution. This vi is public for test purspose only. Please don´t use this vi. |
| regCmd | Inform the TCP Server which commands are registered and allowed to be used by LabVIEW Component. |
| regEvt | Inform the TCP Server which events are registered and allowed to be processed. |
| regTel | Inform the TCP Server which telemetry is registered and allowed to be used by LabVIEW Component. |
| runServer | Run the TCP Server. |
| sendCmdStatus | Send cmdStatus to the TCP Server to inform the TCP Client about the command result. This function will not handle any error internally, so the user must handle the errors when call it.|
| sendEvt | Send an event to the TCP Server to be read by the TCP Client. This function will not handle any error internally, so the user must handle the errors when call it. |
| sendTel | Send telemetry to TCP Client. Use the queueOptions control to select lossy enqueue or normal enqueue, and timeout in ms. This function will not handle any error internally, so the user must handle the errors when call it. |
| stopServer | Set an occurrence to stop all servers.  This function will not handle any error internally, so the user must handle the errors when call it. |

## Usage

1.- TCP Server Configuration

You have to configure the TCP/IP communication with the **configServer&#46;vi** function.
In the following table you can find the parameters and their description:

| Parameter   | Description         |
|:---------------:|:-------------------:|
| cmdServerPort | TCP port used by native LabVIEW TCP functions in TcpServer Command |
| telServerPort | TCP port used by native LabVIEW TCP functions in TcpServer Telemetry|
| serverTimeout (ms) | Time in ms that the `TCP Wait on Listener` function waits for a TCP connection |
| serverBytesToRead | Bytes to be read by the `TCP Read` function |
| maxSizeQueueTel | Max size of the queue called `queueTel` in TcpServer Telemetry |
| EnqueueOptions | Select how to add new elements into the telemetry queue, using whether `Enqueue Elements` function or `Lossy Enqueue Element` functon |
| timeoutQueueTel (ms) | Timeout in ms used in `Dequeue Element` function in LabVIEW Component to get telemetry from TCP Client. |
| tcpClientQueueMaxSize | Set the max size of queue called `tcpClientQueue` |
| timeoutInMs | Timeout in ms used by the Occurrence functions |

2.- Register Commands, Events, and Telemetry

Inform the TCP Server which commands, events, and telemetry will be accepted.
Use functions **regCmd&#46;vi**, **regEvt&#46;vi**, and **regTel&#46;vi**.
Use the `default.ini` file to register them.
For details the [Configuration File](#configuration-file) seccion.

3.- Register User Events

User events are used to exchange information between TcpServer and LabVIEW Component.
The TcpServer Module creates the user events in the **configServer&#46;vi** function.
User needs to register those user events with the `Register for Events` native LabVIEW function.

## Configuration File

The `default.ini` define commands, events and telemetry the TCP server will register and accept.
This file stores the `id` of commands, `id` and `compName` of events, and `id` and `compName` of telemetry.
LabVIEW Component will read this file to register commands, events and telemetry in TCP Server.

The configuration file is in the `config/` directory.
Clic [here](../doc/detailsDefault.md) for details.

User can customize these `id` and `compName` in every field, e.g.:

```sh
[commands]
id = move,stop,applyForces,positionMirror

[events]
compName = MTMount,MTMount
id = elevationInPosition,azimuthInPosition

[telemetry]
compName = MTMount,MTMount
id = elevation,azimuth
```

This configuration file will be read by the utility called **readConfigFileDefault&#46;vi**.
