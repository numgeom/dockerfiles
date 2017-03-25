# Builds a Docker image for PDE solving with a Desktop environment
# and Jupyter Notebook and LXDE.
#
# It can be found at:
#   https://hub.docker.com/r/numgeom/pdepack-desktop
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

# VNC support is based on https://github.com/fcwu/docker-ubuntu-vnc-desktop

FROM numgeom/fenics-notebook
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root

# Install required systems tools
# Install additional Python libraries
# Install FreeCAD, Gmsh, and python-vtk


RUN add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y --no-install-recommends \
        openssh-server \
        supervisor \
        pwgen \
        net-tools \
        nginx \
        python-pip \
        python-dev \
        lxde lxsession-logout \
        gnome-themes-standard \
        gtk2-engines-pixbuf \
        gtk2-engines-murrine \
        ttf-ubuntu-font-family \
        xvfb \
        mesa-utils \
        libgl1-mesa-dri \
        x11vnc \
        midori \
	xpdf \
	\
	freecad \
        gmsh \
        python-vtk && \
    pip2 install -U pip \
        setuptools \
        wheel && \
	\
    pip2 install -U \
        Flask==0.10.1 \
        Flask-Login==0.2.11 \
        Jinja2==2.7.3 \
        MarkupSafe==0.23 \
        Werkzeug==0.9.6 \
        argparse==1.2.1 \
        backports.ssl-match-hostname==3.4.0.2 \
        docker-py==0.5.3 \
        gevent==1.0.1 \
        gevent-websocket==0.9.3 \
        greenlet==0.4.5 \
        itsdangerous==0.24 \
        peewee==2.4.1 \
        requests==2.4.3 \
        six==1.8.0 \
        websocket-client==0.21.0 \
        wsgiref==0.1.2 && \
    apt-get autoclean && \
    pt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD image /

EXPOSE 80
EXPOSE 5900

########################################################
# Customization for user and location
########################################################

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
COPY conf/nginx.conf /etc/nginx/sites-enabled/default
ADD conf/lxde $DOCKER_HOME/.config

RUN chown -R $DOCKER_USER:$DOCKER_GROUP $DOCKER_HOME






WORKDIR $DOCKER_HOME

ENTRYPOINT ["/sbin/my_init", "--quiet", "--", "/usr/bin/supervisord", "-n"]
