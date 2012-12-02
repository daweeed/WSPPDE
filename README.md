# cwsoft-WSPPDE - Windows&trade; Scientific Portable Python Development Environment
`cwsoft-WSPPDE` is a free portable Python development environment for MS Windows&trade; with focus on scientific applications. WSPPDE combines Python 2.7.3  (including the third party packages IPython, Matplotlib, NumPy, Pandas, SciPy, Statsmodels) with the pre-configured Spyder2 IDE and an enhanced command console.

What cwsoft-WSPPDE is all about can best be seen from the screenshot below:

![](https://github.com/cwsoft/python-cwsoft-WSPPDE/raw/master/.screenshots/cwsoft-WSPPDE_screenshot.png)

Details about the third party software and Python packages distributed with WSPPDE can be found in the [Package list](https://github.com/cwsoft/python-cwsoft-WSPPDE/blob/master/PACKAGES.md). The history of the released WSPPDE installer packages is tracked via [Changelog](https://github.com/cwsoft/python-cwsoft-WSPPDE/blob/master/CHANGELOG.md). Due to GitHubs space limits for free accounts, only the last stable WSPPDE installation package will be available in the [download section](https://github.com/cwsoft/python-cwsoft-WSPPDE/downloads). Optional a development version for an upcoming next WSPPD version may be provided.

## Installation
WSPPDE is distributed as a self-extracting Windows installer build with the open source tool [NSIS](http://nsis.sourceforge.net/Main_Page). WSPPDE was tested on MS Windows XP (32-bit) and Windows 7 (64-bit) operating system and can be used out of the box. The required installation steps are explained below.

1. Download latest [WSPPDE Windows installer](https://github.com/cwsoft/python-cwsoft-WSPPDE/downloads) from GitHub
2. Excecute the installer and unpack the files to the desired target directory

You can also download the latest version of WSPPDE from the software archive of the German computer magazine [c´t](http://www.heise.de/ct/), following the download link below. 

<a title="WSPPDE, Download bei heise" href="http://www.heise.de/download/wsppde-1186495.html"><img alt="WSPPDE, Download bei heise" title="WSPPDE, Download bei heise" src="http://www.heise.de/software/icons/download_logo1.png" /></a>

## Usage
WSPPDE provides two convenient methods to start Python out of the box. 

### Spyder IDE
If you prefer to work with a powerfull integrated development environment (IDE), providing code highlighting and completion, debugging and an integrated help system, execute `Spyder-IDE.bat`. This fires up the open source Python IDE  [Spyder2](http://code.google.com/p/spyderlib/).

### Python/IPython Console
To install or update packages or write some quick tests, you may want to open the enhanced Windows command consolue by executing `Console.bat`. From here you can fire up the enhanced interactive Python shell [IPython](http://ipython.org/ipython-doc/stable/overview.html) by entering **ipython** to the console window. If you (for whatever reason) prefer the puristic Python standard shell, enter **python** instead. Alternatively you can use the shortcuts **CTRL+F2** (Python console), **CTRL+F3** (IPython console), **CTRL+F4** (ipython --pylab), **CTRL+F5** (ipython notebook) to launch the python application.

To install additional Python packages from the [Python Package index](http://pypi.python.org/pypi), open the enhanced Windows command line by excecuting `Console.bat`. To install the Python package [pep8](http://pypi.python.org/pypi/pep8) for example, enter one of the following two commands (depending on your preferred setup tool) to the console.

	pip install pep8
	easy_install pep8

***Tip:*** Store your Python programs, modules or packages inside the WSPPDE folder *\Repository*. This folder is included to the Python search path, so files located here can be imported from the Python interpreter, IPython or the Spyder IDE. Details about the setup tools are shown when starting the tools with the flag `--help`.

### Excecuting Python programs
As WSPPDE is a portable Python version, the default Python filetypes (.py, pyw) are not associated with the Python interpreter by default.
Of course you can always excecute Python programs from the enhanced command console or the IDE, but there is a more convenient way to do it.
Just drag and drop a Python file (.py, pyw) on the `PyLauncher.bat` icon to execute it. 

By default packages located in the Python site-package folder or your local Repository folder are regognized and imported if required. In order to use Python files outside of these two pathes, add these pathes to the `Python27\WSPPDE.pth` file. If you want, create a shortcut of the `PyLauncher.bat` and store it e.g. at your Desktop and pimp it with a new icon.

## Documentation
The links below provide further information about the software packages distributed with WSPPDE.

- [Python](http://docs.python.org/), [PyScripter](http://code.google.com/p/pyscripter/), [Console](http://sourceforge.net/projects/console/)
- [IPython](http://ipython.org/), [PyReadline](https://launchpad.net/pyreadline), [pyzmq](http://www.zeromq.org/bindings:python), [Tornado](http://www.tornadoweb.org/)
- [Matplotlib](http://matplotlib.sourceforge.net/contents.html), [NumPy](http://docs.scipy.org/doc/), [SciPy](http://docs.scipy.org/doc/)
- [Pandas](http://code.google.com/p/pandas/), [Statsmodels](http://statsmodels.sourceforge.net/)
- [Spyder](http://packages.python.org/spyder/)

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