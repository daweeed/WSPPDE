@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Builds WSPPDE base-setup consisting of a portable Python installation 
REM * including setuptools, pip and the enhanced console from scratch.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
REM Verbosity of easy_install and pip (--quiet, --verbose)
SET VERBOSITY=--quiet

ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + BUILDING WSPPDE BASIC SYSTEM (PYTHON, EASY_INSTALL, PIP, CONSOLE)
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM ## Include required scripts
CALL %~dp0\environ.bat

REM ## Clean up build system
IF EXIST %WSPPDE_TMP% RD /S /Q %WSPPDE_TMP%
MD %WSPPDE_TMP%
IF EXIST %WSPPDE_PYTHON% RD /S /Q %WSPPDE_PYTHON%
MD %WSPPDE_PYTHON%
COPY %WSPPDE_BUILD%\WSPPDE.pth %WSPPDE_PYTHON%

REM ## Integrate packages to WSPPDE
ECHO ^>^> integrating python.msi ...
msiexec /a %WSPPDE_DOWNLOADS%\python.msi /qb TARGETDIR=%WSPPDE_PYTHON%

ECHO.
ECHO ^>^> integrating easy_install.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\easy_install.exe -o%WSPPDE_TMP%\EASYINSTALL -y > NUL
XCOPY %WSPPDE_TMP%\EASYINSTALL\PURELIB\* %WSPPDE_PYTHON%\Lib\site-packages /s /i /q /Y
XCOPY %WSPPDE_TMP%\EASYINSTALL\SCRIPTS\* %WSPPDE_PYTHON%\Scripts /s /i /q /Y

REM ## Install Python installer pip
ECHO.
ECHO ^>^> executing easy_install pip ...
%WSPPDE_PYTHON%\Scripts\easy_install %VERBOSITY% pip

REM ## Clean up build system
RD /S /Q %WSPPDE_TMP%
ECHO.
ECHO ^>^> Creation of WSPPDE basic system completed !!!