
get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()


set_and_check(HARFBUZZ_INCLUDE_DIR "${PACKAGE_PREFIX_DIR}/include/harfbuzz")

set(HARFBUZZ_VERSION "11.1.0")

# Add the libraries.
add_library(harfbuzz::harfbuzz SHARED IMPORTED)
set_target_properties(harfbuzz::harfbuzz PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include/harfbuzz"
  IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}harfbuzz.0${CMAKE_SHARED_LIBRARY_SUFFIX}")

add_library(harfbuzz::icu SHARED IMPORTED)
set_target_properties(harfbuzz::icu PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include/harfbuzz"
  INTERFACE_LINK_LIBRARIES "harfbuzz::harfbuzz"
  IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}harfbuzz-icu.0${CMAKE_SHARED_LIBRARY_SUFFIX}")

add_library(harfbuzz::subset SHARED IMPORTED)
set_target_properties(harfbuzz::subset PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include/harfbuzz"
  INTERFACE_LINK_LIBRARIES "harfbuzz::harfbuzz"
  IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}harfbuzz-subset.0${CMAKE_SHARED_LIBRARY_SUFFIX}")

# Only add the gobject library if it was built.
if (YES)
  add_library(harfbuzz::gobject SHARED IMPORTED)
  set_target_properties(harfbuzz::gobject PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include/harfbuzz"
    INTERFACE_LINK_LIBRARIES "harfbuzz::harfbuzz"
    IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}harfbuzz-gobject.0${CMAKE_SHARED_LIBRARY_SUFFIX}")
endif ()

check_required_components(harfbuzz)
