##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## DebugUnicode
ProjectName            :=ofMaker
ConfigurationName      :=DebugUnicode
IntermediateDirectory  :=./DebugUnicode
OutDir                 := $(IntermediateDirectory)
WorkspacePath          := "/home/phwhitfield/softwareSources/codelite/OfProjectMaker"
ProjectPath            := "/home/phwhitfield/softwareSources/codelite/OfProjectMaker"
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Philip Whitfield
Date                   :=07/18/2011
CodeLitePath           :="/home/phwhitfield/.codelite"
LinkerName             :=g++
ArchiveTool            :=ar rcus
SharedObjectLinkerName :=g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.o.i
DebugSwitch            :=-gstab
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
CompilerName           :=g++
C_CompilerName         :=gcc
OutputFile             :=$(ConfigurationName)/ofMaker.so
Preprocessors          :=$(PreprocessorSwitch)__WX__ $(PreprocessorSwitch)WXUSINGDLL $(PreprocessorSwitch)WXUSINGDLL_SCI $(PreprocessorSwitch)WXUSINGDLL_WXSQLITE3 $(PreprocessorSwitch)WXUSINGDLL_SDK $(PreprocessorSwitch)WXUSINGDLL_CL $(PreprocessorSwitch)YY_NEVER_INTERACTIVE=1 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofMaker.txt"
MakeDirCommand         :=mkdir -p
CmpOptions             := -g $(shell wx-config --cxxflags --debug=yes --unicode=yes) $(Preprocessors)
C_CmpOptions           := -g $(shell wx-config --cxxflags --debug=yes --unicode=yes) $(Preprocessors)
LinkOptions            :=  $(shell wx-config --debug=yes --libs --unicode=yes) 
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)..//Interfaces $(IncludeSwitch)..//CodeLite $(IncludeSwitch)..//Plugin $(IncludeSwitch)..//sdk/wxsqlite3/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)pluginud $(LibrarySwitch)codeliteud $(LibrarySwitch)wxsqlite3ud 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)..//lib 


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects=$(IntermediateDirectory)/ofmaker$(ObjectSuffix) $(IntermediateDirectory)/ofdialog$(ObjectSuffix) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects) > $(ObjectsFileList)
	$(SharedObjectLinkerName) $(OutputSwitch)$(OutputFile) $(Objects) $(LibPath) $(Libs) $(LinkOptions)
	@$(MakeDirCommand) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/.build-release"
	@echo rebuilt > "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/.build-release/ofMaker"

$(IntermediateDirectory)/.d:
	@test -d ./DebugUnicode || $(MakeDirCommand) ./DebugUnicode

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/ofmaker$(ObjectSuffix): ofmaker.cpp $(IntermediateDirectory)/ofmaker$(DependSuffix)
	$(CompilerName) $(IncludePCH) $(SourceSwitch) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofmaker.cpp" $(CmpOptions) $(ObjectSwitch)$(IntermediateDirectory)/ofmaker$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ofmaker$(DependSuffix): ofmaker.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ofmaker$(ObjectSuffix) -MF$(IntermediateDirectory)/ofmaker$(DependSuffix) -MM "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofmaker.cpp"

$(IntermediateDirectory)/ofmaker$(PreprocessSuffix): ofmaker.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ofmaker$(PreprocessSuffix) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofmaker.cpp"

$(IntermediateDirectory)/ofdialog$(ObjectSuffix): ofdialog.cpp $(IntermediateDirectory)/ofdialog$(DependSuffix)
	$(CompilerName) $(IncludePCH) $(SourceSwitch) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofdialog.cpp" $(CmpOptions) $(ObjectSwitch)$(IntermediateDirectory)/ofdialog$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ofdialog$(DependSuffix): ofdialog.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ofdialog$(ObjectSuffix) -MF$(IntermediateDirectory)/ofdialog$(DependSuffix) -MM "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofdialog.cpp"

$(IntermediateDirectory)/ofdialog$(PreprocessSuffix): ofdialog.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ofdialog$(PreprocessSuffix) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofdialog.cpp"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) $(IntermediateDirectory)/ofmaker$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/ofmaker$(DependSuffix)
	$(RM) $(IntermediateDirectory)/ofmaker$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/ofdialog$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/ofdialog$(DependSuffix)
	$(RM) $(IntermediateDirectory)/ofdialog$(PreprocessSuffix)
	$(RM) $(OutputFile)
	$(RM) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/.build-release/ofMaker"


