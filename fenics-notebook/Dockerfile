# Builds a Docker image for FEniCS with Python 3 and Jupyter Notebook.
#
# It can be found at:
#   https://hub.docker.com/r/numgeom/fenics-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM quay.io/fenics/stable:latest
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Change the default timezone to America/New_York
# Install jupyter and ipywidgets
# Install jupyter_latex_envs version 1.3.7.2 for Jupyter Notebook
# Install spell checker for Jupyter Notebook
RUN echo "America/New_York" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    pip3 install -U \
         jupyter \
         ipywidgets && \
    jupyter nbextension install --py --system \
            widgetsnbextension && \
    jupyter nbextension enable --py --system \
            widgetsnbextension && \
    pip3 install -U \
         jupyter_latex_envs==1.3.7.2 && \
    jupyter nbextension install --py --system \
            latex_envs && \
    jupyter nbextension enable --py --system \
            latex_envs && \
    jupyter nbextension install --system \
            https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip && \
    jupyter nbextension install --system \
            https://bitbucket.org/ipre/calico/downloads/calico-document-tools-1.0.zip && \
    jupyter nbextension install --system \
            https://bitbucket.org/ipre/calico/downloads/calico-cell-tools-1.0.zip && \
    jupyter nbextension enable --system \
            calico-spell-check && \
    rm -rf /tmp/* /var/tmp/*

WORKDIR $DOCKER_HOME
