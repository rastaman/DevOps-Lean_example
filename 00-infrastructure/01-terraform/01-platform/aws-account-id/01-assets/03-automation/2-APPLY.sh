#!/bin/bash


./0-REMOTE-CONFIGURE.sh
source ./GLOBAL_VARIABLES.sh
${TERRAFORM} get

${TERRAFORM} apply \
    -var-file="./environment.tfvars"

