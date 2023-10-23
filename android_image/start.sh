#!/bin/bash
. .env

docker run -it \
    --name ${image_name} \
    --rm \
    ${image_name}:${tag} \
    /bin/bash