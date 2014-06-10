@ECHO OFF
REM **************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Batch script to fire up the Spyder2 IDE.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM **************************************************************************
REM ## Include required scripts
CALL %~dps0\Settings\environ.bat

REM ## Launch spyder2 IDE
START %WSPPDE_PYTHON%\pythonw.exe %WSPPDE_PYTHON%\Scripts\spyder --workdir=%WSPPDE_REPOSITORY%