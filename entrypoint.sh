#!/bin/bash

set -x

function build {
    echo \
    "--with-android-package-name=com.collabora.for.gerrit
    --with-external-tar=/home/user/build/external/tarballs
    --disable-fetch-external
    --with-android-ndk=${NDK_PATH}
    --with-android-sdk=${ANDROID_SDK_PATH}
    --with-distro=$1
    --disable-ccache" > autogen.input
    make distclean
    ./autogen.sh && make
}

cd /home/user/build

case $1 in
    "fetch")
        make distclean
        ./autogen.sh --with-all-tarballs && make fetch
        ;;
    "CPAndroid")
        build "CPAndroid"
        ;;
    "CPAndroidAarch64")
        build "CPAndroidAarch64"
        ;;
    "CPAndroidX86")
        build "CPAndroidX86"
        ;;
    "CPAndroidX86_64")
        build "CPAndroidX86_64"
        ;;
    *)
        echo "Available options: fetch CPAndroid CPAndroidAarch64 CPAndroidX86 CPAndroidX86_64"
esac
