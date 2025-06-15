@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

FOR /F "delims=" %%D IN ('DIR /AD /B /S ^| FINDSTR /V "\\.git"') DO (
    DIR "%%D" | FINDSTR "^ File(s)" | FINDSTR "0 File(s)" > NUL
    IF %ERRORLEVEL% == 0 (
        ECHO Empty directory: %%D
        ECHO.>"%%D\.gitkeep"
    )
)

ECHO All empty folders have been filled with .gitkeep files.
PAUSE
