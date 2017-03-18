## Docker Image for PDE package with FEniCS and Jupyter Notebook.

This Docker image is for solving numerical PDEs using FEniCS in Jupyter Notebook. This images inherits [numgeom/base](https://hub.docker.com/r/numgeom/fenics-notebook).

![Docker Repository on Quay](https://quay.io/repository/numgeom/pdepack-notebook/status "Docker Repository on Quay")

## Running Jupyter Notebook

To install Docker for your platform (Windows, MacOS, Linux, cloud platforms, etc.), follow the instructions at [docker.com](https://docs.docker.com/engine/getstarted/step_one/).

Once you have Docker installed, you can start Jupyter Notebook using the following command in the directory where you want to store your notebooks:
```
    docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared \
    -p 127.0.0.1:8088:8088 numgeom/pdepack-notebook \
    'jupyter-notebook --no-browser --ip=0.0.0.0 --port 8088'
```

If your version of Windows does not support Docker, you may need to [install Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/) instead. After you have installed Docker Toolbox, start it and run the following command in a Docker Toolbox terminal in your work directory:
```
     docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared -d -p \
    $(docker-machine ip $(docker-machine active)):8088:8088 numgeom/pdepack-notebook \
    'jupyter-notebook --no-browser --ip=0.0.0.0 --port=8088'
```

If successful, you will see some screen out such as:
"
```
...
Copy/paste this URL into your browser when you connect for the first time,
to login with a token:
http://0.0.0.0:8088/?token=2634a8f67ed91c582929e1a1137b8b3b400385b35afab19e
```
"

Copy and paste the URL into a web browser (such as Google Chrome). If port `8088` is being used, you can change it to a different port (say `8099`) by replacing `8088` with `8099 in the` `docker run` command.

When you have finished using Jupyter Notebook, use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

## Running as Linux environment

You can also run the image as a Linux environment for FEniCS. You can run the image using the following command:

    docker run -rm -ti -w/home/numgeom/shared -v $(pwd):/home/numgeom/shared \
    numgeom/pdepack-notebook:latest

which would share your current working directory into the container as `~/shared`. *Note that you should only save files under the shared directory because all other files will be lost when the process ends.*

Users with SELinux-enabled Linux distributions (Redhat, Fedora, CentOS, and others) will need to add the `:z` flag to the volume mount, e.g.:

    docker run -rm -ti -w/home/numgeom/shared -v $(pwd):/home/numgeom/shared:z \
    numgeom/pdepack-notebook:latest