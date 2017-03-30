# Builds a Docker image for PDE solving with a Desktop environment
# and Jupyter Notebook and LXDE.
#
# The built image can be found at:
#   https://hub.docker.com/r/numgeom/pdepack-desktop
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

# VNC support is based on https://github.com/x11vnc/docker-ubuntu-x11vnc

FROM numgeom/fenics-notebook
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Install some required system tools and packages for X Windows
# We install firefox and make --no-remote to be default
# Install FreeCAD, Gmsh, and python-vtk


RUN add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y --no-install-recommends \
        openssh-server \
        net-tools \
        python-pip \
        python-dev \
        g++ \
        \
        xserver-xorg-video-dummy \
        lxde \
        x11-xserver-utils \
        gnome-themes-standard \
        gtk2-engines-pixbuf \
        gtk2-engines-murrine \
        ttf-ubuntu-font-family \
        xfonts-base xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic \
        mesa-utils \
        libgl1-mesa-dri \
        x11vnc \
        \
        firefox \
	xpdf \
	\
	freecad \
        cxx \
        gmsh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    sed -i 's/MOZ_APP_NAME "\$@"/MOZ_APP_NAME --no-remote "\$@"/' /usr/bin/firefox && \
    pip2 install -U pip \
        setuptools && \
	\
    pip2 install -U https://github.com/novnc/websockify/archive/master.tar.gz && \
    mkdir /usr/local/noVNC && \
    curl -s -L https://github.com/novnc/noVNC/archive/stable/v0.6.tar.gz | \
         tar zx -C /usr/local/noVNC --strip-components 1 && \
    rm -rf /tmp/* /var/tmp/*

########################################################
# Customization for user and location
########################################################

ADD image /
ADD conf/ $DOCKER_HOME/.config

RUN sed -i "s/numgeom/$DOCKER_USER/" $DOCKER_HOME/.config/pcmanfm/LXDE/desktop-items-0.conf && \
    mkdir $DOCKER_HOME/.vnc && \
    mkdir $DOCKER_HOME/.log && \
    chown -R $DOCKER_USER:$DOCKER_GROUP $DOCKER_HOME

WORKDIR $DOCKER_HOME
USER root
ENTRYPOINT ["/sbin/my_init","--quiet","--","/sbin/setuser","numgeom","/bin/bash","-l","-c"]
CMD ["/bin/bash","-i"]
