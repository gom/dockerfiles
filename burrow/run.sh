#!/bin/sh
docker run -d \
        -p 8000:8000 \
        -v .:/etc/burrow \
        gom68/burrow
