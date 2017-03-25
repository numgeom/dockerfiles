# Builds a Docker image for PDE solving with a Desktop environment
# and Jupyter Notebook.
#
# It can be found at:
#   https://hub.docker.com/r/numgeom/pdepack-desktop
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

FROM numgeom/fenics-notebook
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root

# Install FreeCAD, Gmsh, and python-vtk
RUN add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y --no-install-recommends \
        freecad \
        gmsh \
    rm -rf /var/lib/apt/lists/*

# Install pygmsh and meshpy
RUN pip3 install -U \
         lxml \
         pygmsh \
         meshpy

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

USER $NGUSER

# Print something nice on entry.
COPY WELCOME $NGHOME/WELCOME

USER root
