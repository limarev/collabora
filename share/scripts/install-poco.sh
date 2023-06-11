#!/bin/bash
. .env


package=poco

for p in $platforms; do
    echo "Building $p:"
    mkdir -p $build_path/$package/$p
    mkdir -p $install_dir/$package/$p
    cd $source_dir/$package && git restore .
    [ -f /share/scripts/$p.patch ] && cd $source_dir/$package && git apply /share/scripts/$p.patch
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=$ndk_path/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI=$p \
        -DCMAKE_ANDROID_ARCH_ABI=$p \
        -DANDROID_NDK=$ndk_path \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SYSTEM_NAME=Android \
        -DCMAKE_SYSTEM_VERSION=21 \
        -DANDROID_PLATFORM=21 \
        -DCMAKE_INSTALL_PREFIX=$install_dir/$package/$p \
        -DENABLE_CRYPTO=OFF \
        -DENABLE_NETSSL=OFF \
        -DENABLE_ZIP=OFF \
        -DENABLE_DATA=OFF \
        -DENABLE_DATA_SQLITE=OFF \
        -DENABLE_DATA_ODBC=OFF \
        -DENABLE_DATA_MYSQL=OFF \
        -DENABLE_MONGODB=OFF \
        -DENABLE_PDF=OFF \
        -DENABLE_CPPPARSER=OFF \
        -DENABLE_PAGECOMPILER=OFF \
        -DENABLE_JWT=OFF \
        -DFORCE_OPENSSL=OFF \
        -S $source_dir/$package \
        -B $build_path/$package/$p || exit 1;

    cmake --build $build_path/$package/$p --target install
done 
