#!/bin/bash

source ./GLOBAL_VARIABLES.sh

echo "########################################################"
echo "Bucket Location:					${STATEFILE_BUCKET}"
echo "########################################################"
echo "Terraform state file location:	${STATE_FILE_LOCATION}"
echo "########################################################"
echo "AWS region deployed:				${AWS_REGION}"
echo "########################################################"
echo "AWS profile used:					${ACCOUNT_PROFILE}"
echo "########################################################"

${TERRAFORM} remote config \
            -backend=s3 \
            -backend-config="bucket=${STATEFILE_BUCKET}" \
            -backend-config="key=${STATE_FILE_LOCATION}" \
            -backend-config="region=${AWS_REGION}" \

