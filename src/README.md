# Use of LabVIEW Component Simulator

The Component Simulator allows you to call a LabVIEW TCP Server to test the TCP communication between the TCP Server and the TCP Client.
The LabVIEW TCP Server receives json commands from a Python TCP Client, and send Ack and Events back to the Client, using TCP packets.

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

### TCP Server Conventions

1. TCP Server will receive events and telemetry as TCP Packet, but to be more generic, we will define them as a "message" (msg) which can be an event or a telemetry.
2. We will define a new type of received TCP Packet called "generic" (gen) that is different to command and message.
3. When TCP Server receives a Packet, we will need to "read" it and when TCP Server sends a Packet to TCP Client, we will need to "write" it, so we will define different words:

- CmdRead / CmdWrite --> to read / write command packets.
- MsgRead / MsgWrite --> to read / write message packets.
- GenRead / GenWrite --> to read / write generic packets.

### Start Component Simulator

From terminal:

Go to the `build/` directory:

```sh
cd  ts_labview_tcp_json/build
```

Execute Component Simulator:

```sh
./ComponentSimulator
```

Check:

- IP = 127.0.0.1
- Port = 8888

Note: this configuration cannot be modified in runtime.

### Start TCP Client

For the use of TCP Python Client to send commands to TCP Server, you can follow [here](../python/README.md).

### Available Commands

As User you will have the possibility to tell TCP Server which commands are allowed.
For this Component Simulator you will have only three available commands.
If you send any of them, you will get the "Ack" in TCP Client.
If you send a different command, you will get the "noAck" in TCP Client.

Available Commands:

- move
- jump
- go

### Send Command Status to TCP Client

If you want to send the Command Status to the TCP Client, do:

- Go to tab "Set Ack Cmd Status".
- Click "Success" to inform the TCP Client the command was executed successfully.
- Click "Fail" to inform the TCP Client the command was executed with fails.
- Read the Command Status in TCP Client.

If you want to send an Event to TCP Client, do:

- Go to tab "Send Event".
- Write a name in Event Name control.
- Write details in Event Details control.
- Click "Send Event" to send the event.
- Read the event in TCP Client.

Availables Events:

| compName |   evtName  |
|:--------:|:----------:|
|  MTMount | InPosition |
|   M1M3   | InPosition |
|   Dome   |    move    |
|   Dome   |    stop    |

Note:

1. If you want to send a boolean as an event from Component Simulator, please use non capital letters, for instance `true` or `inposition`.
2. We will use the configuration file in a latter time in DM-30844 to define which event will be registered in TCP Server.

### Stop TCP Server

To stop the TCP Server click to "Stop Server" button in Component Simulator.

### Stop Component Simulator

To stop the Component Simulator click to "Stop Simulator" button.

Note:

1. You can only stop the Simulator Component if you stop de TCP Server before.
2. If you want to stop the TCP Client while the TCP Server is running, the Server will wait for a new Client connection.

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
