# Tcp Server State Machine

## Overview

This Finite-State Machine (FSM) defines the operation of the TCP server, which handles the TCP connection, gets the TCP packets from the TCP client, and stops the TCP server.
It is inside of **TcpServerCmd.runServer.vi** and **TcpServerTel.runServer.vi**.

The UML diagram is in `doc/uml` directory.
You can follow [here](../doc/uml/stateMachineTcpServerCmd.uml) for detailes.
This diagram explains how the FSM works in TcpServerCmd and TcpServerTel, as well.

## UML Diagram

The states are drawn as yellow rounded squares. The arrows indicate the transitions from one state to another.
A transition may have a trigger and a guard.
The trigger is the cause of the transition.
The guard is a boolean condition which must be true in order for the trigger to cause the transition.
The notation for transition descriptions is `trigger[guard]`, where each element is optional.

## States

The FSM has five states: create_listener, wait_on_listener, read_tcp_packet, close_connection and stop_server.

**create_listener** : this state uses the TCP Create Listener LabVIEW function to create a listener for a TCP network connection and creates the `listener ID`.
Once this function is executed, and the listener ID is created, it goes to the next state  (`listenerIsCreated` trigger in the diagram).

**wait_on_listener** : in this state the server waits for an accepted TCP network connection, using the TCP Wait On Listener LabVIEW function.
There is a `timeout` to define how long it waits for a client before it gets the error code 56 (timeout error).
When the client connects, it creates a `TCP connection ID` and it goes to the **read_tcp_packet** state (`getConnectionid` trigger in the diagram), shares the `connectionId` with other processes, and sends the connection status to the Component.
When there is no client connected, and it gets the timeout error, it goes to the **wait_on_listener** state again.
In the diagram we can see `timeout [errorCode == 56]` transition.

**read_tcp_packet** : in this state, the server waits for an incoming TCP packet using the TCP Read LabVIEW function.
If the packet arrives, it will be enqueued, to be processed in the **processPacket.vi**, and then goes back to **read_tcp_packet** state again.
If there are no new packets arriving after a default timeout of 25000 ms, it gets the error code 56 and goes to the **read_tcp_packet** again.
These both conditions are shown in the diagram with the transition `getPacket || timeout [errorCode == 56]`.
If there is no new packets arriving and it gets the error code 66, it means the server lost connection with the client and is necessary to close the TCP connection; that´s why it goes to the **close_connection** state.
The same situation happens when it gets any other error codes.
This transition appears in the diagram as `error || lostConnection [errorCode == 66]`.

**close_connection** : in this state it uses the TCP Close Connection LabVIEW function.
The `connection ID` is removed here, but the `listener ID` is still working.
Once the connection is closed, it goes to the **wait_on_listener** state.
The `connectionIsClosed` transition is shown in the diagram.

**stop_server** : this state closes the TCP connection, using the LabVIEW function with the same name.
Besides, it stops the FSM, as we can see in the diagram.
This state is not called inside of the FSM; instead, it is triggered from the Component, and it goes from every state; that´s why in the diagram this state is triggered by `stop_server` from all the states.
