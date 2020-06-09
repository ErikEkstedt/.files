# Docker


## Getting Started
based mostly on Dockers [get started](https://docs.docker.com/get-started/)


Basics
* A **container** is launched by running an **image**
* An **image** is an executable package. (code, runtime, libraries, env variables, etc)
* A **container** is a runtime instance of an **image**
  - User process
  - State
* **Dockerfile** -> build **Image** -> **Container**
* Valuable commands
  - `docker ps` to list running containers
  - `docker ps -a` to list all that have been running
  - `docker --version` to show version
  - `docker info` to show more info
  - `docker image ls` to show images
  - `docker container ls` to show running containers
  - `docker container ls --all` to show all containers
  - `docker container ls --aq` to shot all quiet containers
  - `docker run -it $Container` run in interactive mode 
    - Use `<C-d>` to exist interactive mode
* Sudo is required by default
  - Add group docker to user
  - create group `sudo groupadd docker`. Do not overwrite if exists.
  - add (current) user to group `sudo usermod -aG docker $USER`
  - **Test** by running `docker run hello-world`
* Create a **Dockerfile**
* Build `docker build --tag=name-of-image $PATH_TO_FOLDER`
  - Creates an image in the local docker path (see `docker info`)
  - default `/var/lib/docker`


```bash
docker build -t friendlyhello .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello  # Run "friendlyhello" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag  
```

---------------------

Dockerfile
* [Reference](https://docs.docker.com/engine/reference/builder/)
* [best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

Run
* [Reference](https://docs.docker.com/engine/reference/run/)
* Flags
  * `-d` detached mode. Run container in background
  * `-ipc` detached mode. Run container in background


# Nvidia-docker

* [Github](https://github.com/NVIDIA/nvidia-docker)
* [Instructions](https://github.com/NVIDIA/nvidia-docker)

## Install 

#### Make sure `docker-ce` is installed
- `sudo apt-get remove docker docker-engine docker.io containerd runc`
- `sudo apt-get update`
```bash
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
```
- add Dockers gpg key
  -`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
- verify
  - `sudo apt-key fingerprint 0EBFCD88`
- add repository
```bash
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
- update: `sudo apt-get update`
- install: `sudo apt-get install docker-ce docker-ce-cli containerd.io`

#### Nvidia-docker 


Remove older versions
```bash
# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker
```

Add repositories
* If on supported distributions
    ```bash
    # Add the package repositories
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
      sudo apt-key add -
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
      sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    ```
* For KDE Neon (based on ubuntu 18.04). Noticed hardcoded `distribution=ubuntu18.04`
    ```bash
    # Add the package repositories
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
      sudo apt-key add -
    distribution=ubuntu18.04
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
      sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    ```

Install
```bash
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

Test!

```bash
# Test nvidia-smi with the latest official CUDA image
docker run --gpus all nvidia/cuda:10.0-base nvidia-smi

```

## Pytorch

* Go to [Docker hub](https://hub.docker.com)
* Pytorch [https://hub.docker.com/r/pytorch/pytorch]
  * Select appropriate [tags](https://hub.docker.com/r/pytorch/pytorch/tags)
  * paste into docker base image 
    - e.g `FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-runtime`


