@ECHO OFF
REM **************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM *
REM * Batch script to start the PyScripter IDE.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM **************************************************************************

REM ## SET PATH TO ACTUAL BATCH FILE
SET BATCH_PATH=%~dp0
SET PYTHON=Python27

REM ## SET ENVIRONMENT VARIABLE FOR PYTHONHOME
SET PYTHONHOME=%BATCH_PATH%%PYTHON%

REM ## START PYSCRIPTER IDE
START .\PyScripter\Pyscripter.exe --PYTHON27 --PYTHONDLLPATH "%PYTHONHOME%"