#!/bin/bash


./0-REMOTE-CONFIGURE.sh
source ./GLOBAL_VARIABLES.sh
${TERRAFORM} get


${TERRAFORM} plan \
     -var-file="./environment.tfvars"