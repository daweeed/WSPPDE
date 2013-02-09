@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Script to download Windows binary files in "PYTHON-BINARY-PACKAGES.TXT"
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + DOWNLOADING REQUIRED WSPPDE BINARY PACKAGES
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM ## Include required scripts
CALL %~dp0\environ.bat

REM ## Clean up download folder
IF EXIST %WSPPDE_DOWNLOADS% RD /S /Q %WSPPDE_DOWNLOADS%
MD %WSPPDE_DOWNLOADS%

REM ## Download packages defined in "BINARY-PACKAGES.TXT"
FOR /f "TOKENS=1,2 DELIMS=| " %%a IN (%~dp0\BINARY-PACKAGES.TXT) DO (
	ECHO ^>^> downloading binary package %%b ...
	%WSPPDE_BIN%\wget --quiet --output-document=%WSPPDE_DOWNLOADS%\%%b %%a
)

ECHO.
ECHO ^>^> Download of binary packages completed !!!