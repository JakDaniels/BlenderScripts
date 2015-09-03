BlenderScripts
==============

This will become a collection of scripts I use to create mesh terrain for OpenSim.
The scripts run on Linux, however it shouldn't be too difficult to do something similar on Windows.


L3DT_2_Opensim.sh
-----------------

This script converts mesh tiles produced by L3DT into a single mesh that can be imported into OpenSim.
It's a shell script that uses Blender to do the hard work and it assumes the following prerequisites:

You have a directory structure something like this


~
|-blender -> blender-2.73a-linux-glibc211-x86_64
|-blender-2.73a-linux-glibc211-x86_64
|-BlenderScripts
|-l3dt
|  |-Project1
|  |-Project2
|  |-Project3


etc.

The 'blender' directory is a symlink to the statically compiled version of Blender 2.73. 
I used blender-2.73a-linux-glibc211-x86_64 which I downloaded from https://download.blender.org/release/Blender2.73/

BlenderScripts is the directory this project is checked out into.

The l3dt directory has sub directories for each project you create. Within them are various directories that L3DT uses, but you
should place your exported L3DT tiles in a sub dir called 'dae'. Within L3DT you should export as type collada.

The script should be run from the BlenderScripts directory. It fixes some errors in the DAE files that L3DT produces and then invokes
Blender in a headless configuration to combine the mesh tiles into one.

Once you have the combined mesh tile you can import it into OpenSim. The best tool for this is the Radegast viewer.
http://radegast.org/wiki/Radegast_Download

Any questions or suggestions for improvement, please contact me directly: jak {at} ateb {dot} co {dot} uk



