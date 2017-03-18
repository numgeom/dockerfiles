## Docker Image for Jupyter Notebook

This image supports Jupyter Notebook with Python 3 and some Notebook extensions (including LaTeX environment and spell checker).

## Instruction to Start Jupyter Notebook
if you use Docker on Linux, Mac, or Windows, use the following command to start up Jupyter Notebook:

```
    docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared \
    -p 127.0.0.1:8088:8088 numgeom/jupyter-notebook \
    'jupyter-notebook --no-browser --ip=0.0.0.0 --port 8088'
```


if you use Docker Toolbox on Windows, use the following command to start up Jupyter Notebook:

```
    docker run --rm -w /home/numgeom/shared -v $(pwd):/home/numgeom/shared -d -p \
    $(docker-machine ip $(docker-machine active)):8088:8088 numgeom/jupyter-notebook \
    'jupyter-notebook --no-browser --ip=0.0.0.0 --port=8088'
```
