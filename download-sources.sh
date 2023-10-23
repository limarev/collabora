#!/bin/bash

. .env_tars

if [ ! -d ${sources} ]; then
    mkdir -p ${sources}
fi

if [ ! -d ${archives} ]; then
    mkdir -p ${archives}
fi

cd ${archives}

repo_name=core
if [ ! -f ${archives}/${repo_name}-${lo_tag}.tar.gz ];  then
    wget -O ${repo_name}-${lo_tag}.tar.gz https://github.com/LibreOffice/core/archive/refs/tags/${lo_tag}.tar.gz
fi

repo_name=core-main
# lo_branch=distro/collabora/co-23.05
lo_branch=master
if [ ! -f ${sources}/${repo_name}/.git/config ];  then
    git clone --branch ${lo_branch} --recurse-submodules --depth 1 -j8 https://github.com/LibreOffice/core.git ${repo_name}
    mv ${repo_name} ${sources}
fi

repo_name=poco
poco_version=1.12.4
if [ ! -f ${archives}/${repo_name}.tar.gz ];  then
    wget -O ${repo_name}.tar.gz https://github.com/pocoproject/poco/archive/refs/tags/poco-${poco_version}-release.tar.gz
fi

repo_name=zstd
if [ ! -f ${archives}/${repo_name}.tar.gz ];  then
    wget -O ${repo_name}.tar.gz https://android.googlesource.com/platform/external/zstd/+archive/refs/heads/main.tar.gz
fi

repo_name=collabora
if [ ! -f ${archives}/${repo_name}-${co_tag}.tar.gz ];  then
    wget -O ${repo_name}-${co_tag}.tar.gz https://github.com/CollaboraOnline/online/archive/refs/tags/${co_tag}.tar.gz
fi
