#!/bin/bash
. .env

docker run -it \
    --name ${image_name} \
    --rm \
    --volume ./share:/home/user/lo:rw \
    ${image_name}:${tag} \
    /bin/bash