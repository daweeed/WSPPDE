@ECHO OFF
ECHO ****************************************************************************
ECHO * WSPPDE - Windows Scientific Portable Python Development Environment
ECHO * Make script to create a portable Windows Python environment from scratch.
ECHO *
ECHO * @package     WSPPDE
ECHO * @author      cwsoft (http://cwsoft.de)
ECHO * @copyright   cwsoft
ECHO * @license     http://www.opensource.org/licenses/bsd-license.php
ECHO ****************************************************************************
REM ## Download required WSPPDE binary packages
CALL %~dp0\build\download-binary-packages.bat

REM ## Build WSPPDE basic system: Python, easy install, pip, enhanced console
CALL %~dp0\build\build-basic-system.bat

REM ## Build WSPPDE scientific system: IPython, NumPy, SciPy, Pandas, Spyder IDE
CALL %~dp0\build\build-scientific-stack.bat

REM ## Build WSPPDE spyder-setup: sypder, sphinx, pyflakes, pylint, pep8
CALL %~dp0\build\build-spyder-stack.bat

REM ## fix shebang lines of *.py and *.exe files located in Python\Scripts
ECHO.
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + FIXING SHEBANG LINES OF *.PY AND *.EXE FILES LOCATED IN PYTHON\SCRIPTS
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO ^>^> executing python fix_shebang_lines.py
%~dp0\WSPPDE\Python\python.exe %~dp0\WSPPDE\Repository\fix_shebang_lines.py

ECHO.
ECHO.
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO + CREATION OF WINDOWS SCIENTIFIC PORTABLE PYTHON ENVIRONMENT COMPLETED
ECHO ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ECHO.
PAUSE