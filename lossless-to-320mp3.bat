@echo off

REM - Startup info...

echo ~/~    FFMPEG lossless-to-320mp3 v1.0 by Graham Sider    ~/~
echo ~/~    This program will convert any audio file (typically lossless) to a 320kbps MP3 using a 44.1kHz sampling rate    ~/~
echo ~/~    PLEASE NOTE: In order to use this program, FFMPEG as well as the libmp3lame encoding library must be properly installed    ~/~
echo ~/~    Visit https://www.ffmpeg.org/ and http://lame.sourceforge.net/ for more information    ~/~
echo.

REM - Conversion

set /p inputDir="Enter input file path and extension (e.g. input.wav, C:\dir_path\input.flac, etc): "
echo.

set /p outputDir="Enter output file path (e.g. output, C:\dir_path\output, etc -- file extension not needed [will be ".mp3"]): "
echo.

echo ~/~    CREATING OUTPUT MP3    ~/~
echo.

ffmpeg -y -i %inputDir% -vn -ar 44100 -ac 2 -b:a 320k -f mp3 %outputDir%.mp3

echo.

IF %ERRORLEVEL% NEQ 0 (
 	echo ~/~    ERROR -- Exiting...    ~/~
 	echo.
 	pause
) ELSE (
	
REM - No error found...
	
	echo ~/~    MP3 CREATION SUCCESSFULL, PROGRAM COMPLETE    ~/~
	echo.
	pause
)