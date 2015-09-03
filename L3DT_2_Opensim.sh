#!/bin/bash

[ -z "$3" ] || [ -z "$2" ] || [ -z "$1" ] && echo "Usage: L3DT_2_Opensim.sh [-h] <L3DT_Project_Name> <XAxis> <YAxis>" && exit 0

name=$1
xaxis=$2
yaxis=$3

[ "$name" == "-h" ] && echo "Converts mesh tiles into one mesh that can be imported into OpenSim." && 
		       echo "<L3DT_Project_Name> is the name of the L3DT project. The script will look for a subfolder called 'dae'" &&
		       echo "and process the files it finds there. <XAxis> and <YAxis> are the number of tiles the mesh and textures were divided up into." &&
		       exit 0

path=../l3dt/${name}/dae/


for i in ../l3dt/${name}/dae/${name}.dae ../l3dt/${name}/dae/${name}_x*.dae; do 
	echo "Fixing up L3DT file: $i"
	mv -f $i ${i}.bak
	cat ${i}.bak |sed -e "s%X_up%X_UP%g"|sed -e "s%Y_up%Y_UP%g"|sed -e "s%Z_up%Z_UP%g" >$i
	rm -f ${i}.bak
done

cat mesh_combine.py |sed -e "s%##PATH##%${path}%g" |sed -e "s%##FILE##%${name}%g" |sed -e "s%##XAXIS##%${xaxis}%g" |sed -e "s%##YAXIS##%${yaxis}%g" >bscript.py
../blender/blender -noaudio -b empty.blend -P bscript.py

rm -f bscript.py

echo "Now import the combined file '../l3dt/${name}/dae/${name}_ALL.dae' into OpenSim using Radegast"
