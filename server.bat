@echo off
echo Welcome to the Python-based HTTP file transfer system.
echo We are currently verifying the presence of Python on your device.

:: Check if Python is installed
where python >nul 2>&1
if %errorlevel% equ 1 (
    echo Unfortunately, we are unable to create a Python server at this time.
    echo Please install Python on your device and attempt the operation again.
    pause
    exit /b
)

:: Python is installed, so show the message with version
for /f "tokens=1,2,3" %%i in ('python -V 2^>^&1') do set PYTHON_VERSION=%%j
echo Congratulations, Python version %PYTHON_VERSION% has been detected on your machine.

:: Start the HTTP server
echo Starting Python server on port 8000...
start "" python -m http.server 8000 >nul 2>&1

:: Get the IPv4 address and display the server address
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set SERVER_ADDRESS=%%i:8000
)
echo Congratulations, the Python server has been successfully created.
echo Here is the server address: %SERVER_ADDRESS%
echo Address for your browser is: http://%SERVER_ADDRESS%
pause
