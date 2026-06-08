WHOAMI - A tools400 Utility
---------------------------

WHOAMI is a CL command that displays job and workstation attributes 
when executed on a IBM i (AS/400) command line.

The attributes displayed are:

 • User name
 • System name
 • Device name
 • TCP/IP address

The utility uses the following APIs:

 • Retrieve Device Description (QDCRDEVD) API
 • Retrieve Network Attributes (QWCRNETA) API

It uses the name of the job that called WHOAMI as the devices name 
for the QDCRDEVD API, because for interactive jobs the job name
equals the device name.

Compile members with the following PDM option:                                                     
                                                                          
   STRPREPRC USESRCFILE(&L/&F) USESRCMBR(&N) OPTION(*EVENTF) CHGOBJD(*NO) 
     LIB(&O) OBJ(&N) SRCLIB(&L) SRCFILE(&F) SRCMBR(&N) USER0(&X)          
     USER1(*LIST) USER2(*FULL)                                            

Members of type MAKPGM or BND are used for linking programs (MAKPGM) 
and service programs (BND).

2018, Thomas Raddatz