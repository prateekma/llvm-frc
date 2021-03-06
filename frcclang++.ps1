$basedir = Get-Location
$target="arm-frc2020-linux-gnueabi"
$compiler_root="$basedir/frc2020/roborio"
$sysroot="$compiler_root/$target"
$libcxx_root="$basedir/libcxx"

clang++ `
 -std=c++2a `
 -fuse-ld=lld `
 -target $target `
 -mcpu=cortex-a9 `
 -mfpu=vfpv3 `
 -mfloat-abi=softfp `
 -stdlib=libc++ `
 "-I$libcxx_root/include" `
 --sysroot=$sysroot `
 -cxx-isystem "$libcxx_root/include/c++/v1" `
 -gcc-toolchain $sysroot `
 -B "$sysroot/usr/lib/$target/7.3.0" `
 "-L$libcxx_root/lib" `
 "-L$sysroot/usr/lib/$target/7.3.0" `
 "-Wl,-lstdc++" `
 $args
