# LabVIEW TCP/IP Module for JSON String

LabVIEW TCP/IP module to transfer the packet of JSON string.
This module should be compatable with the Python TCP/IP client.
The Python client might have the service abstraction layer (SAL) support.

## Platform

- CentOS 7
- LabVIEW 2018 SP1 64-bit Professional Version
- Caraya Unit Test Framework v1.0.2.115 ([download here](https://github.com/JKISoftware/Caraya/releases/tag/1.0.2))

## Python Test Script

The python scripts are in `python/` directory.
You can follow [here](python/README.md) for the details.

## LabVIEW TCP Server

The LabVIEW TCP Server code is in `src/` directory.
You can follow [here](src/README.md) for details.

## LabVIEW Component Simulator

The LabVIEW Component Simulator code is in `simulator/` directory.
You can follow [here](simulator/README.md) for details.

## Header of JSON String

The LabVIEW component will use the TCP/IP module to communicate with the Python client.
The JSON string packet is used in this process.
To make this work, some header information is required.

### Command

When the Python client sends the command, the JSON string should have the following keys:

1. **id**: Specify the name of command that begins with `cmd_`.
2. **sequence_id**: A unique ID that the value increases from 0 to N among different commands.
This item is unrelated to the command name or details.
It is used to track the internet traffic.

Once the TCP/IP server recieved the command or the LabVIEW component finished the command, the related information will be sent to the Python client.
To support this, the following header information is needed:

1. **id**: Specify the command status.
The value should be in `ack`, `noack`, `success`, or `fail`.
The `ack` or `noack` is by the TCP/IP module directly.
The `success` or `fail` will wait for the response of the LabVIEW component.

When the TCP/IP server responds to the Python client, the following information is required: **id** and **sequence_id**.

### Event

The JSON string should have the following keys:

1. **id**: Specify the name of event that begins with `evt_`.
2. **compName**: Specify which component's event is being subscribed (optional).
The LabVIEW component needs this to identify the subscribed event from other components (by SAL).
But when the LabVIEW component publishes the event, this key is not required.

### Telemetry

The JSON string should have the following keys:

1. **id**: Specify the name of telemetry that begins with `tel_`.
2. **compName**: Specify which component's telemetry is being subscribed (optional).
The LabVIEW component needs this to identify the subscribed telemetry from other components (by SAL).
But when the LabVIEW component publishes the telemetry, this key is not required.

## Command Acknowledgement

The TCP/IP server should acknowledge the Python client actively for the command status with `ack` if:

1. The command is in the list of registered commands by LabVIEW component.
2. The **sequence_id** is bigger than the previous by one if it is not the first command.
Let the Python client decides the first value of **sequence_id**.

Otherwise, the `noack` should be used.
In the condition 2 above, if the TCP/IP server received a command with **sequence_id: 1** followed by **sequence_id: 3**, it should do the `noack` as the following and vice versa:

```json
{
    "id": "noack",
    "sequence_id": 2
}
```

## Details of the Parameters in JSON String

The parameter details should be inline with the JSON string.
For example, the Python client might issue a `move` command with `x`, `y`, and `z` as the following:

```json
{
    "id": "cmd_move",
    "sequence_id": 1,
    "x": 0.1,
    "y": 0.2,
    "z": 0.3
}
```

The TCP/IP server pass the above information to the LabVIEW component.
This means the LabVIEW component should have a mechanism to track the command status of execution.
The Python client might issue multiple commands in a short time, but the LabVIEW component should only execute a single command in a single time and reply for the result.

Take the above command as an example, the acknowledgement from TCP/IP server at each time of receiving the command will be:

```json
{
    "id": "ack",
    "sequence_id": 1
}
```

If this command succeeds after the execution by LabVIEW component, the following message will be issued to the Python client:

```json
{
    "id": "success",
    "sequence_id": 1
}
```

In some cases, the parameters might not be needed.
For example, the LabVIEW component might publish a `inPosition` event:

```json
{
    "id": "inPosition"
}
```

The LabVIEW component might subscribe the `inPosition` event from `MTMount` component with the parameter of `tolerance` (this is the TCP Client sending a message to LabVIEW Component):

```json
{
    "id": "evt_inPosition",
    "compName": "MTMount",
    "tolerance": 0.001
}
```

The telemetry is similar to the event.
The main difference is that the telemetry will be in a fixed rate (in the ideal case).

## Use of the TCP/IP Module

The TCP/IP module should provide the following functions for the LabVIEW component to use as a TCP/IP server:

1. `configure()`: Configure the TCP/IP server with the port or other parameters.
This function might be realized by multiple functions for different configuration groups.
2. `registerCommand()`: Register the commands that the LabVIEW component supports.
3. `registerEvent()`: Register the events that the LabVIEW component wants to subscribe from other components.
4. `registerTelemetry()`: Register the telemetry that the LabVIEW component wants to subscribe from other components.
5. `run()`: Main method that the LabVIEW component can execute by the asynchronous call and put the TCP/IP server as a process to run in the background.
After this, the communication between the TCP/IP server and LabVIEW component will be by the user event, reference queue, or notifier.
The TCP/IP server should be able to stop gracefully after get the signal from the LabVIEW component.
The global variables and functional global variables should not be used in any case.
6. `get()`: Get the user event, reference queue, and notifier hold by the TCP/IP module.

Note: The TCP/IP server should just pass the command, event, and telemetry to the LabVIEW component that are registered.

## Note

1. Suggestion from Russell: Command ack should include an estimate of duration (this can be 0 if the command is quick).
(I do not know how to support this in M2.)

## Reference of JSON String Format

1. [Communication Protocols](https://ts-mtdome.lsst.io/protocols.html#json-schemas)
2. [TCP/IP Interfaces to Low-Level Controllers](https://confluence.lsstcorp.org/pages/viewpage.action?pageId=140284619)
