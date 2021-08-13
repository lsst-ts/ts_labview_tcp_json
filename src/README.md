# LabVIEW TCP Server

## Needed Package

- Caraya 1.0.2.115 (for Unit Testing)

## Use of TCP Server

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
- GenRead / GenWrite --> to read / write generic packets.

### Start TCP Server

For the use of TCP Server to send commands to TCP Client, you need to start Component Simulator. Please follow [here](../simulator/README.md) for details.

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
