#!python.exe
'''
#######################################################################################
# Module: wsppde
# Contains utility functions automatically executed after the WSPPDE installation.
# Removes the Python interpreter path from shebang lines of all *.py, *.exe files in
# the WSPPDE\Python\Scripts folder. Execute this script after installation of 3rd party 
# packages via PIP to ensure it's portability. Optionally allows to recursively compile
# all *.py files inside WSPPDE\Python\Lib to byte code for initial speed up.
#
# @package:   WSPPDE
# @author:    cwsoft (http://cwsoft.de)
# @copyright: cwsoft
# @license:   BSD License (http://www.opensource.org/licenses/bsd-license.php)
# @python:    2.7.x
#######################################################################################
'''
import compileall
import glob
import os
import re
import sys

__version__ = "0.4.0"


class WSPPDE(object):
    '''
    WSPPDE utility class to complete/update an WSPPDE installation. Contains helpers
    to remove path information from shebang lines, to pre-compile WSPPDE *.py files.
    '''
    def __init__(self):
        # pathes of files containing shebang lines to fix
        self.shebang_pathes = (
            os.path.join(os.path.dirname(sys.executable), r"Scripts"),
            #os.path.join(os.path.dirname(sys.executable), r"Lib\site-packages")
        )

    def remove_shebang_pathes(self, quiet=True):
        '''
        Removes path information from all *.py and *.exe files defined in self.shebang_pathes
        '''
        for search_path in self.shebang_pathes:
            self._remove_shebang_pathes(search_path, quiet=quiet)

    def precompile_python_files(self, quiet=False):
        '''
        Precompiles all Python files inside WSPPDE\Python\Lib into byte code
        '''
        compileall.compile_dir(os.path.join(os.path.dirname(sys.executable), "Lib"), force=False, quiet=quiet)
            
    def _remove_shebang_pathes(self, search_path, new_shebang_line="#!python.exe", quiet=True):
        '''
        Removes path information from the shebang lines of all *.py and *.exe files
        located in the given search path (non recursive).
        '''
        # regulare expression to detect shebang line with path information
        reobj = re.compile(r"#!(.+)python\.exe")
        
        # list of all files matching *.py or *.exe in given path
        filenames = glob.glob(search_path + r"\*.py")
        filenames = filenames + glob.glob(search_path + r"\*.exe")
        
        scanned_files, wrong_files, fixed_files = 0, 0, 0
        for filename in filenames:
            # set read/write mode depending on file extension
            mode_read = "rb" if filename.endswith(".exe") else "r"
            mode_write = mode_read.replace("r", "w")
            
            with open(filename, mode_read) as input_file:
                # read file content in memory
                content = input_file.read()
                input_file.close()
                scanned_files += 1
                
                if not quiet: 
                    print "> scanning: %s" % filename,
                    
                # check if a shebang line with path information exists
                match = reobj.search(content)
                if match and match.group(1):
                    wrong_files += 1
                    # replace shebang line with new one
                    old_shebang_line = match.group()
                    content = content.replace(old_shebang_line, new_shebang_line)
                    
                    # write modified content back to file
                    with open(filename, mode_write) as output_file:
                        output_file.write(content)
                        output_file.close()
                        fixed_files += 1
                        
                        if not quiet:
                            print " ... fixed"
                else: 
                    if not quiet:
                        print " ... ok"
        
        if quiet:
            print ">> Scanned %i files in %s" % (scanned_files, search_path)
            print ">> Fixed %i/%i wrong shebang lines\n" % (fixed_files, wrong_files)

if __name__ == "__main__":
    # execute WSPPDE utility functions after WSPPDE installation/update
    wsppde = WSPPDE()
    wsppde.remove_shebang_pathes()
    answer = raw_input(">> Recursively compile all WSPPDE *.py files inside Python\Lib (Y/N)? ").upper()
    if "Y" in answer:
        wsppde.precompile_python_files()