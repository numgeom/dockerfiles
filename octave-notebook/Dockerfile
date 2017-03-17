FROM ubuntu:16.04

USER root
# Install some basic utilities
RUN apt-get -qq update && apt-get -y upgrade && apt-get -y install sudo vi

# Install python, octave and gnuplot
RUN apt-get -y install python python-pip ipython ipython-notebook && \
    apt-get -y install octave gnuplot

# Install jupyter-notebook, octave and gnuplot
RUN pip install -U pip jupyter octave_kernel && \
    python -m octave_kernel.install

# Enable LaTeX environment and spell checker for Jupyter Notebook
RUN pip install jupyter_latex_envs  && \
    jupyter nbextension install --py latex_envs && \
    jupyter nbextension enable --py latex_envs && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-spell-check-1.0.zip && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-document-tools-1.0.zip && \
    jupyter nbextension install https://bitbucket.org/ipre/calico/downloads/calico-cell-tools-1.0.zip && \
    jupyter nbextension enable --user calico-spell-check

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set default user to numgeom
RUN useradd -ms /bin/bash numgeom
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER numgeom
VOLUME /home/numgeom/shared
