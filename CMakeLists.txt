cmake_minimum_required(VERSION 3.21)
project(dolphin-externals-qt LANGUAGES NONE)

function(determine_system_processor SYSTEM_PROCESSOR OUTPUT_VAR)
  if(SYSTEM_PROCESSOR MATCHES "aarch64|arm64|ARM64")
    set(${OUTPUT_VAR} "ARM64" PARENT_SCOPE)
  elseif(SYSTEM_PROCESSOR MATCHES "x64|x86_64|amd64|AMD64")
    set(${OUTPUT_VAR} "x64" PARENT_SCOPE)
  else()
    message(FATAL_ERROR "Unsupported system processor: ${SYSTEM_PROCESSOR}")
  endif()
endfunction()

determine_system_processor(${CMAKE_HOST_SYSTEM_PROCESSOR} SYSTEM_PROCESSOR)
determine_system_processor(${CMAKE_SYSTEM_PROCESSOR} TARGET_PROCESSOR)

if(NOT TARGET_PROCESSOR STREQUAL $ENV{TGT_ARCH})
  message(FATAL_ERROR "Target architecture ($ENV{TGT_ARCH}) does not match the compiler's architecture (${TARGET_PROCESSOR})\n"
  "Your cross-compiling environment is not set up correctly.")
endif()

if(NOT SYSTEM_PROCESSOR STREQUAL TARGET_PROCESSOR)
  set(QT_HOST_PATH "${CMAKE_SOURCE_DIR}/${CMAKE_HOST_SYSTEM_NAME}/${SYSTEM_PROCESSOR}")
endif()

if(QT_HOST_PATH AND NOT EXISTS "${QT_HOST_PATH}")
  message(FATAL_ERROR "Qt host build path does not exist: ${QT_HOST_PATH}\n"
  "Please build and install the host Qt first.")
endif()

set(BUILD_SHARED_LIBS OFF)
set(QT_MODULES qtbase qtsvg)
set(QT_BUILD_TESTS OFF)
set(QT_BUILD_EXAMPLES OFF)
set(QT_UNITY_BUILD ON)
# Trim Qt to just what Dolphin needs.
set(INPUT_opengl no)
set(FEATURE_vulkan OFF)
set(FEATURE_direct2d1_1 OFF)
set(FEATURE_xml OFF)
set(FEATURE_sql OFF)
set(FEATURE_network OFF)
set(FEATURE_printsupport OFF)
set(FEATURE_zstd OFF)
set(FEATURE_testlib OFF)
set(FEATURE_concurrent OFF)
set(FEATURE_gif OFF)
set(FEATURE_ico OFF)
set(FEATURE_jpeg OFF)
set(FEATURE_tiff OFF)
set(FEATURE_webp OFF)
set(FEATURE_imageformat_bmp OFF)
set(FEATURE_textmarkdownreader OFF)
set(FEATURE_textmarkdownwriter OFF)
set(FEATURE_textodfwriter OFF)
set(FEATURE_linuxfb OFF)
set(FEATURE_wayland OFF)
set(FEATURE_vnc OFF)
set(FEATURE_libinput OFF)
set(FEATURE_evdev OFF)
set(FEATURE_tslib OFF)
set(FEATURE_kms OFF)
set(FEATURE_integrityhid OFF)

include(FetchContent)
FetchContent_Declare(qt-meta
  GIT_REPOSITORY "https://code.qt.io/qt/qt5.git"
  GIT_TAG "v6.8.3"
  GIT_SHALLOW TRUE
  GIT_SUBMODULES ${QT_MODULES}
  GIT_PROGRESS TRUE
)
FetchContent_MakeAvailable(qt-meta)
