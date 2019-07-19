# Handbrake in a Docker container with nvenc support


**This Docker container is still WiP, so it could be a bit buggy** ;)

This image uses a [x2go-server](https://wiki.x2go.org/doku.php) that allows you to connect to the server-GUI via the [x2go-client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient).

---

In order to make this image work, you need to have [nvidia-docker2](https://github.com/NVIDIA/nvidia-docker) installed in order to enable passthru to the nvidia card(s).

You will also need to have the [Nvidia-CUDA-toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64)  to be installed.

## Instructions

Installation instructions for docker itself can be found [here](https://docs.docker.com/install/).

To start the docker image run:

```
docker run -d \
 --name "Handbrake-Docker" \
 --runtime=nvidia \
 -p 2200:22 \
 -v <insert/path/here>:/home/linux/Handbrake-Video/ \
zocker160/handbrake-nvenc:latest
```

#### Usage

- `--name` here you can set the name of the docker image
- `--runtime=nvidia` this enables the passthrough to the GPU(s)
- `-p <port>:22` x2go uses SSH in order to connect to the server, so feel free to remap it to any port you want
- `-v <insert/path/here>:/home/linux/Handbrake-Video/` map this to any folder on your computer containing the videos you want to convert *(you can map more than this folder into the `/home/linux` path)*


## Connect to the Container

You need to have the x2go client installed in order to connect to the server with following settings:

**Host:** `<your_server_ip>`

**Login:** `linux`

**SSH-Port:** `<any_port_specified_above>`

**session-type / desktop env:** `XFCE` **OR** `application`:`ghb`

**the password is:** `debian`
