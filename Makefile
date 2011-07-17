OPT= -O3 -DREGEXP_UNICODE 
DEBUG=
CXX=g++ 
CMP=$(CXX) -DON_64_BIT  $(DEBUG) $(OPT) 
CC=gcc 
GCC=$(CC) -DON_64_BIT 
EXE_NAME=Runtime/codelite
EXE_NAME_NO_PATH=codelite
OBJ_DIR=Release_gcc_unicode
EXT=u
OUTPUT_DIR=lib
WXCFG=--unicode=yes --debug=no
DESTDIR=

CCFLAGS= -Wall -I/usr/lib/wx/include/gtk2-unicode-release-2.8 -I/usr/include/wx-2.8 -D_FILE_OFFSET_BITS=64 -D_LARGE_FILES -D__WXGTK__ -pthread -fno-strict-aliasing -DASTYLE_LIB -DYY_NEVER_INTERACTIVE=1 -DGTK -DSCI_LEXER -DLINK_LEXERS -D__WX__ -DINSTALL_DIR=\"/usr/share/codelite\" -DPLUGINS_DIR=\"/usr/lib/codelite\"
LINK_FLAGS =  -L../$(OUTPUT_DIR) -Wl,-rpath,/usr/lib/codelite -lplugin$(EXT) -lcodelite$(EXT) -lwxsqlite3$(EXT) -lwxscintilla$(EXT) -lwxshapeframework$(EXT) -ldblayersqlite$(EXT) -L../sdk/sqlite3/lib -pthread -Wl,-Bsymbolic-functions  -lwx_gtk2u_richtext-2.8 -lwx_gtk2u_aui-2.8 -lwx_gtk2u_xrc-2.8 -lwx_gtk2u_qa-2.8 -lwx_gtk2u_html-2.8 -lwx_gtk2u_adv-2.8 -lwx_gtk2u_core-2.8 -lwx_baseu_xml-2.8 -lwx_baseu_net-2.8 -lwx_baseu-2.8 
PLUGIN_LINK_FLAGS =  -L../$(OUTPUT_DIR) -pthread -Wl,-Bsymbolic-functions  -lwx_gtk2u_richtext-2.8 -lwx_gtk2u_aui-2.8 -lwx_gtk2u_xrc-2.8 -lwx_gtk2u_qa-2.8 -lwx_gtk2u_html-2.8 -lwx_gtk2u_adv-2.8 -lwx_gtk2u_core-2.8 -lwx_baseu_xml-2.8 -lwx_baseu_net-2.8 -lwx_baseu-2.8 
INCLUDES := $(INCLUDES)  

INCLUDES := $(INCLUDES) $(shell pkg-config --cflags gtk+-2.0)
LINK_FLAGS := $(LINK_FLAGS) $(shell pkg-config --libs gtk+-2.0)
PLUGIN_LINK_FLAGS := $(PLUGIN_LINK_FLAGS) $(shell pkg-config --libs gtk+-2.0)
INCLUDES := $(INCLUDES) -I. -I../sdk/codelite_indexer/network -I../sdk/wxsqlite3/include -I../sdk/wxsqlite3/sqlite3/include -I../sdk/wxscintilla/include -I../sdk/wxscintilla/src/scintilla/include -I../sdk/wxscintilla/src/scintilla/src -I../sdk/wxscintilla/src/scintilla/lexlib -I../sdk/wxscintilla/src/scintilla/lexers -I../sdk/wxshapeframework/include -I../sdk/databaselayer/include/wx/dblayer/include -I../Interfaces -I../Debugger -I../Plugin -I../CodeLite 


OfProjectMakerObjects = \
	Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o\

## build targets
all :  pre_build OfProjectMaker post_build

pre_build:
	@echo
	@echo "----------Building project:[ OfProjectMaker - Release_gcc_unicode ]----------"
	@echo
	@test -d  $(OBJ_DIR) || mkdir $(OBJ_DIR)
	@test -d  ../$(OUTPUT_DIR) || mkdir ../$(OUTPUT_DIR)
	@test -d  ../Runtime/plugins || mkdir ../Runtime/plugins

clean:
	$(RM) ../$(OUTPUT_DIR)/OfProjectMaker.so
	$(RM) -fr $(OBJ_DIR)
	$(RM) -fr ../Runtime/plugins/OfProjectMaker.so

post_build:

