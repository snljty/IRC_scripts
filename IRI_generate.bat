@echo off
for /f "delims=" %%i in ('dir /b *.wfn') do (
    Multiwfn %%~nxi < IRI_in.txt
    move userfunc.cub %%~ni_IRI.cub >NUL
    move signlambda2rho.cub %%~ni_sl2r.cub >NUL
)

