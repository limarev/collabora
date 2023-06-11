#!/bin/bash
. .env

docker build \
    --no-cache \
    --rm \
    -t ${image_name} \
    .