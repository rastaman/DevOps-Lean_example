#!/bin/bash

# This was originally contriputed by Bill McMath. Link, direct references to be added later when he open sources his original stuff.
# Heavily modified from the original to match use case

BASE=$(cat <<'EOL'
    01-common/01-eip
    01-common/02-main_network
EOL
)

BASE_DIR="$(pwd)$(dirname $0)"
BASE_DIR=$(echo ${BASE_DIR} | sed 's/\.//')
BASE_DIR=$(echo ${BASE_DIR} | sed 's/scripts$//')
BASE_DIR=$(echo ${BASE_DIR} | sed 's/\/$//')