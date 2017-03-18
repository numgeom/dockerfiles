## Docker Image for FEniCS stable with Jupyter Notebook and Py3.

This Docker image is for FEniCS stable version with Jupyter Notebook. It contains full-fledged and optimized versions of PETSc, SLEPc, petsc4py and slepc4py already compiled. FEniCS itself is built from the source code in the `git` repository, built with Python 3. 

This images inherits [fenics/stable](https://hub.docker.com/r/fenics/stable), which inherits fenicsproject's official [dev-env image](https://quay.io/repository/fenicsproject/dev-env). 

![Docker Repository on Quay](https://quay.io/repository/numgeom/fenics-notebook/status "Docker Repository on Quay")

## Running Jupyter Notebook

To install Docker for your platform (Windows, macOS, Linux, cloud platforms, etc.), follow the instructions at [docker.com](https://docs.docker.com/engine/getstarted/step_one/).

Once you have Docker installed, you can start Jupyter Notebook using the following command in the directory where you will store the Notebooks:
```
    docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared \
    -p 127.0.0.1:8088:8088 numgeom/fenics-notebook \
    'jupyter-notebook --no-browser --ip=0.0.0.0 --port 8088'
```

Your version os Windows does not support Docker, you may need to [install Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) instead. After you have installed Docker Toolbox, start it and run the following command in a Docker Toolbox terminal in the directory where you will store the Notebooks:
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

Copy and paste the command into a web browser (such as Google Chrome). 

When you are finished with using Jupyter Notebook, use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

## Running as Linux environment

You can also run the image as a Linux environment for FEniCS. Refer to the instructions for the [`fenics/stable` image](https://hub.docker.com/r/fenics/stable).
