# features_used_by_foo.cmake

set(bindir "${CMAKE_CURRENT_BINARY_DIR}/foo/try_compile")
set(saved_output "${bindir}/output.txt")
set(srcfile "${CMAKE_CURRENT_LIST_DIR}/features_used_by_foo.cpp")
try_compile(
    FOO_IS_FINE
    "${bindir}"
    "${srcfile}"
    OUTPUT_VARIABLE output
)
if(NOT FOO_IS_FINE)
  file(WRITE "${saved_output}" "${output}")
  message(
      FATAL_ERROR
      "Can't compile test file:\n"
      " ${srcfile}\n"
      "Error log:\n"
      " ${saved_output}\n"
      "Please check that your compiler supports C++11 features and C++11 standard enabled."
  )
endif()
