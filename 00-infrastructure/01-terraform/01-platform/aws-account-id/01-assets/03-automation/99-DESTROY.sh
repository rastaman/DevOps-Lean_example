#!/bin/bash


./0-REMOTE-CONFIGURE.sh
source ./GLOBAL_VARIABLES.sh
${TERRAFORM} get


${TERRAFORM} destroy -force \
      -var-file="./environment.tfvars"

