## Docker Image for FEniCS stable with Jupyter Notebook.

This Docker image is for FEniCS stable version with Jupyter Notebook. It contains full-fledged and optimized versions of PETSc, SLEPc, petsc4py and slepc4py already compiled. FEniCS itself is built from the source code in the `git` repository. 

[![Build Status](https://travis-ci.org/numgeom/dockerfiles.svg?branch=master)](https://travis-ci.org/numgeom/dockerfiles)    [![Docker Repository on Quay](https://quay.io/repository/numgeom/fenics-notebook/status "Docker Repository on Quay")](https://quay.io/repository/numgeom/fenics-notebook)

## Running Jupyter Notebook

To install Docker for your platform (Windows, MacOS, Linux, cloud platforms, etc.), follow the instructions at [docker.com](https://docs.docker.com/engine/getstarted/step_one/).

Once you have Docker installed, you can start Jupyter Notebook using the following command in the directory that contains your notebook (e.g., fenics-intro.ipynb):
```
    docker-notebook -i fenics-notebook fenics-intro.ipynb
```

The `docker-notebook` script can be downloaded at <https://github.com/numgeom/dockerfiles/raw/master/docker-notebook>.

## Running Jupyter Notebook with Docker Toolbox

If your version of Windows does not support Docker, you may need to [install Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) instead. After you have installed Docker Toolbox, start it and run the following command in a Docker Toolbox terminal in your work directory:
```
     docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared -d -p \
    $(docker-machine ip $(docker-machine active)):8088:8088 numgeom/fenics-notebook \
    'jupyter-notebook --no-browser --ip=0.0.0.0 --port=8088'
```

If successful, you will see some screen out such as:
```
...
Copy/paste this URL into your browser when you connect for the first time,
to login with a token:
http://0.0.0.0:8088/?token=2634a8f67ed91c582929e1a1137b8b3b400385b35afab19e
```

Copy and paste the URL into a web browser (such as Google Chrome). If port `8088` is in use, you can change it to a different port (say `8099`) by replacing `8088` with `8099 in the` `docker run` command.

When you have finished using Jupyter Notebook, use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

## Running as Linux environment

You can also run the image as a Linux environment for Fenics. You can run the image using the following command:

    docker run --rm -ti -w/home/numgeom/shared -v $(pwd):/home/numgeom/shared \
    numgeom/fenics-notebook:latest

which would share your current working directory into the container as `~/shared`. *Note that you should only save files under the shared directory because all other files will be lost when the process ends.*

Users with SELinux-enabled Linux distributions (Redhat, Fedora, CentOS, and others) will need to add the `:z` flag to the volume mount, e.g.:

    docker run --rm -ti -w/home/numgeom/shared -v $(pwd):/home/numgeom/shared:z \
    numgeom/fenics-notebook:latest