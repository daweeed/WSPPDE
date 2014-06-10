@ECHO OFF
ECHO *****************************************************************************************
ECHO * WSPPDE - Windows Scientific Portable Python Development Environment
ECHO * Launch script to execute Python (.py, pyw) files by dropping them on PyLauncher icon.
ECHO *
ECHO * @package     WSPPDE
ECHO * @author      cwsoft (http://cwsoft.de)
ECHO * @copyright   cwsoft
ECHO * @license     http://www.opensource.org/licenses/bsd-license.php
ECHO *****************************************************************************************
REM ## Include required scripts
CALL %~dps0\Settings\environ.bat

REM ## Extract file extension of file dropped on the launcher icon
SET FILE_EXTENSION=%~x1

IF "%FILE_EXTENSION%" == ".pyw" GOTO :PYW_APP
IF "%FILE_EXTENSION%" == ".py" GOTO :PY_APP

ECHO.
IF "%FILE_EXTENSION%" == "" ECHO USAGE: To execute a Python file (*.py, *.pyw), drop it on the PyLauncher icon.
IF NOT "%FILE_EXTENSION%" == "" ECHO Sorry, only Python files (*.py, *.pyw) will be executed by the PyLauncher script.

PAUSE
EXIT

:PYW_APP
START %WSPPDE_PYTHON%\pythonw "%1" %*
EXIT

:PY_APP
START %WSPPDE_ROOT%\Console\Console.exe -r "/k %WSPPDE_PYTHON%\python.exe %1 %*"