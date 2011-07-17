import sys
import os
import shutil

def replaceInFile(file, old, new):
    input = open(file)
    output = open(file+".tmp", 'w')
    for s in input:
        output.write(s.replace(old,new))
    input.close()
    output.close()
    os.remove(file)
    os.rename(file+".tmp", file)
    
if __name__== '__main__':
    '''
    path = ""
    
    if len(sys.argv)>1:
        for arg in sys.argv:
            path = arg
    if path == "":
    '''
    
    path = os.getcwd()
    
    msg = "NAME OF THE NEW PROJECT?\n"
    name = raw_input(msg).strip()
    path = os.path.join(path, name)
    srcPath= os.path.join(os.path.dirname(os.path.realpath(__file__)),"emptyExample")
    shutil.copytree(srcPath, path)
    for file in os.listdir(path):
        title, ext = os.path.splitext(os.path.basename(file))
        curFile=os.path.join(path, file)
        if os.path.isdir(curFile) == False:
            replaceInFile(curFile, "emptyExample", name)
            replaceInFile(curFile, "testApp", name+"App")
        if title=="emptyExample":
            os.rename(curFile,os.path.join(path, name+ext))
    
    for file in os.listdir(os.path.join(path, "src")):
        curFile=os.path.join(path, "src", file)
        title, ext = os.path.splitext(os.path.basename(file))
        if os.path.isdir(curFile) == False:
            replaceInFile(curFile, "testApp", name+"App")
        if title=="testApp":
            os.rename(curFile,os.path.join(path, "src", name+"App"+ext))
    
    print "All went well... check "+path
    
'''
import pygtk
pygtk.require('2.0')
import gtk

class ProjectMaker:
    def click(self, widget, data=None):
        print("hellou")
    
    def destroy(self):
        gtk.main_quit()
        
    def file_ok_sel(self, w):
        print self.filew.get_filename()
    
    def __init__(self):
        fc = gtk.FileChooserDialog("SELECT FOLDER FOR THE NEW OF PROJECT", buttons=(gtk.STOCK_CANCEL,gtk.RESPONSE_CANCEL,gtk.STOCK_OPEN,gtk.RESPONSE_OK))
        response = fc.run()
        
        if response == gtk.RESPONSE_OK:
            print 'ok'
            print fc.get_filename()
            self.entry.set_text(fc.get_filename())
            g_directory = fc.get_current_folder()
        else:
            self.destroy()
        
    def run(self):
        gtk.main()
        
if __name__== '__main__':
    maker = ProjectMaker()
    maker.run()
    
'''
