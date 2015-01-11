@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Builds WSPPDE base-setup consisting of a portable Python installation 
REM * including package tool pip and the enhanced console from scratch.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
ECHO.
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + BUILDING WSPPDE BASIC SYSTEM (PYTHON, PIP, ENHANCED CONSOLE)
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM ## Include required scripts
CALL %~dps0\environ.bat

REM ## Clean up build system
IF EXIST %WSPPDE_TMP% RD /S /Q %WSPPDE_TMP%
MD %WSPPDE_TMP%
IF EXIST %WSPPDE_PYTHON% RD /S /Q %WSPPDE_PYTHON%
MD %WSPPDE_PYTHON%
COPY %WSPPDE_BUILD%\WSPPDE.pth %WSPPDE_PYTHON% > NUL

REM ## Integrate packages to WSPPDE
ECHO ^>^> integrating python.msi ...
msiexec /a %WSPPDE_DOWNLOADS%\python.msi /qb TARGETDIR=%WSPPDE_PYTHON%

REM ## Install Python packaging tool pip
ECHO ^>^> installing pip via the ensurepip module ...
%WSPPDE_PYTHON%\python.exe -m ensurepip --upgrade > NUL

REM ## Clean up build system
RD /S /Q %WSPPDE_TMP%
ECHO.
ECHO ^>^> Creation of WSPPDE basic system completed !!!