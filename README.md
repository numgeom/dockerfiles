## Docker Images for FEniCS-Based PDE Solvers

This repository contains the Dockerfiles for building a few lightweight Docker images with FEniCS and other meshing tools. These tools are bundled with a Jupyter Notebook and an X11 environment with the lightweight LXDE desktop environment.

These images are particularly useful for teaching, learning, and quick prototyping. The prebuilt images are available at <https://hub.docker.com/u/numgeom>.

[![Build Status](https://travis-ci.org/numgeom/dockerfiles.svg?branch=master)](https://travis-ci.org/numgeom/dockerfiles)

## Using the Prebuilt Images

It is extremely easy to use the prebuilt images. First, make sure that you have Docker on your computer (MacOS, Linux, cloud platforms, etc.) by following the instructions at [docker.com](https://docs.docker.com/engine/getstarted/step_one/). Then follow these two basic steps:

 1. Download the `docker-notebook` script onto your local machine using the following command in a terminal:
 ```
     curl -O https://github.com/numgeom/dockerfiles/raw/master/docker-notebook
```
2. Run the `docker-notebook` command in the directory where you want to save your Notebook files. For example, to open a notebook named fenics-intro.ipynb, run the following command
```
     docker-notebook fenics-intro.ipynb
``` 
   would download and run the fenics-notebook Docker image, launch Jupyter Notebook within the image, and open up Jupyter Notebook in your default web browser.

## Limitations

* *Note that you should only save files under the shared directory. All other files will be lost when the Jupyter Notebook exits.
* The `docker-notebook` script does not support MS Windows. To run on the Windows platforms, follow the instructions in the corresponding directories to launch the images manually.
