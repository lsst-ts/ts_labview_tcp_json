# LabVIEW TCP Server

## Needed Package

- Caraya 1.0.2.115 (for Unit Testing)

## Use of TCP Server

### User Manual

You can follow [here](../doc/userManual.md) to read the TCP Server User Manual.

### Do the Unit Test

1. You can run the testAll.vi under the `tests/` directory in tcpip.lvproj to do the unit tests by using the Caraya unit test framework.
2. To do the unit tests and generate the JUnit xml report from the command line, do the following command.
The generated report (testReport.xml) will be in the `log/` directory.

```sh
labview64 tests/testAllWithXmlReport.vi
```

### Build the Executable

The LabVIEW professional version is needed to build the executable.
You can build the executable from within LabVIEW or from the command line, as you prefer:

- From within LabVIEW: select the build all under Build Specifications of tcpip.lvproj.
The ComponentSimulator executable will be in the `build/` directory.
The output log is in the build/buildComponentSimulator.txt.
- From the command line:

```sh
labview64 src/buildApp.vi
```

### Class Hierarchy

There is a class called **TcpServerBase** that is the parent.
This class has two children: a class called **TcpServerCmd**, to handle commands and events, and a class called **TcpServerTel**, to handle telemetry messages.
Both children are part of the **TcpServer** class.

The class diagram is in `doc/uml` directory.
You can follow [here](../doc/uml/TcpServerClass.uml) for detailes.

### TCP Server Conventions

1. TCP Server will receive events and telemetry as TCP Packet, but to be more generic, we will define them as a "message" (msg) which can be an event or a telemetry.
2. We will define a new type of received TCP Packet called "generic" (gen) that is different to command and message.
3. When TCP Server receives a Packet, we will need to "read" it and when TCP Server sends a Packet to TCP Client, we will need to "write" it, so we will define different words:

- CmdRead / CmdWrite --> to read / write command packets.
- EvtRead / EvtWrite --> to read / write event packets.
- GenRead --> to read generic packets.

### Tcp Server State Machine

There is a state machine that handles the TCP connection, receives the TCP packets and stops the TCP server.
This is located in **TcpServerCmd.runServer.vi**.
Please follow [here](../doc/stateMachine.md) for detailes.
You can use this document to understand the behavior of **TcpServerTel** as well.

### Tcp Server Communication Diagram

The Communication Diagram shows how internal objects interact in **TcpServer** top-level class, along with messages that travel from one to another.
Messages are user events.
Please follow [here](../doc/communicationDiagram.md) for details.

### Start TCP Server

For the use of TCP Server to send commands to TCP Client, you need to start Component Simulator.
Please follow [here](../simulator/README.md) for details.

### Start TCP Client

For the use of TCP Python Client to send commands to TCP Server, you can follow [here](../python/README.md).

### Stop TCP Server

To stop the TCP Server click to "Stop Server" button in Component Simulator. This will close all server running.

### Utility

Convert to Key Value Pair functions:

We will provide to the user a group of functions to transform the controls to string for the event/telemetry publish.
We provide the polymorphic vi to simplify the use by the LabVIEW component.
Data types provided are:

- Numeric Double.
- Numeric Integer.
- String.
- Boolean.
- Numeric 1D-Array.
- Numeric 2D-Array.

Please use the `convertToKeyValuePair.vi` to call all functions.
If you want to know how to use this function, please go to `tests/Utility/keyValuePair/testConvertToKeyValuePairWithJSON.vi`.

Note:

1. The polymorphic `convertToKeyValuePair.vi` does not support `Inf` value.
Please try to avoid use this value.

### TcpServer Design Details

- `tcpServerSenderLoop.vi` is set as preallocated clone reentrant execution, in **tcpServerBase**, **tcpServerCmd** and **tcpServerTel** classes.
- `runServer.vi` works as Dynamic Dispatch in **tcpServerBase**, **tcpServerCmd** and **tcpServerTel** classes.
- `tcpServerStateMachine.vi` works as Dynamic Dispatch in **tcpServerBase**, **tcpServerCmd** and **tcpServerTel** classes.
- User can configure TCP Server to work with a circular buffer when sends telemetry to TCP Client and receives telemetry from TCP Client, through `configServer.vi` when server starts.
In **queueOptions** control select **lossy enqueue** to use circular buffer, and **normal enqueue** to use standard FIFO technique.
- User can enable/disable circular buffer through `sendTel.vi` in runtime, only to send telemetry to TCP Client.
- User can configure TCP Server as **block call** code when sends telemetry to TCP Client through `sendTel.vi` with Timeout = -1 and queueOption = normal enqueue.
To set this as **un-block call** use Timeout greater than 0 and queueOptions = lossy enqueue.
- User can configure TCP Server as **block call** code when receives telemetry from TCP Client through `configServer.vi` with timeoutQueueTcpClientFromDds = -1 and EnqueueOptions = normal enqueue.
To set this as **un-block call** use timeoutQueueTcpClientFromDds greater than 0 and EnqueueOptions = lossy enqueue.
- Every time Python TCP Client (cmd and tel) and TCP Server connections are "alive" TCP Server will send an user event to the LabVIEW Component.
If either command or telemetry instance of Python TCP Client disconnects from TCP Server, a generic user event is sent.
If all Python TCP Client instances are connected again, a generic user event is sent.
- The `TcpServerBase.sendErrorExplanation.vi` is used to send a specific and important error to the ComponentSimulator.
This uses the `GenRead` user event.
- There is a function called `clearErrorAndSendExplanation.vi` that clears the incoming error and sends it to the Component by the **GenRead** user event.
This function is located in every process that needs to send the errors.
The user must manage them.
