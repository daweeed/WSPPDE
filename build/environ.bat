@ECHO OFF
REM *****************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Defines variables used by the WSPPDE make scripts.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM *****************************************************************************
REM ## Work out absolute root path to WSPPDE
SET CWD=%CD%
CHDIR %~dp0..
SET WSPPDE_ROOT=%CD%
CHDIR %CWD%

REM ## Define WSPPDE variables
SET WSPPDE_DOWNLOADS=%WSPPDE_ROOT%\downloads
SET WSPPDE_TMP=%WSPPDE_ROOT%\tmp
SET WSPPDE_BUILD=%WSPPDE_ROOT%\build
SET WSPPDE_BIN=%WSPPDE_BUILD%\bin
SET WSPPDE_PATH=%WSPPDE_ROOT%\WSPPDE
SET WSPPDE_CONSOLE=%WSPPDE_PATH%\Console
SET WSPPDE_PYTHON=%WSPPDE_PATH%\Python