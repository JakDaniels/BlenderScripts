BlenderScripts
==============

This will become a collection of scripts I use to create mesh terrain for OpenSim.
There are scripts for Linux and Windows.

#Setup For Linux:

Checkout the repository using:
	git clone https://github.com/JakDaniels/BlenderScripts.git

Make sure you have a directory structure something like this:

	
	~
	|-blender -> blender-2.73a-linux-glibc211-x86_64
	|-blender-2.73a-linux-glibc211-x86_64
	|-BlenderScripts
	|-l3dt
	|  |-Project1
	|  |  |-AM
	|  |  |-dae
	|  |  |- ....etc
	|  |-Project2
	|  |-Project3
	
	...etc



The 'blender' directory is a symlink to the statically compiled version of Blender 2.73. 
I used blender-2.73a-linux-glibc211-x86_64 which I downloaded from https://download.blender.org/release/Blender2.73/

The scripts should be run from within the BlenderScripts directory.

#Setup For Windows:

Download the ZIP file of the repository from https://github.com/JakDaniels/BlenderScripts/archive/master.zip
Unzip to your working area and make sure you have a directory structure something like this:


	~
	|-BlenderScripts-master
	|-l3dt
	|  |-Project1
	|  |  |-AM
	|  |  |-dae
	|  |  |- ....etc
	|  |-Project2
	|  |-Project3
	
	...etc

You must have blender installed on Windows (tested with 2.73) and you *MUST ADD THE BLENDER DIRECTORY TO YOUR SYSTEM PATH*.
Test that you can run blender by going to a command prompt and type 'blender.exe'. If it doesn't run then the path is not
set correctly!

To run the BlenderScripts you must run a command prompt and change to the BlenderScripts-master directory.

L3DT_2_Opensim
--------------

This script converts mesh tiles produced by L3DT into a single mesh terrain that can be imported into OpenSim.
It's a shell script/batch file that uses Blender to do the hard work and it assumes that the correct directory structures are in place above.

###Using the L3DT_2_Opensim script:

The 'l3dt' directory has sub directories for each project you create. Within those project directories are various directories that L3DT uses, but you
should place your exported L3DT tiles in a sub dir called 'dae'. Within L3DT you should export as type collada and set the required number of tiles.

The script should be run from the BlenderScripts (or BlenderScripts-master) directory. It fixes some XML errors in the DAE files that L3DT produces and then invokes
Blender in a headless configuration to combine the mesh tiles into one.

	Usage: L3DT_2_Opensim.sh [-h] <L3DT_Project_Name> <XAxis> <YAxis>
	Converts mesh tiles into one mesh that can be imported into OpenSim. 
	<L3DT_Project_Name> is the name of the L3DT project. The script will look for a subfolder
	called 'dae' and process the files it finds there. <XAxis> and <YAxis> are the number of
	tiles the mesh and textures were divided up into.

Once you have the combined mesh tile you can import it into OpenSim. The best tool for this is the Radegast viewer.
http://radegast.org/wiki/Radegast_Download
Radegast uses only one LOD for the mesh including physics. This is just what you want for terrain and is much quicker than other viewers
which try to calculate different LOD levels. I did not have any success with texture uploads however with Radegast, so I used
an ordinary viewer for this. It does mean that you will have to drag and drop all the textures onto your terrain using the viewer to complete
your terrain in Opensim. If anyone has a better way for this I'd love to know about it!

Bugs
----

I can't seem to get textures to work in Windows. Blender refuses to import the textures and the resulting export contains no texture info.


Todo
----

Automate the uploading of the mesh into OpenSim using Radegast or a custom OMV client.



Any questions or suggestions for improvement, please contact me directly: jak {at} ateb {dot} co {dot} uk



