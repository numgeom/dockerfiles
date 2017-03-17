# Builds a Docker image for Jupyter Notebook with Octave. It also
# installs some additional packages, including symbolic.
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/octave-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM numgeom/jupyter-notebook
MAINTAINER Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

# Install octave
USER root
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y octave octave-symbolic gnuplot && \
    rm -rf /var/lib/apt/lists/*

# Install latex_envs for Jupyter Notebook
RUN pip3 install -U octave_kernel && \
    python3 -m octave_kernel.install

# Clean Up
RUN rm -rf /tmp/* /var/tmp/*

# Print something nice on entry.
ENV NUMGEOM_HOME /home/numgeom
COPY WELCOME $NUMGEOM_HOME/WELCOME
