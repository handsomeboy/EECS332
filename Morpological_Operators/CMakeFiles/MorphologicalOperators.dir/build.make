# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/cmake-gui

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/josiah/Documents/School/332/EECS332/Morpological_Operators

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/josiah/Documents/School/332/EECS332/Morpological_Operators

# Include any dependencies generated for this target.
include CMakeFiles/MorphologicalOperators.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MorphologicalOperators.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MorphologicalOperators.dir/flags.make

CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o: CMakeFiles/MorphologicalOperators.dir/flags.make
CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o: MorphologicalOperators.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/josiah/Documents/School/332/EECS332/Morpological_Operators/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o -c /home/josiah/Documents/School/332/EECS332/Morpological_Operators/MorphologicalOperators.cpp

CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/josiah/Documents/School/332/EECS332/Morpological_Operators/MorphologicalOperators.cpp > CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.i

CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/josiah/Documents/School/332/EECS332/Morpological_Operators/MorphologicalOperators.cpp -o CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.s

CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.requires:
.PHONY : CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.requires

CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.provides: CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.requires
	$(MAKE) -f CMakeFiles/MorphologicalOperators.dir/build.make CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.provides.build
.PHONY : CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.provides

CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.provides.build: CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o

# Object files for target MorphologicalOperators
MorphologicalOperators_OBJECTS = \
"CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o"

# External object files for target MorphologicalOperators
MorphologicalOperators_EXTERNAL_OBJECTS =

MorphologicalOperators: CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o
MorphologicalOperators: CMakeFiles/MorphologicalOperators.dir/build.make
MorphologicalOperators: /usr/local/lib/libopencv_calib3d.so
MorphologicalOperators: /usr/local/lib/libopencv_contrib.so
MorphologicalOperators: /usr/local/lib/libopencv_core.so
MorphologicalOperators: /usr/local/lib/libopencv_features2d.so
MorphologicalOperators: /usr/local/lib/libopencv_flann.so
MorphologicalOperators: /usr/local/lib/libopencv_gpu.so
MorphologicalOperators: /usr/local/lib/libopencv_highgui.so
MorphologicalOperators: /usr/local/lib/libopencv_imgproc.so
MorphologicalOperators: /usr/local/lib/libopencv_legacy.so
MorphologicalOperators: /usr/local/lib/libopencv_ml.so
MorphologicalOperators: /usr/local/lib/libopencv_nonfree.so
MorphologicalOperators: /usr/local/lib/libopencv_objdetect.so
MorphologicalOperators: /usr/local/lib/libopencv_photo.so
MorphologicalOperators: /usr/local/lib/libopencv_stitching.so
MorphologicalOperators: /usr/local/lib/libopencv_ts.so
MorphologicalOperators: /usr/local/lib/libopencv_video.so
MorphologicalOperators: /usr/local/lib/libopencv_videostab.so
MorphologicalOperators: CMakeFiles/MorphologicalOperators.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable MorphologicalOperators"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MorphologicalOperators.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MorphologicalOperators.dir/build: MorphologicalOperators
.PHONY : CMakeFiles/MorphologicalOperators.dir/build

CMakeFiles/MorphologicalOperators.dir/requires: CMakeFiles/MorphologicalOperators.dir/MorphologicalOperators.o.requires
.PHONY : CMakeFiles/MorphologicalOperators.dir/requires

CMakeFiles/MorphologicalOperators.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MorphologicalOperators.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MorphologicalOperators.dir/clean

CMakeFiles/MorphologicalOperators.dir/depend:
	cd /home/josiah/Documents/School/332/EECS332/Morpological_Operators && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/josiah/Documents/School/332/EECS332/Morpological_Operators /home/josiah/Documents/School/332/EECS332/Morpological_Operators /home/josiah/Documents/School/332/EECS332/Morpological_Operators /home/josiah/Documents/School/332/EECS332/Morpological_Operators /home/josiah/Documents/School/332/EECS332/Morpological_Operators/CMakeFiles/MorphologicalOperators.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MorphologicalOperators.dir/depend

