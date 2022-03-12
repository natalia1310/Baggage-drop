# Baggage-drop
A verilog algorithm that simulate the automatic throwing of a container of supplies into a battlefield by a helicopter  to a team of Marines when it is in the authorized perimeter. In order not to be neutralized, it must reach the ground within a time limit t, calculated using the formula t = sqrt(height) / 2

The circuit will each time extract the current height at which the helicopter is located from the 4 sensors present on the belly of the aircraft (placed in pairs to ensure the redundancy of the measurements), will perform the arithmetic mean of the active ones and will display the information on a display with 4 7Seg elements, emitting an alarm when the package is detached.

The input values of all sensors are represented on 8 bits. The sensor is considered to have a valid value at the time when it is different from 0. The time limit is expressed on 16 bits, in a fixed comma, with a comma between bit 8 and bit 7. The validation condition of the automatic throw is represented by a 1-bit input signal.

The module output is represented by 4 7Seg modules, which will display the following types of messages:

COLD - if the helicopter is not in the throwing area (the validation signal is not active)
_HOT - if the helicopter is in the throwing area, but the time limit is too high
DROP - if the helicopter threw away the package.
When the DROP signal is active, the alarm will also be active.

More detalies can be find here : https://ocw.cs.pub.ro/courses/ac-is/teme/tema1
