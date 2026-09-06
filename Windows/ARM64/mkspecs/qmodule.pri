host_build {
    QT_CPU_FEATURES.x86_64 = 
} else {
    QT_CPU_FEATURES.arm64 = neon
}
QT.global_private.enabled_features = gc_binaries neon localtime_s alloca_malloc_h alloca dbus gui widgets cross_compile largefile precompile_header neon
QT.global_private.disabled_features = use_bfd_linker use_gold_linker use_lld_linker use_mold_linker android-style-assets developer-build private_tests debug elf_private_full_version reduce_exports no_direct_extern_access x86intrin sse2 sse3 ssse3 sse4_1 sse4_2 avx f16c avx2 avx512f avx512er avx512cd avx512pf avx512dq avx512bw avx512vl avx512ifma avx512vbmi avx512vbmi2 aesni vaes rdrnd rdseed shani mips_dsp mips_dspr2 arm_crc32 arm_crypto localtime_r posix_fallocate alloca_h system-zlib stdlib-libcpp dbus-linked network printsupport sql testlib xml libudev openssl dlopen relocatable intelcet glibc_fortify_source trivial_auto_var_init_pattern stack_protector stack_clash_protection libstdcpp_assertions libcpp_hardening relro_now_linker
CONFIG += cross_compile largefile precompile_header neon
QT_COORD_TYPE = double
QT_BUILD_PARTS = libs