OPT= -O3 -DREGEXP_UNICODE 
DEBUG=
CXX=g++ 
CMP=$(CXX) -DON_64_BIT  $(DEBUG) $(OPT) 
CC=gcc 
GCC=$(CC) -DON_64_BIT 
EXE_NAME=Runtime/codelite
EXE_NAME_NO_PATH=codelite
OBJ_DIR=Release_gcc_unicode
EXT=u
OUTPUT_DIR=lib
WXCFG=--unicode=yes --debug=no
DESTDIR=

CCFLAGS= -Wall -I/usr/lib/wx/include/gtk2-unicode-release-2.8 -I/usr/include/wx-2.8 -D_FILE_OFFSET_BITS=64 -D_LARGE_FILES -D__WXGTK__ -pthread -fno-strict-aliasing -DASTYLE_LIB -DYY_NEVER_INTERACTIVE=1 -DGTK -DSCI_LEXER -DLINK_LEXERS -D__WX__ -DINSTALL_DIR=\"/usr/share/codelite\" -DPLUGINS_DIR=\"/usr/lib/codelite\"
LINK_FLAGS =  -L../$(OUTPUT_DIR) -Wl,-rpath,/usr/lib/codelite -lplugin$(EXT) -lcodelite$(EXT) -lwxsqlite3$(EXT) -lwxscintilla$(EXT) -lwxshapeframework$(EXT) -ldblayersqlite$(EXT) -L../sdk/sqlite3/lib -pthread -Wl,-Bsymbolic-functions  -lwx_gtk2u_richtext-2.8 -lwx_gtk2u_aui-2.8 -lwx_gtk2u_xrc-2.8 -lwx_gtk2u_qa-2.8 -lwx_gtk2u_html-2.8 -lwx_gtk2u_adv-2.8 -lwx_gtk2u_core-2.8 -lwx_baseu_xml-2.8 -lwx_baseu_net-2.8 -lwx_baseu-2.8 
PLUGIN_LINK_FLAGS =  -L../$(OUTPUT_DIR) -pthread -Wl,-Bsymbolic-functions  -lwx_gtk2u_richtext-2.8 -lwx_gtk2u_aui-2.8 -lwx_gtk2u_xrc-2.8 -lwx_gtk2u_qa-2.8 -lwx_gtk2u_html-2.8 -lwx_gtk2u_adv-2.8 -lwx_gtk2u_core-2.8 -lwx_baseu_xml-2.8 -lwx_baseu_net-2.8 -lwx_baseu-2.8 
INCLUDES := $(INCLUDES)  

INCLUDES := $(INCLUDES) $(shell pkg-config --cflags gtk+-2.0)
LINK_FLAGS := $(LINK_FLAGS) $(shell pkg-config --libs gtk+-2.0)
PLUGIN_LINK_FLAGS := $(PLUGIN_LINK_FLAGS) $(shell pkg-config --libs gtk+-2.0)
INCLUDES := $(INCLUDES) -I. -I../sdk/codelite_indexer/network -I../sdk/wxsqlite3/include -I../sdk/wxsqlite3/sqlite3/include -I../sdk/wxscintilla/include -I../sdk/wxscintilla/src/scintilla/include -I../sdk/wxscintilla/src/scintilla/src -I../sdk/wxscintilla/src/scintilla/lexlib -I../sdk/wxscintilla/src/scintilla/lexers -I../sdk/wxshapeframework/include -I../sdk/databaselayer/include/wx/dblayer/include -I../Interfaces -I../Debugger -I../Plugin -I../CodeLite 


Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o: ofmaker.cpp Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o.d
	$(CMP) -c ofmaker.cpp -fPIC $(CCFLAGS)  $(INCLUDES) -o Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o
Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o.d:
	$(CMP) -fPIC $(CCFLAGS)  $(INCLUDES) -MTRelease_gcc_unicode/OfProjectMakerObjects_ofmaker.o -MFRelease_gcc_unicode/OfProjectMakerObjects_ofmaker.o.d  -MM ofmaker.cpp
Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o.i:
	$(CMP) -fPIC $(CCFLAGS)  $(INCLUDES) -E -o Release_gcc_unicode/OfProjectMakerObjects_ofmaker.o.i ofmaker.cpp

OfProjectMaker: $(OfProjectMakerObjects)
	$(CMP) -fPIC  -shared  -o ../$(OUTPUT_DIR)/OfProjectMaker.so $(OfProjectMakerObjects) $(PLUGIN_LINK_FLAGS)  -lutil
	cp -f ../$(OUTPUT_DIR)/OfProjectMaker.so ../Runtime/plugins/.

-include Release_gcc_unicode/*.o.d

