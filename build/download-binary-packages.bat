@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Downloads Python binary packages defined in "PACKAGES-PYTHON-BINARY.TXT"
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + DOWNLOADING REQUIRED PYTHON BINARY PACKAGES
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM ## Include required scripts
CALL %~dps0\environ.bat

REM ## Clean up download folder
IF EXIST %WSPPDE_DOWNLOADS% RD /S /Q %WSPPDE_DOWNLOADS%
MD %WSPPDE_DOWNLOADS%

REM ## Download packages defined in "PACKAGES-PYTHON-BINARY.TXT"
FOR /f "TOKENS=1,2 DELIMS=| " %%a IN (%~dp0\PACKAGES-PYTHON-BINARY.TXT) DO (
	ECHO ^>^> downloading package %%b ...
	%WSPPDE_BIN%\wget --no-check-certificate --quiet --output-document=%WSPPDE_DOWNLOADS%\%%b %%a
)

ECHO.
ECHO ^>^> Download of Python binary packages completed !!!