# Move PDBs into the build folder
if(DEFINED QT_PDB_DIR)
  file(GLOB_RECURSE PDBS
    "${CMAKE_INSTALL_PREFIX}/lib/*.pdb"
    "${CMAKE_INSTALL_PREFIX}/plugins/*/*.pdb"
    "${CMAKE_INSTALL_PREFIX}/bin/*.pdb"
    "${CMAKE_INSTALL_PREFIX}/libexec/*.pdb"
  )
  foreach(PDB IN LISTS PDBS)
    file(RELATIVE_PATH RELPATH "${CMAKE_INSTALL_PREFIX}" "${PDB}")
    get_filename_component(DIR "${RELPATH}" DIRECTORY)
    file(MAKE_DIRECTORY "${QT_PDB_DIR}/${DIR}")
    file(RENAME "${PDB}" "${QT_PDB_DIR}/${RELPATH}")
  endforeach()
endif()

# Remove unwanted files
file(REMOVE_RECURSE 
  # Debug tools (we use the Release ones)
  "${CMAKE_INSTALL_PREFIX}/bin/Debug"
  "${CMAKE_INSTALL_PREFIX}/libexec/Debug"
  # Documentation
  "${CMAKE_INSTALL_PREFIX}/doc"
)
file(GLOB_RECURSE SUPERFLUOUS
  "${CMAKE_INSTALL_PREFIX}/*.prl"
)
file(REMOVE ${SUPERFLUOUS})
