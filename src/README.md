# Use of LabVIEW Component Simulator

The Component Simulator allows you to call a LabVIEW TCP Server to test the TCP communication between the TCP Server and the TCP Client. 
The LabVIEW TCP Server receives json commands from a Python TCP Client, and send Ack and Events back to the Client, using TCP packets.

## Needed Package

- Caraya 1.0.2.115 (for Unit Testing)

## Use of TCP Server

### Build the Executable

The LabVIEW professional version is needed to build the executable. 
You can build the executable from within LabVIEW or from the command line, as you prefer:

- From within LabVIEW: select the build all under Build Specifications of tcpip.lvproj. The ComponentSimulator executable will be in the `build/` directory.
The output log is in the build/buildComponentSimulator.txt.
- From the command line:
```sh
labview64 src/buildApp.vi
```

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

Note: this configuration cannot be modify in runtime.

### Start TCP Client

For the use of TCP Python Client to send commands to TCP Server, you can follow [here](python/README.md).

### Send Command Status to TCP Client

If you want to send the Command Status to the TCP Cliente, do:

- Go to tab "Set Ack Cmd Status".
- Click "Success" to inform the TCP Client the command was executed successfully.
- Click "Fail" to inform the TCP Client the command was executed with fails.
- Read the Command Status in TCP Client.

If you want to send an Event to TCP Client, do:

- Go to tab "Send Event".
- Write a name in Event Name control.
- Click "Send Event" to send the event.
- Read the event in TCP Client.

### Stop TCP Server

To stop the TCP Server click to "Stop Server" button in Component Simulator.

## Stop Component Simulator

To stop the Component Simulator click to "Stop Simulator" button.

Note:

1. You can only stop the Simulator Component if you stop de TCP Server before.
2. If you want to stop the TCP Client while the TCP Server is running, the Server will wait for a new Client connection.