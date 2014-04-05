@ECHO OFF
REM **************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Defines environment variables required by WSPPDE and it's components.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM **************************************************************************

REM ## Work out absolute root path to WSPPDE
SET CWD=%CD%
CHDIR %~dp0..
SET WSPPDE_ROOT=%CD%
CHDIR %CWD%

REM ## Set WSPPDE variables
SET WSPPDE_PYTHON=%WSPPDE_ROOT%\Python
SET WSPPDE_REPOSITORY=%WSPPDE_ROOT%\Repository

REM ## Set configuration directories for 3rd party packages spyder2, ipython, matploblib
SET HOME=%WSPPDE_ROOT%\Settings
SET IPYTHONDIR=%HOME%\.ipython
SET MPLCONFIGDIR=%HOME%\.matplotlib

REM ## Preppend WSPPDE pathes to Windows PATH variable
SET PATH=%WSPPDE_PYTHON%;%WSPPDE_PYTHON%\Lib\site-packages;%WSPPDE_PYTHON%\Scripts;%WSPPDE_REPOSITORY%;%PATH%