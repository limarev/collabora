# collabora
build collabora from sources. All targets built will be located at ./share/install directory.

## clone libreoffice core + POCO + collabora + libzstd
```
./clone-sources.sh
```
All sources cloned will be located at ./share/sources directory.

## build image or pull from docker hub
```
./build.sh
```
or:
```
docker pull klimarev/collabora_android_env
```
and you should change start.sh file as follows:
```
docker run -it \
    --name ${image_name} \
    --rm \
    --volume ./share:/share:rw \
    klimarev/${image_name} \
    /bin/bash
```

## start container
```
./start.sh
```

## install POCO + libzstd
```
./install-poco.sh && ./install-zstd.sh
```

## fetch tarballs and install libreoffice
```
./fetch-tarballs.sh && ./install-libreoffice.sh
```

## core-cp-23.05.5-2
./fetch_tarballs.sh: /bin/sh: 1: .: cannot open /home/user/lo/sources/core-cp-23.05.5-2/sources.ver: No such file
Makefile:258: *** Error while retrieving $lo_sources_ver from /home/user/lo/sources/core-cp-23.05.5-2/sources.ver.  Stop.

fix:
```
touch sources.ver
echo "lo_sources_ver=7.5" > sources.ver
```