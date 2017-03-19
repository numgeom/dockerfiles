## Docker Images for Jupyter Notebook

This repository contains the Dockerfiles for building a few lightweight Docker images with Jupyter Notebook, including SciPy, Octave, ODE package (based on Octave and its symbolic and odepkg packages), FEniCS, and PDE package (based on FEniCS with additional mesh generation tools). All the images are built with Python 3, with some useful Jupyter Notebook extensions are preinstalled, including LaTeX environment and spell checker.

These images are particularly useful for teaching, learning, and quick prototyping. The prebuilt images are available at <https://quay.io/organization/numgeom>.

## Using the Prebuilt Images

It is extremely easy to use the prebuilt images. First, make sure that you have Docker on your computer (MacOS, Linux, cloud platforms, etc.) by following the instructions at [docker.com](https://docs.docker.com/engine/getstarted/step_one/). Then follow these two basic steps:

 1. Download the `docker-notebook` script onto your local machine using the following command in a terminal:
 ```
     curl -O https://github.com/numgeom/dockerfiles/raw/master/docker-notebook
```
2. Run the `docker-notebook` command in the directory where you want to save your Notebook files. You can also specify which notebook Docker image to use. For example, the following command
```
     docker-notebook fenics
``` 
   would download and run the fenics-notebook Docker image, launch Jupyter Notebook within the image, and open up Jupyter Notebook in your default web browser. You can replace `fenics` with `scipy`, `octave`, `odepack`, or `pdepack` to use their corresponding images.

## Limitations

* *Note that you should only save files under the shared directory. All other files will be lost when the Jupyter Notebook exits.
* The `docker-notebook` script does not yet support MS Windows. To run on the Windows platforms, follow the instructions in the corresponding directories to launch the images manually.