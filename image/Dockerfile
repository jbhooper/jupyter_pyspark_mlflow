FROM quay.io/jupyter/pyspark-notebook

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.
SHELL ["/bin/bash","-o","pipefail","-c"]
USER root
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends supervisor vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisord.conf
COPY --chmod=755 start_mlflow.sh /usr/local/bin/
#RUN chmod 755 /usr/local/bin/start_mlflow.sh

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.
USER ${NB_UID}

# Install mlflow and dependencies
RUN pip install mlflow
#RUN mamba install --yes 'mlflow' && \
#    mamba clean --all -f -y && \
#    fix-permissions "${CONDA_DIR}" && \
#    fix-permissions "/home/${NB_USER}"

ENV BACKEND_URI ${HOME}/mlflow
RUN mkdir -p ${BACKEND_URI}

ENV ARTIFACT_ROOT ${HOME}/mlflow/artifacts
RUN mkdir -p ${ARTIFACT_ROOT}

ENV MLFLOW_PORT 5000
EXPOSE $MLFLOW_PORT

CMD ["/usr/bin/supervisord"]