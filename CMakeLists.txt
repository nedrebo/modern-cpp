cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(ModernCpp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Compiler setup
if(${CMAKE_CXX_COMPILER_ID} MATCHES Clang)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-weak-vtables -Wno-padded")
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Coverage")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O0 --coverage -fprofile-arcs -ftest-coverage")
endif()

# Tooling setup
if(NOT CLANG_TIDY)
  set(CLANG_TIDY_DOC_STRING "Path to the Clang Tidy tool")
  if(DEFINED ENV{CXX_CLANG_TIDY})
      set(CLANG_TIDY "$ENV{CXX_CLANG_TIDY}" CACHE FILEPATH ${CLANG_TIDY_DOC_STRING})
  else()
      find_program(CLANG_TIDY NAMES clang-tidy DOC ${CLANG_TIDY_DOC_STRING})
  endif()
  if(NOT CLANG_TIDY)
    message(FATAL_ERROR "clang-tidy not in path, use CXX_CLANG_TIDY to specify location")
  else()
    message(STATUS "Using clang-tidy: ${CLANG_TIDY}")
  endif()
endif()

set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY}")

# Dependencies
find_package(Boost REQUIRED)
add_library(boost INTERFACE IMPORTED)
set_property(TARGET boost PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIR})

# Production code
add_subdirectory(lib)
add_subdirectory(app)
add_subdirectory(examples)

# Test code
add_subdirectory(tests)
