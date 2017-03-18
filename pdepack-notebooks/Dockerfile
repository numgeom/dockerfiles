# Builds a Docker image for mesh generation with Jupyter Notebook.
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/meshpack-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM numgeom/fenics-stable
MAINTAINER Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

USER root

# Install latex_envs for Jupyter Notebook
RUN pip install -U jupyter_latex_envs && \
    jupyter nbextension install --py latex_envs && \
    jupyter nbextension enable --py latex_envs

# Install spell checker for Jupyter Notebook
RUN jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-document-tools-1.0.zip && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-cell-tools-1.0.zip && \
    jupyter nbextension enable calico-spell-check

# Install pygmsh and meshpy
RUN pip install -U \
         pygmsh \
         meshpy

# Install libcgal-dev and frentos
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y libcgal-dev libeigen3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -U frentos

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

USER numgeom

# Print something nice on entry.
ENV NUMGEOM_HOME /home/numgeom
COPY WELCOME $NUMGEOM_HOME/WELCOME

USER root
