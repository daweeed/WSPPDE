# WSPPDE - Windows&trade; Scientific Portable Python Development Environment
`WSPPDE` is a free portable Python development environment for MS Windows&trade; with focus on scientific applications. WSPPDE combines Python 2.7.3  (including the third party packages NumPy, SciPy, Matplotlib, Pandas, IPython) with a pre-configured Python IDE and an enhanced command console.

What WSPPDE is all about can best be seen from the screenshot below:

![](https://github.com/cwsoft/cwsoft-WSPPDE/raw/master/.screenshots/cwsoft-WSPPDE_screenshot.png)

Details about the third party software and Python packages distributed with WSPPDE can be found in the [Package list]((https://github.com/cwsoft/cwsoft-WSPPDE/blob/master/PACKAGES.md). The history of the released WSPPDE installer packages is tracked via [Changelog](https://github.com/cwsoft/cwsoft-WSPPDE/blob/master/CHANGELOG.md). Due to GitHubs space limits for free accounts, only the last stable WSPPDE installation package and a possible development version of the upcoming next version will be available in the [download section]([WSPPDE Windows installer](https://github.com/cwsoft/cwsoft-WSPPDE/downloads).

## Installation
WSPPDE is distributed as a self-extracting Windows installer build with the open source tool [NSIS](http://nsis.sourceforge.net/Main_Page). WSPPDE was tested on MS Windows XP (32-bit) and Windows 7 (64-bit) operating system and can be used out of the box. The required installation steps are explained below.

1. Download latest [WSPPDE Windows installer](https://github.com/cwsoft/cwsoft-WSPPDE/downloads) from GitHub
2. Excecute the installer and unpack the files to the desired target directory

## Usage
To start the integrated Python development environment, excecute `Python IDE.bat`. For help and first steps, view the PyScripter help file located in *\PyScripter\PyScripter.chm*.

To start the enhanced command shell, excecute `Console.bat`. The Python interpreter and IPython can be invoked inside the console by typing the commands **python** or **ipython**. Alternatively one can use the shortcuts **CTRL+F2** (Python), **CTRL+F3** (IPython), **CTRL+F4** (IPython with Pylab), **CTRL+F5** (IPython Notebook) to start the applications inside the console.

***Tip:*** Your custom Python programs, modules or packages should be stored inside the WSPPDE *\Repository* folder. This folder is included by default in the Python search path, so files located here can be imported from the Python interpreter, IPython or the Python IDE.

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