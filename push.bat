@echo off
REM Run metadata update and publish scripts from repository root

setlocal enabledelayedexpansion

REM Change to directory containing this script (repo root)
cd /d "%~dp0" || exit /b 1

REM Ensure Python is available
where python >nul 2>&1
if errorlevel 1 (
    echo Python executable not found in PATH.
    exit /b 1
)

echo Running scripts\update-metadata.py ...
python scripts\update-metadata.py
if errorlevel 1 (
    echo update-metadata.py failed. Aborting.
    exit /b 1
)

echo Running scripts\publish.py %* ...
python scripts\publish.py %*

endlocal

