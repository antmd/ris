# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

CC = gcc
CXX = g++
AR = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug32)
  OBJDIR     = obj/x32/Debug/ris
  TARGETDIR  = ../../../bin/linux/gmake/x32/Debug
  TARGET     = $(TARGETDIR)/ris
  DEFINES   +=
  INCLUDES  += -I../../../Catch/single_include -I../../../picojson -I../../../picojson_serializer -I../../../bundle
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -std=c++0x
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x32/Debug -s -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/linux/gmake/x32/Debug/libbundle.a
  LIBS      += $(LDDEPS) -lboost_system -lboost_filesystem -lboost_regex -ldl -lpthread
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	$(TARGET)
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = obj/x32/Release/ris
  TARGETDIR  = ../../../bin/linux/gmake/x32/Release
  TARGET     = $(TARGETDIR)/ris
  DEFINES   +=
  INCLUDES  += -I../../../Catch/single_include -I../../../picojson -I../../../picojson_serializer -I../../../bundle
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -std=c++0x
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x32/Release -s -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/linux/gmake/x32/Release/libbundle.a
  LIBS      += $(LDDEPS) -lboost_system -lboost_filesystem -lboost_regex -ldl -lpthread
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	$(TARGET)
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = obj/x64/Debug/ris
  TARGETDIR  = ../../../bin/linux/gmake/x64/Debug
  TARGET     = $(TARGETDIR)/ris
  DEFINES   +=
  INCLUDES  += -I../../../Catch/single_include -I../../../picojson -I../../../picojson_serializer -I../../../bundle
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -std=c++0x
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x64/Debug -s -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/linux/gmake/x64/Debug/libbundle.a
  LIBS      += $(LDDEPS) -lboost_system -lboost_filesystem -lboost_regex -ldl -lpthread
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	$(TARGET)
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = obj/x64/Release/ris
  TARGETDIR  = ../../../bin/linux/gmake/x64/Release
  TARGET     = $(TARGETDIR)/ris
  DEFINES   +=
  INCLUDES  += -I../../../Catch/single_include -I../../../picojson -I../../../picojson_serializer -I../../../bundle
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -std=c++0x
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x64/Release -s -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/linux/gmake/x64/Release/libbundle.a
  LIBS      += $(LDDEPS) -lboost_system -lboost_filesystem -lboost_regex -ldl -lpthread
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	$(TARGET)
  endef
endif

OBJECTS := \
	$(OBJDIR)/ris.o \
	$(OBJDIR)/template.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking ris
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning ris
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/ris.o: ../../../ris_app/ris.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/template.o: ../../../ris_lib/template.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
