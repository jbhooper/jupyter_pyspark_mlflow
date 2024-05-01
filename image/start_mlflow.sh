#!/bin/bash
if [ -z ${BACKEND_URI+x} ]
  then :
  else BACKEND_FLAG="--backend-store-uri ${BACKEND_URI} "
if [ -z ${ARTIFACT_ROOT+x} ]
  then :
  else ARTIFACT_FLAG="--default-artifact-root ${ARTIFACT_ROOT} "
if [ -z ${MLFLOW_PORT+x} ]
  then :
  else PORT_FLAG="-port ${MLFLOW_PORT}"

mlflow server ${BACKEND_FLAG} ${ARTIFACT_ROOT} -host 0.0.0.0 ${PORT_FLAG}