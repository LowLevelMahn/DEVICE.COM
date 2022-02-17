# DEVICE.COM

my attempt to reverse engineer DESQview's DOS driver loading tool DEVICE.COM 

# Files:

| File              | Info                                                                                                                     |
| :---------------- | :----------------------------------------------------------------------------------------------------------------------- |
| DEVICE.COM        | Original DESQview DEVICE.COM DOS tool                                                                                    |
| DEVICE.idb        | IDA 6.5x IDB                                                                                                             |
| dv.asm            | reversed and reassemble-able source code of DEVICE.COM                                                                   |
| build.bat         | builds dv.asm with TASM32 and UASM64 and checks if resulting dv.com is binary identical to DEVICE.COM                    |
| tools_howto.txt   | how to get the needed build tools (UASM, ulink, OpenWatcom) very easy to install                                         |

 **tools_dir** variable in build.bat needs to be set to suits your environment
 
 # TODO
 - fully revese and document the original
 - replace with Borland C version
