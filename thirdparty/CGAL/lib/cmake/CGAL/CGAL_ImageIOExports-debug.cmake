#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CGAL::CGAL_ImageIO" for configuration "Debug"
set_property(TARGET CGAL::CGAL_ImageIO APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CGAL::CGAL_ImageIO PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/CGAL_ImageIO-vc142-mt-gd-4.14.2.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/CGAL_ImageIO-vc142-mt-gd-4.14.2.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CGAL::CGAL_ImageIO )
list(APPEND _IMPORT_CHECK_FILES_FOR_CGAL::CGAL_ImageIO "${_IMPORT_PREFIX}/lib/CGAL_ImageIO-vc142-mt-gd-4.14.2.lib" "${_IMPORT_PREFIX}/bin/CGAL_ImageIO-vc142-mt-gd-4.14.2.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
