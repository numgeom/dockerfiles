# Builds a Docker image for Jupyter Notebook with python3 for NumGeom,
# with LaTeX environment and spell checker enabled.
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/jupyter-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM numgeom/base
MAINTAINER Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

# Install python3 and update pip
USER root
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get -y install \
            python3 \
            python3-pip && \
    pip3 install -U pip && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install latex_envs for Jupyter Notebook
RUN pip3 install -U jupyter_latex_envs && \
    jupyter nbextension install --py latex_envs && \
    jupyter nbextension enable --py latex_envs

# Install spell checker for Jupyter Notebook
RUN jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-document-tools-1.0.zip && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-cell-tools-1.0.zip && \
    jupyter nbextension enable calico-spell-check

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

# Print something nice on entry.
ENV NUMGEOM_HOME /home/numgeom
COPY WELCOME $NUMGEOM_HOME/WELCOME
