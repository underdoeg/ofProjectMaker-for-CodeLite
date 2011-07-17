##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ofMakerStandalone
ConfigurationName      :=Debug
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
WorkspacePath          := "/home/phwhitfield/softwareSources/codelite/OfProjectMaker"
ProjectPath            := "/home/phwhitfield/softwareSources/codelite/OfProjectMaker"
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Philip Whitfield
Date                   :=07/17/2011
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
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=$(PreprocessorSwitch)__WX__ 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofMakerStandalone.txt"
MakeDirCommand         :=mkdir -p
CmpOptions             := -g $(shell wx-config --cxxflags --unicode=yes --debug=yes) $(Preprocessors)
C_CmpOptions           := -g $(shell wx-config --cxxflags --unicode=yes --debug=yes) $(Preprocessors)
LinkOptions            :=  -mwindows $(shell wx-config --debug=yes --libs --unicode=yes)
IncludePath            :=  $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
LibPath                := $(LibraryPathSwitch). 


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects=$(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/ofdialog$(ObjectSuffix) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects) > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) $(Objects) $(LibPath) $(Libs) $(LinkOptions)

$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main$(ObjectSuffix): main.cpp $(IntermediateDirectory)/main$(DependSuffix)
	$(CompilerName) $(IncludePCH) $(SourceSwitch) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/main.cpp" $(CmpOptions) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main$(DependSuffix): main.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) -MM "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/main.cpp"

$(IntermediateDirectory)/main$(PreprocessSuffix): main.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main$(PreprocessSuffix) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/main.cpp"

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
	$(RM) $(IntermediateDirectory)/main$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/main$(DependSuffix)
	$(RM) $(IntermediateDirectory)/main$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/ofdialog$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/ofdialog$(DependSuffix)
	$(RM) $(IntermediateDirectory)/ofdialog$(PreprocessSuffix)
	$(RM) $(OutputFile)
	$(RM) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/.build-debug/ofMakerStandalone"


