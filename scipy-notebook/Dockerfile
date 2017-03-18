# Builds a Docker image for Jupyter Notebook with Python 3 and SciPy. 
# It also installs addiional packages, including sympy, pandsa, etc.
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/scipy-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM numgeom/jupyter-notebook
LABEL maintainer "Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>"

# Install scipy
USER root
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y python3-scipy python3-sympy python3-pandas && \
    rm -rf /var/lib/apt/lists/*

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

USER $NGUSER

# Print something nice on entry.
COPY WELCOME $NGHOME/WELCOME

USER root
