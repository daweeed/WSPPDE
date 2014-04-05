#!python.exe
'''
#######################################################################################
# Module: fix_shebang_lines
# Removes the path information from the shebang lines of all *.py and *.exe files 
# located in the specified folders to allow moving WSPPDE to other locations as well.
#
# @package:   WSPPDE
# @author:    cwsoft (http://cwsoft.de)
# @copyright: cwsoft
# @license:   BSD License (http://www.opensource.org/licenses/bsd-license.php)
# @python:    2.7.x
#######################################################################################
'''
import glob
import os
import re
import sys

__version__ = "0.3.0"


def fix_shebang_lines(search_path, new_shebang_line="#!python.exe", verbose=True):
    '''
    Removes path information from the shebang lines of all *.py and *.exe files
    located in the given search path (non recursive).
    '''
    # regulare expression to detect shebang line with path information
    reobj = re.compile(r"#!(.+)python\.exe")
    
    # list of all files matching *.py or *.exe in given path
    filenames = glob.glob(search_path + r"\*.py")
    filenames = filenames + glob.glob(search_path + r"\*.exe")
    
    for filename in filenames:
        # set read/write mode depending on file extension
        mode_read = "rb" if filename.endswith(".exe") else "r"
        mode_write = mode_read.replace("r", "w")

        with open(filename, mode_read) as input_file:
            # read file content in memory
            content = input_file.read()
            input_file.close()
            
            if verbose: 
                print "> scanning: %s" % filename,
                
            # check if a shebang line with path information exists
            match = reobj.search(content)
            if match and match.group(1):
                # replace shebang line with new one
                old_shebang_line = match.group()
                content = content.replace(old_shebang_line, new_shebang_line)
                
                # write modified content back to file
                with open(filename, mode_write) as output_file:
                    output_file.write(content)
                    output_file.close()
                    
                    if verbose:
                        print " ... fixed"
            else: 
                if verbose:
                    print " ... ok"
            

if __name__ == "__main__":
    # define search pathes containing files to fix
    search_pathes = (
        os.path.join(os.path.dirname(sys.executable), r"Scripts"),
        #os.path.join(os.path.dirname(sys.executable), r"Lib\site-packages")
    )
    
    # fix shebang lines in all *.py, *.exe files found in given path (non recursive)
    for search_path in search_pathes:
        fix_shebang_lines(search_path)