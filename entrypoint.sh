#!/bin/sh -l
set -e

if [ $# -lt 3 ]
then
  echo "Some parameters are missing"
  exit 1
fi
export KBC_STORAGE_TOKEN=$1
export COMPONENT_ID=$2
export TAG=$3
CONFIGS=$4

docker pull -q quay.io/keboola/syrup-cli:latest
TASK='
  echo "Running config {} with tag $TAG ..." &&
  docker run --rm -e KBC_STORAGE_TOKEN quay.io/keboola/syrup-cli:latest run-job $COMPONENT_ID {} $TAG &&
  echo "Config {} OK"
'
parallel --env COMPONENT_ID --env TAG --lb -j 0 --halt now,fail=1 "$TASK" ::: $CONFIGS
echo "OK"
