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
CALL %~dp0\environ.bat

REM ## Remove path from shebang lines of files inside WSPPDE\Python\Scripts
ECHO ^>^> executing python fix_shebang_lines.py
%WSPPDE_PYTHON%\python.exe %WSPPDE_PATH%\Repository\fix_shebang_lines.py

REM ## Optionally compile Python files *.py into byte code *.pyc
ECHO.
ECHO.
SET /p answer=^>^> Recursively compile *.py files in WSPPDE\Python\Lib into byte code (Y/N)?: 
IF /i "%answer:~,1%" EQU "Y" (
    ECHO ^>^> executing python -m compileall WSPPDE\Python\Lib
	%WSPPDE_PYTHON%\python.exe -m compileall %WSPPDE_PYTHON%\Lib
)

ECHO.
ECHO ^>^> WSPPDE wrap up completed !!!