@ECHO off
REM the output .GRF will appear in the subdirectory grf\
REM create it if it does not already exist
if not exist "grf\" (
	mkdir "grf\"
)

REM use the qnml preprocessor to generate the .nml
py qnml.py ac.nml

if not %ERRORLEVEL% == 0 (
	ECHO nmlc error
	EXIT
)

REM use nmlc to compile the GRF
REM you may likely have to point this to your location of nmlc v0.5
py "..\nml_0.5\nmlc" --grf=grf/ac.grf ac.nml

if not %ERRORLEVEL% == 0 (
	ECHO nmlc error
	EXIT
)

REM put the GRF into the game directory
copy "grf\ac.grf" "%UserProfile%\Documents\OpenTTD\newgrf"