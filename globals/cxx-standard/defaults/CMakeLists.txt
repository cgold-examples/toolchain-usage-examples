# CMakeLists.txt

cmake_minimum_required(VERSION 3.1)

set(
    CMAKE_TOOLCHAIN_FILE
    "${CMAKE_CURRENT_LIST_DIR}/cxx11.cmake"
    CACHE
    FILEPATH
    "Default toolchain"
)

project(foo)

option(WITH_FOO "Enable Foo optimization" ON)

add_library(boo INTERFACE)
target_include_directories(boo INTERFACE "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>")

add_executable(baz main.cpp)
target_link_libraries(baz PUBLIC boo)

if(WITH_FOO)
  include("${CMAKE_CURRENT_LIST_DIR}/features_used_by_foo.cmake")
  add_library(foo Foo.cpp Foo.hpp)
  target_link_libraries(foo PUBLIC boo)
  target_link_libraries(baz PUBLIC foo)
  target_compile_definitions(baz PUBLIC WITH_FOO)
endif()
