@echo off
setlocal

REM Find and extract export.appx using 7-Zip
set "appxFile=export.appx"
set "extractDir=export"

REM Check if export.appx exists
if not exist "%appxFile%" (
    echo File "%appxFile%" not found.
    pause
    exit /b 1
)

REM Check if 7-Zip is installed (adjust path if necessary)
set "sevenZipPath=C:\Program Files\7-Zip\7z.exe"
if not exist "%sevenZipPath%" (
    echo 7-Zip not found. Please install 7-Zip and ensure it's in the path specified.
    pause
    exit /b 1
)

REM Extract export.appx using 7-Zip with -y to assume yes to all prompts
echo Extracting "%appxFile%"...
"%sevenZipPath%" x "%appxFile%" -o"%extractDir%" -y
if %ERRORLEVEL% neq 0 (
    echo Failed to extract "%appxFile%".
    pause
    exit /b 1
)

REM Delete [Content_Types].xml and AppxBlockMap.xml
del "%extractDir%
