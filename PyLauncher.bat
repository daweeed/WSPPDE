@ECHO OFF
ECHO **************************************************************************
ECHO * WSPPDE - Windows Scientific Portable Python Development Environment
ECHO *
ECHO * Script to execute Python (.py, pyw) files by dropping them on the
ECHO * launcher icon of this batch script.
ECHO *
ECHO * @package     WSPPDE
ECHO * @author      cwsoft (http://cwsoft.de)
ECHO * @copyright   cwsoft
ECHO * @license     http://www.opensource.org/licenses/bsd-license.php
ECHO **************************************************************************

REM ## SET PATH TO ACTUAL BATCH FILE
SET BATCH_PATH=%~dp0

REM ## SET ENVIRONMENT VARIABLES USED IN .\Console\console.xml
SET PYTHON="%BATCH_PATH%Python27\python.exe"
SET IPYTHON="%BATCH_PATH%Python27\Scripts\ipython-script.py"
SET PYLAB="%BATCH_PATH%Python27\Scripts\ipython-script.py" --pylab
SET NOTEBOOK="%BATCH_PATH%Python27\Scripts\ipython-script.py" notebook --pylab inline
SET STARTUP_PATH=%BATCH_PATH%Repository

REM ## SET PATH FOR IPYTHON AND MATPLOTLIB CONFIGURATION FILES
SET IPYTHON_DIR=%BATCH_PATH%.ipython
SET MPLCONFIGDIR=%BATCH_PATH%.matplotlib

REM ## APPEND PATH TO PYTHON INTERPRETER AND SCRIPT FOLDER TO THE SYSTEM PATH
SET PATH=%PATH%;%BATCH_PATH%Python27;%BATCH_PATH%Python27\Scripts;

REM ## CHECK IF A FILE WITH SUPPORTED EXTENSION WAS DROPPED ON THE LAUNCHER
SET FILE_EXTENSION=%~x1

IF "%FILE_EXTENSION%" == ".pyw" GOTO :LAUNCH_WIN_APP
IF "%FILE_EXTENSION%" == ".py" GOTO :LAUNCH_CON_APP

IF "%FILE_EXTENSION%" == "" ECHO To execute a Python file (*.py, *.pyw), just drop it on the launcher icon.
IF NOT "%FILE_EXTENSION%" == "" ECHO Sorry, only Python files (*.py, *.pyw) can be executed by the launcher.

PAUSE
EXIT

:LAUNCH_WIN_APP
START %BATCH_PATH%Python27\pythonw.exe "%1" %*
EXIT

:LAUNCH_CON_APP
START %BATCH_PATH%Console\Console.exe -r "/k %PYTHON% %1 %*"