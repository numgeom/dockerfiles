# Builds a Docker image for mesh generation with Jupyter Notebook.
#
# It can be found at:
#   https://quay.io/repository/numgeom/meshpack-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM quay.io/numgeom/fenics-notebook
LABEL maintainer "Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>"

USER root

# Install gmsh and python-vtk
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y gmsh python-vtk && \
    rm -rf /var/lib/apt/lists/*

# Install pygmsh and meshpy
RUN pip2 install -U \
         lxml \
         pygmsh \
         meshpy

# Install libcgal-dev and frentos
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y libcgal-dev libeigen3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip2 install -U frentos

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

USER $NGUSER

# Print something nice on entry.
COPY WELCOME $NGHOME/WELCOME

USER root
