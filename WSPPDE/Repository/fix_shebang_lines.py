#! python.exe
'''
#######################################################################################
# Module: fix_shebang_lines
# Removes path information from shebang lines to allow shifthin portable Python WSPPDE
# installation to another location without running into issues.
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
import glob
import os
import sys

__version__ = "0.1.0"

def fix_shebang_line(path, shebang_line="#! python.exe\n"):
    '''Updates shebang lines of all Python files located in path with given string'''
    python_files = glob.glob(path + "\*.py")
    if not python_files:
        print "No python scripts found in %r" % os.path.abspath(path)
        return

    for python_file in python_files:    
        print "> processing: %r" % python_file
        
        with open(python_file, "r+") as file_handle:
            data = file_handle.readlines()           
            first_line = data[0]
            if not (first_line.startswith("#!") and "python" in first_line):
                print "  no shebang line found ... skipped\n"
                continue
            
            data[0] = shebang_line
            file_handle.seek(0)            
            file_handle.writelines(data)
            print "  shebang line replaced ...\n"    
    

if __name__ == "__main__":
    # pathes to search
    search_pathes = (
        os.path.dirname(sys.executable) + "\Scripts",
        os.path.dirname(sys.executable) + "\Lib\site-packages",
    )
    
    # fix shebang lines in all Python files located in search pathes    
    for search_path in search_pathes:
        fix_shebang_line(search_path)