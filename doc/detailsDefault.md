# Details of Default File

This file stores the **id** of commands, **id** and **compName** of events, and **id** and **compName** of telemetry.
LabVIEW Component will read this file to register commands, events and telemetry in TCP Server.

The **default.ini** file is in `config/` directory.
Click [here](../config/default.ini) to go to `default.ini` file.

## Explanation of Items

### commands

1. **id** : Specify the name of command.

### events

1. **compName** : Specify which component's event is being subscribed.
2. **id** : Specify the name of event.

### telemetry

1. **compName** : Specify which component's telemetry is being subscribed.
2. **id**: Specify the name of telemetry.

## How to use this file

**For Commands:** please add every command after the last command separated by a `comma`, for instance:

```text
[commands]
id=move,stop
```

**For Events/Telemetry:** please write every **compName** with its **id**. Every **compName** and **id** must be separated by a `comma`, for instance, if you want to define the following events:

| compName |          id         |
|:--------:|:-------------------:|
|  MTMount | elevationInPosition |
|  MTMount |  azimuthInPosition  |

Then, write them in this way:

```text
[events]
compName=MTMount,MTMount
id=elevationInPosition,azimuthInPosition
```
