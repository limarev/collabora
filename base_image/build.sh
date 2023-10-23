#!/bin/bash
. .env

docker build \
    --rm \
    -t ${image_name} \
    .