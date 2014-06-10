@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Wrap up WSPPDE installation (fix shebang lines, pre-compile *.py files)
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
ECHO.
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + FINALIZE WSPPDE INSTALLATION (FIX SHEBANG LINES, PRE-COMPILE *.PY FILES)
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ## Include required scripts
CALL %~dps0\environ.bat

ECHO ^>^> executing python wsppde.py
ECHO.
%WSPPDE_PYTHON%\python.exe %WSPPDE_PATH%\Repository\wsppde.py

ECHO.
ECHO ^>^> WSPPDE wrap up completed !!!