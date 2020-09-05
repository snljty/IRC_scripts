@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SETLOCAL ENABLEEXTENSIONS

REM Calculate all gjf files in this directory.

SET IFFORMATCHK=%1
SET IFDELCHK=%2

IF EXIST %GAUSS_EXEDIR%\Scratch\Default.Rou (
    echo Default.Rou in %GAUSS_EXEDIR%\Scratch\ will be used.
    COPY /Y %GAUSS_EXEDIR%\Scratch\Default.Rou .\ > NUL
)

ECHO Start calculation at !DATE! !TIME:~0,-3!
FOR /F "delims=" %%I IN ('DIR /B *.gjf') DO ( 
    ECHO Start calculating %%I now
    g16 %%I %%~nI.out
    IF !ERRORLEVEL! == 0 (
        ECHO Calculation of %%I finished at !DATE! !TIME:~0,-3!
        REM formchk %%~nI.chk %%~nI.fch
    ) ELSE (
        ECHO Calculation of %%I failed at !DATE! !TIME:~0,-3!
    )
)

IF EXIST Default.Rou (
    DEL Default.Rou
)

PAUSE

