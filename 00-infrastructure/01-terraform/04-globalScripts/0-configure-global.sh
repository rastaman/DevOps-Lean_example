
#!/bin/bash

# This was originally contriputed by Bill McMath. Link, direct references to be added later when he open sources his original stuff.
# Heavily modified from the original to match use case


##########################################################
# Defaults Values 
##########################################################

REGION=${REGION:-eu-west-1}
PROFILE=${PROFILE:-aws-account-id}
BUCKET=${BUCKET:-aws-kub}
ENV=${ENV:-02-main}


source "$(dirname $0)/execution-order.sh"

function usage() {
    echo "usage: $0 [-r REGION] [-p AWS_PROFILE] [-b S3_BUCKET] [-e ENVIRONMENT] section"
    echo "       section must be one of:"
    echo "           BASE"
    echo "           DEV"
    echo "           TEST"
    echo "           PERF"
    echo "           PROD"
}

while getopts "hr:p:b:e:" OPTION; do
    case "${OPTION}" in
        r)
            REGION="${OPTARG}"
            ;;
        p)
            PROFILE="${OPTARG}"
            ;;
        b)
            BUCKET="${OPTARG}"
            ;;
        e)
            ENV="${OPTARG}"
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

if [ "$#" -ne 1 ]; then
    usage
    exit 1
elif [ "${1}" == "TEST" ] || [ "${1}" == "DEV" ] || [ "${1}" == "PERF" ] || [ "${1}" == "PROD" ] ; then
    SECTION="${1}"
    EXECUTION_PARTS=$(echo -e "${BASE}\n${!SECTION}")
elif [ "${1}" == "BASE" ] ; then
    SECTION="${1}"
    EXECUTION_PARTS=$(echo -e "${!SECTION}")
else
    usage
    exit 1
fi

OLD_PWD=$(pwd)



for part in ${EXECUTION_PARTS}; do

    echo "\n****************************************"
    echo "${BASE_DIR}/../01-platform/${PROFILE}/${ENV}/${part}"
    cd "${BASE_DIR}/../01-platform/${PROFILE}/${ENV}/${part}"

    bash 0-REMOTE-CONFIGURE.sh
    
    cd ${OLD_PWD}

done
