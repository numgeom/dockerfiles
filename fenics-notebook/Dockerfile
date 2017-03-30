# Builds a Docker image for FEniCS with Python 3 and Jupyter Notebook.
#
# It can be found at:
#   https://hub.docker.com/r/numgeom/fenics-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM quay.io/fenics/stable:py3
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Install jupyter and ipywidgets
# Install jupyter_latex_envs version 1.3.7.2 for Jupyter Notebook
# Install spell checker for Jupyter Notebook
RUN pip3 install -U \
         jupyter \
         ipywidgets && \
    jupyter nbextension install --py --system \
            widgetsnbextension && \
    jupyter nbextension enable --py --system \
            widgetsnbextension && \
    pip3 install -U \
         https://github.com/jfbercher/jupyter_latex_envs/archive/master.zip && \
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

ENV DOCKER_USER=numgeom
ENV DOCKER_GROUP=$DOCKER_USER \
    DOCKER_HOME=/home/$DOCKER_USER \
    HOME=/home/$DOCKER_USER

# Change the default timezone to America/New_York
# Set up user so that we do not run as root
# See https://github.com/phusion/baseimage-docker/issues/186
# Disable forward logging
# Add script to set up permissions of home directory on myinit
# Run ldconfig so that /usr/local/lib is in the default search
# path for the dynamic linker.
RUN echo "America/New_York" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    useradd -m -s /bin/bash -G sudo,docker_env $DOCKER_USER && \
    echo "$DOCKER_USER:docker" | chpasswd && \
    echo "$DOCKER_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    ldconfig && \
    touch $DOCKER_HOME/.sudo_as_admin_successful && \
    mkdir $DOCKER_HOME/shared && \
    chown -R $DOCKER_USER:$DOCKER_GROUP $DOCKER_HOME

VOLUME $DOCKER_HOME/shared
WORKDIR $DOCKER_HOME

USER root
ENTRYPOINT ["/sbin/my_init","--quiet","--","/sbin/setuser","numgeom","/bin/bash","-l","-c"]
CMD ["/bin/bash","-l","-i"]
