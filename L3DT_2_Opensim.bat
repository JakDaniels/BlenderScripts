@echo off

set /A error=0
if "%1"=="" set /A error=1
set name=%1
if "%name%"=="-h" (
	echo "Converts mesh tiles into one mesh that can be imported into OpenSim."
	echo "<L3DT_Project_Name> is the name of the L3DT project. The script will look for a subfolder called 'dae'"
	echo "and process the files it finds there. <XAxis> and <YAxis> are the number of tiles the mesh and textures were divided up into."
	exit /B 0
)
if "%2"=="" set /A error=1
set xaxis=%2
if "%3"=="" set /A error=1
set yaxis=%3
if /I "%error%" EQU "1" (
	echo "Usage: L3DT_2_Opensim.bat [-h] <L3DT_Project_Name> <XAxis> <YAxis>"
	exit /B 1
)
PUSHD "%~dp0" >NUL && SET root=%CD%&& POPD >NUL
set lpath=%root%\..\l3dt\%name%\dae

@echo on
fnr.exe --cl --dir "%lpath%" --fileMask "%name%.dae,%name%_x*.dae" --caseSensitive --find "X_up" --replace "X_UP"
fnr.exe --cl --dir "%lpath%" --fileMask "%name%.dae,%name%_x*.dae" --caseSensitive --find "Y_up" --replace "Y_UP"
fnr.exe --cl --dir "%lpath%" --fileMask "%name%.dae,%name%_x*.dae" --caseSensitive --find "Z_up" --replace "Z_UP"
@echo off
copy mesh_combine.py bscript.py /Y

fnr.exe --cl --dir "%root%" --fileMask "bscript.py" --caseSensitive --find "##PATH##" --replace "%lpath%"
fnr.exe --cl --dir "%root%" --fileMask "bscript.py" --caseSensitive --find "##FILE##" --replace "%name%"
fnr.exe --cl --dir "%root%" --fileMask "bscript.py" --caseSensitive --find "##XAXIS##" --replace "%xaxis%"
fnr.exe --cl --dir "%root%" --fileMask "bscript.py" --caseSensitive --find "##YAXIS##" --replace "%yaxis%"

blender.exe -noaudio -b empty.blend -P bscript.py
del bscript.py
echo "Now import the combined file '%lpath%\%name%_ALL.dae' into OpenSim using Radegast"

