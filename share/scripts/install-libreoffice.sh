#!/bin/bash
. .env

package=core-co-23.05
# package=core-cp-23.05.5-2
# package=core-main
distro=CPAndroid
arch=armeabi-v7a


cd $source_dir/$package

mkdir -p $install_dir/$package/$arch

# --with-android-ndk=$ndk_path
# --with-android-sdk=$android_sdk_path
# --with-android-package-name=com.collabora.for.gerrit
# --with-distro=$distro"
# --disable-fetch-external
echo \
"--prefix=$install_dir/$package/$arch
--with-android-package-name=com.collabora.for.gerrit
--with-external-tar=$source_dir/$package/external/tarballs
--with-android-ndk=$ndk_path
--with-android-sdk=$android_sdk_path
--with-distro=$distro
--disable-ccache" > autogen.input

# su -c "make distclean; ./autogen.sh && make && make install" -s /bin/bash user

make distclean
./autogen.sh && make && make install
