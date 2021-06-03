# LabVIEW TCP/IP Module for Json String

LabVIEW TCP/IP module to transfer the packet of JSON string.
This module should be compatable with the Python TCP/IP client.

## Platform

- CentOS 7
- LabVIEW 2018 SP1 64-bit Professional Version

## Python Test Script

The python scripts are in `python/` directory.
You can follow [here](python/README.md) for the details.

## LabVIEW Componente Simulator

The LabVIEW Component Simulator code is in `scr/` directory.
You can follow [here](src/README.md) for detailes.

## Header of JSON String

### Command

The JSON string should have a key: `cmdName` to specify the name of command.
The key of `cmdId` is required as a unique ID that the value increase from 0 to N among diffement commands.
Once the server receives a new command from the client, it should acknowledge the client with a JSON string contains the following keys: `cmdName`, `cmdId`, and `cmdStatus`.
The value of `cmdStatus` should be in `ack`, `noAck`, `success`, or `fail`.
Once the command is done, the server should notify the client that the command is `success` or `fail` with the `cmdName` and `cmdId` to specify the command.  

### Event

The JSON string should have a key: `evtName` to specify the name of event.

### Telemetry

The JSON string should have a key: `telName` to specify the name of telemetry.
