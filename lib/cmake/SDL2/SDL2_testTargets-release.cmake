#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SDL2::SDL2_test" for configuration "Release"
set_property(TARGET SDL2::SDL2_test APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SDL2::SDL2_test PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libSDL2_test.a"
  )

list(APPEND _cmake_import_check_targets SDL2::SDL2_test )
list(APPEND _cmake_import_check_files_for_SDL2::SDL2_test "${_IMPORT_PREFIX}/lib/libSDL2_test.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
