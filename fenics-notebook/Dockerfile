# Builds a Docker image for FEniCS with Python 3 and Jupyter Notebook,
# with LaTeX environment and spell checker.
#
# It can be found at:
#   https://hub.docker.com/repository/numgeom/fenisc-notebook
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

FROM fenics/stable:latest
LABEL maintainer "Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>"

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
USER fenics
ENV FENICS_HOME /home/fenics
COPY WELCOME $FENICS_HOME/WELCOME

# Set up User numgeom
USER root

# Environment variables
ENV NGUSER=numgeom
ENV NGHOME=/home/$NGUSER
ENV FENICS_HOME=$NGHOME

COPY set-home-permissions.sh /etc/my_init.d/set-home-permissions.sh

# Set up a new user so that we do not run as root
RUN useradd -m -s /bin/bash -G sudo,docker_env $NGUSER && \
    echo "$NGUSER:docker" | chpasswd && \
    echo "$NGUSER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "cat $NGHOME/WELCOME" >> /$NGHOME/.bashrc && \
    chmod +x /etc/my_init.d/set-home-permissions.sh && \
    ldconfig

# Our helper scripts
USER $NGUSER

RUN touch $NGHOME/.sudo_as_admin_successful && \
    mkdir $NGHOME/shared
VOLUME $NGHOME/shared

COPY WELCOME $NGHOME/WELCOME

WORKDIR $NGHOME
USER root
ENTRYPOINT ["/sbin/my_init","--quiet","--","/sbin/setuser","numgeom","/bin/bash","-l","-c"]
CMD ["/bin/bash","-i"]
