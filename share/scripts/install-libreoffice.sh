#!/bin/bash
. .env


package=core
distro=CPAndroid
arch=armeabi-v7a


cd $source_dir/$package

mkdir -p $install_dir/$package/$arch

echo \
"--prefix=$install_dir/$package/$arch
--disable-fetch-external
--with-external-tar=$source_dir/$package/external/tarballs
--disable-ccache
--with-android-ndk=$ndk_path
--with-android-sdk=$android_sdk_path
--with-distro=$distro" > autogen.input

su -c "make distclean; ./autogen.sh && make && make install" -s /bin/bash user
