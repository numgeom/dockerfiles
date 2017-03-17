# Builds a Docker image for FEniCS with Python 3 and Jupyter Notebook. 
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/fenics-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM numgeom/fenics-stable
MAINTAINER Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

USER root 

# Install python3 and update pip
USER root

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

USER root
