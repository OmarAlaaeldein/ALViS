#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CGAL::CGAL_Core" for configuration "Debug"
set_property(TARGET CGAL::CGAL_Core APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CGAL::CGAL_Core PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CGAL_Core-vc142-mt-gd-4.14.2.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CGAL_Core-vc142-mt-gd-4.14.2.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CGAL::CGAL_Core )
list(APPEND _IMPORT_CHECK_FILES_FOR_CGAL::CGAL_Core "${_IMPORT_PREFIX}/lib/CGAL_Core-vc142-mt-gd-4.14.2.lib" "${_IMPORT_PREFIX}/bin/CGAL_Core-vc142-mt-gd-4.14.2.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
