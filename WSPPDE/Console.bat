@ECHO OFF
REM **************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM *
REM * Batch script to start a Windows console for the convenient usage of
REM * the Python 2.7 interpreter or a IPython shell out of the box.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM **************************************************************************

REM ## SET PATH TO ACTUAL BATCH FILE
SET BATCH_PATH=%~dp0

REM ## SET ENVIRONMENT VARIABLES USED IN .\Console\console.xml
SET PYTHON="%BATCH_PATH%Python27\python.exe"
SET IPYTHON="%BATCH_PATH%Python27\Scripts\ipython-script.py"
SET PYLAB="%BATCH_PATH%Python27\Scripts\ipython-script.py" --pylab
SET NOTEBOOK="%BATCH_PATH%Python27\Scripts\ipython-script.py" notebook --pylab inline
SET STARTUP_PATH=%BATCH_PATH%Repository

REM ## SET PATH FOR IPYTHON AND MATPLOTLIB CONFIGURATION FILES
SET IPYTHONDIR=%BATCH_PATH%.ipython
SET MPLCONFIGDIR=%BATCH_PATH%.matplotlib

REM ## PREPEND PATH TO PYTHON INTERPRETER AND SCRIPT FOLDER TO THE SYSTEM PATH
SET PATH=%BATCH_PATH%Python27;%BATCH_PATH%Python27\Scripts;%PATH%

REM ## START THE CONSOLE
START .\Console\Console.exe