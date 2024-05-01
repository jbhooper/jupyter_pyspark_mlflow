#!/bin/bash
if [ -z ${BACKEND_URI+x} ]
  then :
  else BACKEND_FLAG="--backend-store-uri ${BACKEND_URI} "
fi
if [ -z ${ARTIFACT_ROOT+x} ]
  then :
  else ARTIFACT_FLAG="--default-artifact-root ${ARTIFACT_ROOT} "
fi
if [ -z ${MLFLOW_PORT+x} ]
  then :
  else PORT_FLAG="-port ${MLFLOW_PORT}"
fi

/opt/conda/bin/mlflow server ${BACKEND_FLAG} ${ARTIFACT_ROOT} -host 0.0.0.0 ${PORT_FLAG}
