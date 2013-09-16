@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Integrates the scientific-stack consisting of Numpy, SciPy, Matplotlib,
REM * IPython and Pandas into an existing WSPPDE basic system.
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
ECHO + BUILDING WSPPDE SCIENTIFIC STACK (NUMPY, SCIPY, MATPLOTLIB, IPYTHON)
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM ## Include required scripts
CALL %~dp0\environ.bat

REM ## Clean up build system
IF EXIST %WSPPDE_TMP% RD /S /Q %WSPPDE_TMP%
MD %WSPPDE_TMP%

REM ## Integrate scientific packages to WSPPDE
ECHO ^>^> extracting numpy.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\numpy.exe -o%WSPPDE_TMP% numpy*-nosse.exe -y > NUL
%WSPPDE_BIN%\7z x %WSPPDE_TMP%\numpy*-nosse.exe -o%WSPPDE_TMP%\SCIENTIFIC -y > NUL

ECHO ^>^> extracting scipy.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\scipy.exe -o%WSPPDE_TMP% scipy*-nosse.exe -y > NUL
%WSPPDE_BIN%\7z x %WSPPDE_TMP%\scipy*-nosse.exe -o%WSPPDE_TMP%\SCIENTIFIC -y > NUL

ECHO ^>^> extracting matplotlib.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\matplotlib.exe -o%WSPPDE_TMP%\SCIENTIFIC -y > NUL

ECHO ^>^> extracting pandas.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\pandas.exe -o%WSPPDE_TMP%\SCIENTIFIC -y > NUL

ECHO.
ECHO ^>^> integrating scientific binary packages ...
XCOPY %WSPPDE_TMP%\SCIENTIFIC\PLATLIB\* %WSPPDE_PYTHON%\Lib\site-packages /s /i /q /Y
XCOPY %WSPPDE_TMP%\SCIENTIFIC\PURELIB\* %WSPPDE_PYTHON%\Lib\site-packages /s /i /q /Y
XCOPY %WSPPDE_TMP%\SCIENTIFIC\SCRIPTS\* %WSPPDE_PYTHON%\Scripts /s /i /q /Y

REM ## Install ipython and pyzmq using easy_install
ECHO.
ECHO ^>^> excecuting easy_install ipython==1.1.0 pyzmq==13.1.0 ...
%WSPPDE_PYTHON%\Scripts\easy_install %VERBOSITY% ipython==1.1.0 pyzmq==13.1.0

REM ## Install scientific packages using PIP
ECHO.
ECHO ^>^> excecuting pip install tornado==3.1.1 pyreadline==2.0 python_dateutil==2.1 pyparsing==2.0.1 ...
%WSPPDE_PYTHON%\Scripts\pip install tornado==3.1.1 pyreadline==2.0 python_dateutil==2.1 pyparsing==2.0.1 %VERBOSITY%

REM ## Clean up build system
RD /S /Q %WSPPDE_TMP%
ECHO.
ECHO ^>^> Creation of WSPPDE scientific-stack completed !!!