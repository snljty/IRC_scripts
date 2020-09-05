@echo off
for /f "delims=" %%i in ('dir /b *.fch') do (
    Multiwfn %%~nxi < Mayer_BO_in.txt
    move bndmat.txt %%~ni_bndmat.txt > NUL
)

