#!/bin/bash

### Terraform configuration ###
TF_VERSION=0.8.5

### AWS configuration ###
AWS_REGION=eu-west-1
ACCOUNT_PROFILE=aws-account-id
VPC_ENV=02-main
AWS_DOMAIN_SUFFIX=main.vpc.internal
### AWS remote state file ###
STATEFILE_BUCKET=aws-kubernetes
STORAGE_PROFILE=S3Storage

### use correct terraform binary based on automation ###
### used for mac/jenkins automation ###

OSTYPE=`uname | tr [:upper:] [:lower:]`
ARCHITECTURE=`uname -m`
TERRAFORM_BIN=terraform-${TF_VERSION}.${OSTYPE}.${ARCHITECTURE}

# =================================================================================================================
#####   discover all the layers the terraform componant is located in                                         #####
# Terraform creates a statefile based ont the folder structure of the terraform files are located in.
# Folder structure is as follows and the folder names can be changed to match your naming convention.
# aws-account-id - can be replaced with the account id of the AWS account. for record keeping and aws profile match
# 02-main is the VPC name - set "VPC_ENV" when changing this folder name
# 01-common Folder at this level indicate the enviroment it's setup for.
# =================================================================================================================
CURRENT=`pwd -P`
COMPONENT=`basename $CURRENT`
echo "COMPONENT:  $COMPONENT"

CURRENT_DIR=`dirname $CURRENT`
COM_LOC=`basename $CURRENT_DIR`
echo "COMPONENT LOCATION:  $COM_LOC"

VPC_DIR=`dirname $CURRENT_DIR`
VPC_LOC=`basename $VPC_DIR`
echo "VPC NAME:  $VPC_LOC"


if [ ${VPC_LOC} == ${VPC_ENV} ]; then
   STATE_FILE_LOCATION=${ACCOUNT_PROFILE}/vpc-${VPC_ENV}/${COM_LOC}/${COMPONENT}/terraform.tfstate
   TERRAFORM="../../../../03-bin/${TERRAFORM_BIN}"
   	if [ -a ${TERRAFORM} ]; then
		echo "Binaries exist"
	else
		cd ../../../../03-bin/
		bash bin.sh
		cd $CURRENT
	fi
else
   echo "you made your folder structure too complex and there is no need. stop wasting time and read the notes in GLOBAL_VARIABLES.sh"
fi

echo "TERRAFORM BIN LOCATION:	${TERRAFORM}"
${TERRAFORM} -version
echo 
