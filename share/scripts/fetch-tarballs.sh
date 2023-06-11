#!/bin/bash

package=core
su -c "cd /share/sources/$package; make distclean && ./autogen.sh --with-all-tarballs && make fetch" -s /bin/bash user
