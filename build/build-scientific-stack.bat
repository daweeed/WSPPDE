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
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + BUILDING WSPPDE SCIENTIFIC STACK (NUMPY, SCIPY, MATPLOTLIB, IPYTHON)
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

REM ## Include required scripts
CALL %~dps0\environ.bat

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

ECHO ^>^> extracting pyside.exe ...
%WSPPDE_BIN%\7z x %WSPPDE_DOWNLOADS%\pyside.exe -o%WSPPDE_TMP%\SCIENTIFIC -y > NUL

ECHO ^>^> integrating scientific binary packages ...
IF EXIST %WSPPDE_TMP%\SCIENTIFIC\PLATLIB XCOPY %WSPPDE_TMP%\SCIENTIFIC\PLATLIB\* %WSPPDE_PYTHON%\Lib\site-packages /s /i /q /Y > NUL
IF EXIST %WSPPDE_TMP%\SCIENTIFIC\PURELIB XCOPY %WSPPDE_TMP%\SCIENTIFIC\PURELIB\* %WSPPDE_PYTHON%\Lib\site-packages /s /i /q /Y > NUL
IF EXIST %WSPPDE_TMP%\SCIENTIFIC\SCRIPTS XCOPY %WSPPDE_TMP%\SCIENTIFIC\SCRIPTS\* %WSPPDE_PYTHON%\Scripts /s /i /q /Y > NUL

REM ## Execute pyside postinstall script
ECHO ^>^> executing python pyside_postinstall.py --install ...
%WSPPDE_PYTHON%\python %WSPPDE_PYTHON%\Scripts\pyside_postinstall.py -install > NUL

REM ## Install scientific packages using PIP defined in PACKAGES-PIP-SCIENTIFIC.txt
ECHO ^>^> executing pip install --requirement PACKAGES-PIP-SCIENTIFIC.TXT %VERBOSITY% ...
%WSPPDE_PYTHON%\Scripts\pip install --requirement %WSPPDE_BUILD%\PACKAGES-PIP-SCIENTIFIC.TXT %VERBOSITY%

REM ## Clean up build system
RD /S /Q %WSPPDE_TMP%
ECHO.
ECHO ^>^> Creation of WSPPDE scientific-stack completed !!!