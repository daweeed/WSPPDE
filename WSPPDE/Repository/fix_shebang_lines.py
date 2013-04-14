#! python.exe
'''
#######################################################################################
# Module: fix_shebang_lines
# Removes the path information to the Python interpreter from all shebang lines to
# avoid possible issues when shifting WSPPDE to another location.
#
# @package:   WSPPDE
# @author:    cwsoft (http://cwsoft.de)
# @copyright: cwsoft
# @license:   BSD License (http://www.opensource.org/licenses/bsd-license.php)
# @python:    2.7.x
#
# NOTE: Used TABS for block indentation, so do not mess up with SPACES
#######################################################################################
'''
import fileinput
import glob
import os
import sys

__version__ = "0.2.0"

def update_shebang_lines(path, shebang_line="#! python.exe\n"):
    '''Updates shebang lines of all Python files located in path with given string'''
    python_files = glob.glob(path + "\*.py")
    if not python_files:
        print "No python scripts found in %r" % os.path.abspath(path)
        return

    for python_file in python_files:    
        print "> processing: %r" % python_file

        file_handle = fileinput.input(files=python_file, inplace=1)
        for line in file_handle:
            if line.startswith("#!") and "python" in line:
                line = shebang_line
            print line,

if __name__ == "__main__":
    # search pathes to be scanned
    search_pathes = (
        os.path.join(os.path.dirname(sys.executable), "Scripts"),
        os.path.join(os.path.dirname(sys.executable), "Lib\site-packages"),
    )
    
    # fix shebang lines in all Python files located in search pathes    
    for search_path in search_pathes:
        update_shebang_lines(search_path)