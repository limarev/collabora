#!/bin/bash

. .env

package=core-co-23.05
# package=core-cp-23.05.5-2
# package=core-main
cd ${source_dir}/$package

make distclean

# if [[ -f ${archive_dir}/external.tar.gz && ! -d external ]];  then
#     mkdir external
#     tar xvf ${archive_dir}/external.tar.gz -C external --strip-components=1; 
# fi

./autogen.sh --with-all-tarballs && make fetch
