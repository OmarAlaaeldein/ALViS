#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CGAL::CGAL_Qt5" for configuration "Release"
set_property(TARGET CGAL::CGAL_Qt5 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CGAL::CGAL_Qt5 PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/CGAL_Qt5-vc142-mt-4.14.2.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/CGAL_Qt5-vc142-mt-4.14.2.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CGAL::CGAL_Qt5 )
list(APPEND _IMPORT_CHECK_FILES_FOR_CGAL::CGAL_Qt5 "${_IMPORT_PREFIX}/lib/CGAL_Qt5-vc142-mt-4.14.2.lib" "${_IMPORT_PREFIX}/bin/CGAL_Qt5-vc142-mt-4.14.2.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
