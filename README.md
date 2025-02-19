# aretomo-containers
This repo contains recipes to build AreTomo3-2.0. Plans to add recipes for other CryoEM tools.

## Building the Containers
Building the container, you have the choice between `Docker` and `Singularity`. Both these tools will successfully build containers that can then be executed with `Singularity`.

### Docker
To build the AreTomo3-2 container using the Dockerfile:
```sh
docker build -t aretomo .
```
If you are building on Mac or another ARM arch, you have to explicitly specify the platform:
```sh
docker buildx build --platform linux/amd64 -t aretomo .
```

### Singularity
To build the contianer using the Singularity recipe file, you can execute:
```sh
singularity build aretomo3-2.sif Singularity
```
If you are building on a shared environment (HPC cluster/shared storage), you need to use fakeroot:
```sh
APPTAINER_TMPDIR=/scratch_space/$(whoami) APPTAINER_CACHEDIR=$(pwd)/cache singularity build --fakeroot aretomo3-2.sif Singularity
```

## Executing AreTomo3
We can use a script to wrap the call to `singularity`. The result is always similar to `bin/AreTomo3`. Instead of calling the container excplicitly, users and other software can just call this script. By this approach, we can use the containerized tool in software pipelines without risking breaking current flows.

To test the container, modify the path in `bin/AreTomo3`, then execute:
```sh
./bin/AreTomo3
```
