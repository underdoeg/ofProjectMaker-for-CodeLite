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
    
    path = ""
    name = ""
    
    if len(sys.argv)>1:
        if len(sys.argv) == 2:
            name = sys.argv[1]        
        if len(sys.argv)==3:
            path = sys.argv[1]
            name=sys.argv[2]

    if path=="":
        path = os.getcwd()
    
    if name=="":
        msg = "NAME OF THE NEW PROJECT?\n"
        name = raw_input(msg).strip()

    srcPath= os.path.join(os.path.dirname(os.path.realpath(__file__)),"emptyExample")
    path = os.path.join(path, name)
    
    
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
