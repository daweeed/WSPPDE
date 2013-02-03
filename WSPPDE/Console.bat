@ECHO OFF
REM **************************************************************************
REM * WSPPDE - Windows Scientific Portable Python Development Environment
REM * Batch script to fire up the enhanced Windows console.
REM *
REM * @package     WSPPDE
REM * @author      cwsoft (http://cwsoft.de)
REM * @copyright   cwsoft
REM * @license     http://www.opensource.org/licenses/bsd-license.php
REM **************************************************************************
REM ## Set required environment variables
CALL %~dp0\Settings\environ.bat

REM ## Fire up the enhanced Windows console
START %WSPPDE_ROOT%\Console\Console.exe