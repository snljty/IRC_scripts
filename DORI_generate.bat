@echo off
for /f "delims=" %%i in ('dir /b *.wfn') do (
    Multiwfn %%~nxi < DORI_in.txt
    move func1.cub %%~ni_sl2r.cub > NUL
    move func2.cub %%~ni_DORI.cub > NUL
)

