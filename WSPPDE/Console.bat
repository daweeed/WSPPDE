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
CALL .\Settings\environ.bat

REM ## Fire up the enhanced Windows console using tab "MS Bash" as default
START "Console" "%WSPPDE_ROOT%\Console\Console.exe" -w "Console" -t "MS Bash"