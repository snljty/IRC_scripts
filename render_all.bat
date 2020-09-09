@echo off

setlocal enableextensions

echo You Should set your tachyon name correctly,
echo and add the directory containing this executable
echo to environmental variable ^"PATH^"!
echo You need to set the ncores in this file.

rem number of physical cores
set ncores=2

rem make sure the correct version of tachyon is used, 
rem and it is either in PATH or with full path.
for /f "usebackq delims=" %%i in (`dir /b *.dat`) do (
    tachyon_WIN64.exe %%i -format BMP -o %%~ni.bmp ^
-trans_raster3d -res 1500 1500 -mediumshade -aasamples 24 -numthreads %ncores%
)

