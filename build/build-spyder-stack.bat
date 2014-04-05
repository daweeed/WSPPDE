@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Integrates the spyder-stack consisting of the Spyder IDE and the packages
REM * sphinx, pyflakes, rope, pylint, pep8 into an existing WSPPDE basic system.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
REM Verbosity of easy_install and pip (--quiet, --verbose)
SET VERBOSITY=--quiet

ECHO.
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + BUILD WSPPDE SPYDER-STACK (SPYDER, SPHINX, PYFLAKES, ROPE, PYLINT, PEP8)
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM ## Include required scripts
CALL %~dp0\environ.bat

REM ## Clean up build system
IF EXIST %WSPPDE_TMP% RD /S /Q %WSPPDE_TMP%
MD %WSPPDE_TMP%

REM ## Integrate pyside package to WSPPDE
ECHO ^>^> extracting pyside.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\pyside.exe -o%WSPPDE_TMP% -y > NUL

ECHO ^>^> integrating pyside binary package ...
XCOPY %WSPPDE_TMP%\PURELIB\* %WSPPDE_PYTHON%\Lib\site-packages /s /i /q /Y > NUL
XCOPY %WSPPDE_TMP%\SCRIPTS\* %WSPPDE_PYTHON%\Scripts /s /i /q /Y > NUL

ECHO ^>^> executing python pyside_postinstall.py --install ...
%WSPPDE_PYTHON%\python %WSPPDE_PYTHON%\Scripts\pyside_postinstall.py -install > NUL

REM ## Install spyder packages using PIP defined in PACKAGES-PIP-SPYDER.TXT
ECHO ^>^> executing pip install --requirement PACKAGES-PIP-SPYDER.TXT %VERBOSITY% ...
%WSPPDE_PYTHON%\Scripts\pip install --requirement %WSPPDE_BUILD%\PACKAGES-PIP-SPYDER.TXT %VERBOSITY%

REM ## Clean up build system
RD /S /Q %WSPPDE_TMP%
ECHO.
ECHO ^>^> Creation of WSPPDE spyder-stack completed !!!