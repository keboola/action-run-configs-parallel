#!/bin/sh -l
set -e

if [ $# -lt 4 ]
then
  echo "Some parameters are missing"
  exit 1
fi

HOST=$1
TOKEN=$2
COMPONENT=$3
TAG=$4
TIMEOUT=$5
for id in $6
do
  JOBS="${JOBS} $COMPONENT/$id@$TAG"
done

if [ -z "$JOBS" ]; then
  echo "No config specified."
else
  kbc remote job run --storage-api-host "$HOST" --storage-api-token "$TOKEN" --timeout "$TIMEOUT" $JOBS
fi
