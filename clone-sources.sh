#!/bin/bash

lo_branch=distro/collabora/co-22.05
poco_branch=poco-1.10.1

sources=./share/sources
if [ ! -d ${sources} ]; then
    mkdir -p ${sources}
fi

cd ${sources}

repo_name=core
if [ ! -f ${sources}/${repo_name}/.git/config ];  then
    git clone --branch ${lo_branch} --recurse-submodules -j8 https://github.com/LibreOffice/core.git ${repo_name}
fi

repo_name=poco
if [ ! -f ${sources}/${repo_name}/.git/config ];  then
    git clone --branch ${poco_branch} -j8 https://github.com/pocoproject/poco.git ${repo_name}
fi

repo_name=zstd
if [ ! -f ${sources}/${repo_name}/.git/config ];  then
    git clone -j8 https://android.googlesource.com/platform/external/zstd/ ${repo_name}
fi

repo_name=collabora
if [ ! -f ${sources}/${repo_name}/.git/config ];  then
    git clone -j8 https://github.com/CollaboraOnline/online.git ${repo_name}
fi
