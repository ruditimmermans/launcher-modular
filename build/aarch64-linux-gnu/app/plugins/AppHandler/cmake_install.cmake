# Install script for directory: /Users/rudi/Development/launcher-modular/plugins/AppHandler

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/aarch64-linux-gnu-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/lib/aarch64-linux-gnu/AppHandler" TYPE MODULE FILES "/Users/rudi/Development/launcher-modular/build/aarch64-linux-gnu/app/plugins/AppHandler/AppHandler/libAppHandler.so")
  if(EXISTS "$ENV{DESTDIR}/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/aarch64-linux-gnu-strip" "$ENV{DESTDIR}/lib/aarch64-linux-gnu/AppHandler/libAppHandler.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/lib/aarch64-linux-gnu/AppHandler/qmldir")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/lib/aarch64-linux-gnu/AppHandler" TYPE FILE FILES "/Users/rudi/Development/launcher-modular/plugins/AppHandler/qmldir")
endif()

