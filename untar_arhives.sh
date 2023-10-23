#!/bin/bash

. .env_tars

cd ${archives}

for file in *.tar.gz; do
    package=$(basename "$file" .tar.gz)
    package_dir=${sources}/${package}
    if [ ! -d ${package_dir} ]; then
        mkdir -p ${package_dir}

        if [ "${package}" = "zstd" ]; then
            tar xvf $file -C ${package_dir}; else
            tar xvf $file -C ${package_dir} --strip-components=1;
        fi
    fi

done