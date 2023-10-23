#!/bin/bash
. .env

package=zstd

# -DANDROID_PLATFORM=21 \
for p in $platforms; do
    echo "Building $p:"
    mkdir -p $build_path/$package/$p
    mkdir -p $install_dir/$package/$p
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=$ndk_path/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI=$p \
        -DCMAKE_ANDROID_ARCH_ABI=$p \
        -DANDROID_NDK=$ndk_path \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SYSTEM_NAME=Android \
        -DCMAKE_SYSTEM_VERSION=21 \
        -DZSTD_BUILD_PROGRAMS:BOOL=OFF \
        -DZSTD_BUILD_SHARED:BOOL=OFF \
        -DCMAKE_INSTALL_PREFIX=$install_dir/$package/$p \
        -S $source_dir/zstd/build/cmake \
        -B $build_path/$package/$p || exit 1;

    cmake --build $build_path/$package/$p --target install
done
