#!/bin/bash

set -o nounset
set -o errexit
# trace each command execute, same as `bash -v myscripts.sh`
#set -o verbose
# trace each command execute with attachment infomations, same as `bash -x myscripts.sh`
#set -o xtrace

#set -o
set -e
#set -x

source .env

timestamp()
{
    TIMESTAMP="$(date +%Y%m%d-%H%M%S)" 
    echo ${TIMESTAMP}
}
TIME=$(timestamp)

BACKUP_PATH=backups
mkdir -p ${BACKUP_PATH}

DATA_BACKUP_NAME="${EMBY_DATAS_ROOT_DIR}_${TIME}"

sudo mv ${EMBY_DATAS_ROOT_DIR} ${BACKUP_PATH}/${DATA_BACKUP_NAME}
mkdir ${EMBY_DATAS_ROOT_DIR}
mkdir -p ${EMBY_DATAS_ROOT_DIR}/${EMBY_DATAS_CONTAINER_DIR}
mkdir -p ${EMBY_DATAS_ROOT_DIR}/${EMBY_DATAS_MEDIAS_DIR}

CERTS_BACKUP_NAME="${CERTIFICATES_DIR}_${TIME}"

mv ${CERTIFICATES_DIR} ${BACKUP_PATH}/${CERTS_BACKUP_NAME}
mkdir ${CERTIFICATES_DIR}

