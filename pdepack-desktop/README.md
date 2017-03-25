## Docker Image for PDE package with FEniCS and Jupyter Notebook.

This Docker image is for solving numerical PDEs using FEniCS in Jupyter Notebook. This images inherits [numgeom/fenics-notebook](https://hub.docker.com/r/numgeom/fenics-notebook).

[![Docker Repository on Quay](https://quay.io/repository/numgeom/pdepack-desktop/status "Docker Repository on Quay")](https://quay.io/repository/numgeom/pdepack-desktop)

## Running Jupyter Notebook

To install Docker for your platform (Windows, MacOS, Linux, cloud platforms, etc.), follow the instructions at [docker.com](https://docs.docker.com/engine/getstarted/step_one/).

Once you have Docker installed, you can start Jupyter Notebook using the following command in the directory that contains your notebook (e.g., pde-intro.ipynb):
```
    docker-desktop pde-intro.ipynb
```
The `docker-notebook` script can be downloaded at <https://github.com/numgeom/dockerfiles/raw/master/docker-notebook>.

## Running Jupyter Notebook with Docker Toolbox

If your version of Windows does not support Docker, you may need to [install Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) instead. After you have installed Docker Toolbox, start it and run the following command in a Docker Toolbox terminal in your work directory:
```
     docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared -d -p \
    $(docker-machine ip $(docker-machine active)):6080:80 numgeom/pdepack-desktop
```

If successful, point your webbrowser to the following address:
```
http://localhost:6080
```

After you have finished using the Docker image, use Control-C to stop the server.
