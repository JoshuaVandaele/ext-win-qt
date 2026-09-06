host_build {
    QT_ARCH = x86_64
    QT_BUILDABI = x86_64-little_endian-lp64
    QT_TARGET_ARCH = arm64
    QT_TARGET_BUILDABI = arm64-little_endian-lp64
} else {
    QT_ARCH = arm64
    QT_BUILDABI = arm64-little_endian-lp64
    QT_LIBCPP_ABI_TAG = 
}
QT.global.enabled_features = version_tagging static cross_compile signaling_nan thread future dbus static cross_compile static
QT.global.disabled_features = shared pkg-config debug_and_release separate_debug_info appstore-compliant simulator_and_device rpath force_asserts framework c++20 c++2a c++2b reduce_relocations wasm-simd128 wasm-exceptions zstd concurrent openssl-linked opensslv11 opensslv30
QT.global.disabled_features += release build_all
QT_CONFIG += static no-pkg-config release
CONFIG += release  static cross_compile plugin_manifest
QT_VERSION = 6.8.3
QT_MAJOR_VERSION = 6
QT_MINOR_VERSION = 8
QT_PATCH_VERSION = 3

QT_MSVC_MAJOR_VERSION = 19
QT_MSVC_MINOR_VERSION = 51
QT_MSVC_PATCH_VERSION = 36256
