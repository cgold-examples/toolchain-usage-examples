# CMakeLists.txt

cmake_minimum_required(VERSION 3.1)
project(foo)

add_library(boo INTERFACE)
target_include_directories(boo INTERFACE ${CMAKE_CURRENT_LIST_DIR})

add_executable(baz main.cpp)
target_link_libraries(baz PUBLIC boo)

if(WITH_FOO)
  add_library(foo Foo.cpp Foo.hpp)
  target_compile_features(foo PRIVATE cxx_constexpr)
  target_link_libraries(foo PUBLIC boo)
  target_link_libraries(baz PUBLIC foo)
  target_compile_definitions(baz PUBLIC WITH_FOO)
endif()
