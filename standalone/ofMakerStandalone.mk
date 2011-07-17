##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ofMakerStandalone
ConfigurationName      :=Debug
IntermediateDirectory  :=../bin
OutDir                 := $(IntermediateDirectory)
WorkspacePath          := "/home/phwhitfield/softwareSources/codelite/OfProjectMaker"
ProjectPath            := "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/standalone"
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
OutputFile             :=$(IntermediateDirectory)/ofMaker
Preprocessors          :=$(PreprocessorSwitch)__WX__ 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="/home/phwhitfield/softwareSources/codelite/OfProjectMaker/standalone/ofMakerStandalone.txt"
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
Objects=$(IntermediateDirectory)/OfProjectMaker_ofdialog$(ObjectSuffix) $(IntermediateDirectory)/OfProjectMaker_main$(ObjectSuffix) 

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
	@test -d ../bin || $(MakeDirCommand) ../bin

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/OfProjectMaker_ofdialog$(ObjectSuffix): ../ofdialog.cpp $(IntermediateDirectory)/OfProjectMaker_ofdialog$(DependSuffix)
	$(CompilerName) $(IncludePCH) $(SourceSwitch) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofdialog.cpp" $(CmpOptions) $(ObjectSwitch)$(IntermediateDirectory)/OfProjectMaker_ofdialog$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/OfProjectMaker_ofdialog$(DependSuffix): ../ofdialog.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/OfProjectMaker_ofdialog$(ObjectSuffix) -MF$(IntermediateDirectory)/OfProjectMaker_ofdialog$(DependSuffix) -MM "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofdialog.cpp"

$(IntermediateDirectory)/OfProjectMaker_ofdialog$(PreprocessSuffix): ../ofdialog.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/OfProjectMaker_ofdialog$(PreprocessSuffix) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/ofdialog.cpp"

$(IntermediateDirectory)/OfProjectMaker_main$(ObjectSuffix): ../main.cpp $(IntermediateDirectory)/OfProjectMaker_main$(DependSuffix)
	$(CompilerName) $(IncludePCH) $(SourceSwitch) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/main.cpp" $(CmpOptions) $(ObjectSwitch)$(IntermediateDirectory)/OfProjectMaker_main$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/OfProjectMaker_main$(DependSuffix): ../main.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/OfProjectMaker_main$(ObjectSuffix) -MF$(IntermediateDirectory)/OfProjectMaker_main$(DependSuffix) -MM "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/main.cpp"

$(IntermediateDirectory)/OfProjectMaker_main$(PreprocessSuffix): ../main.cpp
	@$(CompilerName) $(CmpOptions) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/OfProjectMaker_main$(PreprocessSuffix) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/main.cpp"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) $(IntermediateDirectory)/OfProjectMaker_ofdialog$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/OfProjectMaker_ofdialog$(DependSuffix)
	$(RM) $(IntermediateDirectory)/OfProjectMaker_ofdialog$(PreprocessSuffix)
	$(RM) $(IntermediateDirectory)/OfProjectMaker_main$(ObjectSuffix)
	$(RM) $(IntermediateDirectory)/OfProjectMaker_main$(DependSuffix)
	$(RM) $(IntermediateDirectory)/OfProjectMaker_main$(PreprocessSuffix)
	$(RM) $(OutputFile)
	$(RM) "/home/phwhitfield/softwareSources/codelite/OfProjectMaker/.build-debug/ofMakerStandalone"


