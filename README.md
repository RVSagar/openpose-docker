# openpose-docker
Dockerfile for using OpenPose

## To use:

### Get Docker Running on Your Host
1. Make sure you have docker client (and daemon) installed on your host OS (see instructions at https://docs.docker.com/get-started/)
1. Check your docker daemon is running correctly. Running most basic docker client commands will verify this e.g.:
    ```bash
    docker image ls
    ```
1. If the above fails (typically on Ubuntu), you may need to restart your docker daemon:
    ```bash
    sudo service docker stop
    sudo service docker start
    ```

### Create docker image from the Dockerfile
1. Make sure you have nvidia drivers and the nvidia-cuda-toolkit installed or your container will try to use the inbuilt CPU graphics instead, and won't run properly. To install the toolkit:
    ```bash
    sudo apt-get install nvidia-cuda-toolkit
    ```
1. Install nvidia-docker by following the instructions at https://github.com/NVIDIA/nvidia-docker. This essentially boils down to:
    ```bash
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
    ```
1. Navigate to the folder you cloned this repo into.
1. From within this root directory:
    ```bash
    make
    ```

Note: Running `make` above should take approximately 20-30 minutes to generate with a decent GPU/CPU.

### Running the container
1. You have created a docker image above, and can now run it as a container
1. From within the root directory, run the below.
    ```bash
    ./start.sh
    ```
    (you should be able to open a new terminal and run ``start.sh`` as many times as you want to get multiple terminal windows inside the container)

Note: You may put any files that you want to use within the Docker container in the root folder and they will be accessible.

### Quick Example
1. To test whether OpenPose installed correctly try:
    ```bash
    cd /workspace/openpose
    ./build/examples/openpose/openpose.bin --video examples/media/video.avi --face
    ```
Note: this runs pretty slowly on my computer (Ryzen 2600 + NVIDIA GTX  1060 6GB), roughly 3fps.

### Closing the Docker container
1. To exit the container, type ``exit`` on the first terminal that you spawned the container on or open a new terminal window (not inside the container) and type ``docker kill "container_name"`` where "container_name" is the container name on your system. (To find the container name type ``docker images``)

