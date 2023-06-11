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