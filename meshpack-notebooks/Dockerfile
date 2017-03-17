# Builds a Docker image for mesh generation with Jupyter Notebook.
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/meshpack-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM numgeom/fenics-notebook
MAINTAINER Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

# Install python3 and update pip
USER root

# Install pygmsh and meshpy
RUN pip3 install -U \
         pygmsh \
         meshpy

# Install libcgal-dev and frentos
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y libcgal-dev libeigen3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install -U frentos

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

USER numgeom

# Print something nice on entry.
ENV NUMGEOM_HOME /home/numgeom
COPY WELCOME $NUMGEOM_HOME/WELCOME

USER root
