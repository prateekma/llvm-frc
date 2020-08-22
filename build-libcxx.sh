#!/bin/sh

target=arm-frc2020-linux-gnueabi
compiler_root=`pwd`/frc2020/roborio
sysroot=$compiler_root/$target
install_dir=`pwd`/libcxx

rm -rf build-libcxx $install_dir
mkdir build-libcxx $install_dir
cd build-libcxx
CC=clang CXX=clang++ cmake \
    -DCMAKE_INSTALL_PREFIX="$install_dir" \
    -DCMAKE_SYSTEM_PROCESSOR=arm \
    -DCMAKE_SYSTEM_NAME=Linux \
    -DCMAKE_CROSSCOMPILING=True \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_LIBRARY_PATH="$sysroot/usr/lib/" \
    -DCMAKE_CXX_FLAGS="-std=c++2a -target $target -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=softfp --sysroot=$sysroot -gcc-toolchain $sysroot -B $compiler_root/bin -B $sysroot/usr/lib/$target/7.3.0" \
    -DCMAKE_EXE_LINKER_FLAGS="-L$sysroot/usr/lib/$target/7.3.0 -L/Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/usr/lib" \
    -DCMAKE_SHARED_LINKER_FLAGS="-L$sysroot/usr/lib/$target/7.3.0 -L/Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.0.sdk/usr/lib" \
    -DLLVM_PATH=../llvm-project/llvm \
    -DLIBCXX_CXX_ABI=libstdc++ \
    -DLIBCXX_CXX_ABI_INCLUDE_PATHS="$sysroot/usr/include/c++/7.3.0;$sysroot/usr/include/c++/7.3.0/$target" \
    -DLIBCXX_CXX_ABI_LIBRARY_PATH="$sysroot/usr/lib/libstdc++.so" \
    -GNinja \
    ../llvm-project/libcxx
ninja && ninja install
cp $sysroot/usr/include/c++/7.3.0/bits/cxxabi_init_exception.h $install_dir/include/c++/v1/bits/
rm $install_dir/lib/libc++.so.1
cp $install_dir/lib/libc++.so.1.0 $install_dir/lib/libc++.so.1
