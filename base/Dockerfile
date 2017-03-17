# Builds a base Docker image for NumGeom. In this image, we create 
# the user numgeom, set up the users environment and the default 
# entry point and cmds.
#
# This image can be found at:
#
#   https://hub.docker.com/repository/numgeom/base
#
# Authors:
# Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

# Based on https://bitbucket.org/fenics-project/docker/

FROM phusion/baseimage:latest
MAINTAINER Xiangmin Jiao <xiangmin.jiao@stonybrook.edu>

# Get Ubuntu updates
USER root
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get -y install \
            locales \
            sudo && \
    echo "C.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set locale environment
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8

COPY set-home-permissions.sh /etc/my_init.d/set-home-permissions.sh

# Set up user so that we do not run as root
# See https://github.com/phusion/baseimage-docker/issues/186
# Disable forward logging
# Add script to set up permissions of home directory on myinit
# Run ldconfig so that /usr/local/lib is in the default search
# path for the dynamic linker.
RUN useradd -m -s /bin/bash -G sudo,docker_env numgeom && \
    echo "numgeom:docker" | chpasswd && \
    echo "numgeom ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    touch /etc/service/syslog-forwarder/down && \
    echo "cat /home/numgeom/WELCOME" >> /home/numgeom/.bashrc && \
    chmod +x /etc/my_init.d/set-home-permissions.sh && \
    ldconfig

USER numgeom
ENV NUMGEOM_HOME /home/numgeom
RUN touch $NUMGEOM_HOME/.sudo_as_admin_successful && \
    mkdir $NUMGEOM_HOME/shared
VOLUME /home/numgeom/shared

# Print something nice on entry.
COPY WELCOME $NUMGEOM_HOME/WELCOME

WORKDIR /home/numgeom
USER root
ENTRYPOINT ["/sbin/my_init","--quiet","--","/sbin/setuser","numgeom","/bin/bash","-l","-c"]
CMD ["/bin/bash","-i"]