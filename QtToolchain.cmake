if(NOT DEFINED ENV{VCINSTALLDIR})
  return()
endif()
if("$ENV{PROCESSOR_ARCHITECTURE}" STREQUAL "ARM64")
  set(HOST "ARM64")
else()
  set(HOST "x64")
endif()
if(HOST STREQUAL "$ENV{TGT_ARCH}")
  return()
endif()

set(CMAKE_SYSTEM_PROCESSOR "$ENV{TGT_ARCH}")
set(CMAKE_SYSTEM_NAME "Windows")

string(TOLOWER "$ENV{VSCMD_ARG_TGT_ARCH}" CURRENT_TGT_ARCH)
string(TOLOWER "$ENV{TGT_ARCH}" TGT_ARCH_LOWER)
if(CURRENT_TGT_ARCH STREQUAL TGT_ARCH_LOWER)
  return()
endif()

set(VCVARSALL_DIRECTORY "$ENV{VCINSTALLDIR}Auxiliary/Build/")

execute_process(
  WORKING_DIRECTORY "${VCVARSALL_DIRECTORY}"
  COMMAND $ENV{COMSPEC} /c "vcvarsall.bat ${HOST}_$ENV{TGT_ARCH} && set"
  COMMAND_ERROR_IS_FATAL ANY
  OUTPUT_VARIABLE ENV_DUMP
)

string(REPLACE "\r" "" ENV_DUMP "${ENV_DUMP}")

while(ENV_DUMP)
  string(FIND "${ENV_DUMP}" "\n" ENV_LINE_END)
  if(ENV_LINE_END EQUAL -1)
    set(ENV_LINE "${ENV_DUMP}")
    set(ENV_DUMP "")
  else()
    string(SUBSTRING "${ENV_DUMP}" 0 ${ENV_LINE_END} ENV_LINE)
    math(EXPR ENV_LINE_END "${ENV_LINE_END} + 1")
    string(SUBSTRING "${ENV_DUMP}" ${ENV_LINE_END} -1 ENV_DUMP)
  endif()

  if(ENV_LINE MATCHES "^([^=]*)=(.*)$")
    set(ENV{${CMAKE_MATCH_1}} "${CMAKE_MATCH_2}")
  endif()
endwhile()
