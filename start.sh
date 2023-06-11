#!/bin/bash
. .env

docker run -it \
    --name ${image_name} \
    --rm \
    --volume ./share:/share:rw \
    ${image_name} \
    /bin/bash