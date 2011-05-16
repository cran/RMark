System Requirements

RMark requires installation of MARK which is available at http://www.cnr.colostate.edu/~gwhite/mark/mark.htm.
You only need mark.exe and rel_32.exe from the installation unless you are going to use the MARK interface as well.  If you use
the default directory of c:/Program Files/Mark for the installation then RMark will find the executables. For a 64 bit
machine, MARK will install in c:/Program Files (x86)/Mark.  If you add this driectory to the Path statement (Control Panel/System/Advanced),
RMark will find the executables.  Or you can also define an object MarkPath with a string value which gives the
path (e.g., MarkPath="c:/Program Files (x86)/mark").  

RMark also uses notepad.exe to show output files.  You can optionally set MarkViewer to an executable that will be used to display the
output files. 