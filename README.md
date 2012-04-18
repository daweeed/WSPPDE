# WSPPDE - Windows&trade; Scientific Portable Python Development Environment
`WSPPDE` is a free portable Python development environment for MS Windows&trade; with focus on scientific applications. WSPPDE combines Python 2.7.3  (including the third party packages NumPy, SciPy, Matplotlib, Pandas, IPython) with a pre-configured Python IDE and an enhanced command console.

What WSPPDE is all about can best be seen from the screenshot below:

![](https://github.com/cwsoft/cwsoft-WSPPDE/raw/master/.screenshots/cwsoft-WSPPDE_screenshot.png)

Details about the third party software and Python packages distributed with WSPPDE can be found in the [Package list](https://github.com/cwsoft/cwsoft-WSPPDE/blob/master/PACKAGES.md). The history of the released WSPPDE installer packages is tracked via [Changelog](https://github.com/cwsoft/cwsoft-WSPPDE/blob/master/CHANGELOG.md). Due to GitHubs space limits for free accounts, only the last stable WSPPDE installation package will be available in the [download section](https://github.com/cwsoft/cwsoft-WSPPDE/downloads). Optional a development version for an upcoming next WSPPD version may be provided.

## Installation
WSPPDE is distributed as a self-extracting Windows installer build with the open source tool [NSIS](http://nsis.sourceforge.net/Main_Page). WSPPDE was tested on MS Windows XP (32-bit) and Windows 7 (64-bit) operating system and can be used out of the box. The required installation steps are explained below.

1. Download latest [WSPPDE Windows installer](https://github.com/cwsoft/cwsoft-WSPPDE/downloads) from GitHub
2. Excecute the installer and unpack the files to the desired target directory

## Usage
WSPPDE provides two convenient methods to start Python out of the box. 

### Python IDE
If you intent to write more than a few lines of Python code, you should use the Python IDE by excecuting `Python IDE.bat`. This fires up the PyScripter IDE, which provides code highlighting, code completion, debugging, integrated help and much more.

### Python command line
If you just want to write a few lines of Python code or do some quick tests, open the enhanced Windows command line by excecuting `Console.bat`. To start the enhanced interactive Python shell [IPython](http://ipython.org/ipython-doc/stable/overview.html), enter **ipython** to the console window. If you (for whatever reason) prefer the puristic Python standard shell, enter **python** instead. Alternatively you can use the shortcuts **CTRL+F2** (Python), **CTRL+F3** (IPython), **CTRL+F4** (IPython with Pylab), **CTRL+F5** (IPython Notebook) to run the application.

To install additional Python packages from the [Python Package index](http://pypi.python.org/pypi), open the enhanced Windows command line by excecuting `Console.bat`. To install the Python package [pep8](http://pypi.python.org/pypi/pep8) for example, enter one of the following two commands (depending on your preferred setup tool) to the console.

	pip install pep8
	easy_install pep8

To learn more about a setup tools, just enter the following to the console.

	pip --help
	easy_install --help
	
***Tip:*** Store your Python programs, modules or packages inside the WSPPDE folder *\Repository*. This folder is included to the Python search path, so files located here can be imported from the Python interpreter, IPython or the PyScripter IDE.

## Documentation
The links below provide further information about the packages used in WSPPDE.

- [PyScripter](http://code.google.com/p/pyscripter/)
- [Console](http://sourceforge.net/projects/console/)
- [Python](http://python.org), [Docu](http://docs.python.org/)
- [NumPy](http://numpy.scipy.org/), [Docu](http://docs.scipy.org/doc/)
- [SciPy](http://www.scipy.org/), [Docu](http://docs.scipy.org/doc/)
- [Matplotlib](http://matplotlib.sourceforge.net/), [Docu](http://matplotlib.sourceforge.net/contents.html)
- [Pandas](http://pypi.python.org/pypi/pandas), [Docu](http://code.google.com/p/pandas/)
- [IPython](http://ipython.org/), [PyReadline](https://launchpad.net/pyreadline), [pyzmq](http://www.zeromq.org/bindings:python), [Tornado](http://www.tornadoweb.org/)

## License
WSPPDE is released under [BSD License](http://www.opensource.org/licenses/bsd-license.php).  
The third party program Console is released under [GNU General Public License](http://www.gnu.org/licenses/).

    Copyright (c) 2012, cwsoft - http://cwsoft.de
    All rights reserved.

    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

        * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the 
          documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
    GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
    STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
    OF SUCH DAMAGE.