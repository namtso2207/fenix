# Fenix script set to build Ubuntu/Debian images

Supported build host:

* `Ubuntu 22.04 Jammy x64`
  * `Building Ubuntu 22.04 Jammy image`
  * `Building Debian 11 Bullseye image`
* `Docker`

## How to use

### Install essential packages

```bash
$ sudo apt-get install git make lsb-release qemu-user-static
```

### Clone Fenix repository

```bash
$ mkdir -p ~/project/namtso
$ cd ~/project/namtso
$ git clone --depth 1 https://github.com/xxxx/fenix
$ cd fenix
```

### Setup build environment

* Setup environment manually.

```bash
$ source env/setenv.sh
```

* Or you can load environment configuration from file.

```bash
$ source env/setenv.sh config config-template.conf
```

You need to edit `config-template.conf` file to correct variables.

### Build image

```bash
$ make
```
For Chinese users, it's better to use mirror from China:

```bash
$ DOWNLOAD_MIRROR=china make
```

## Somethings with Redhat series

### Disable SELinux

```bash
$ vim /etc/selinux/config
$ SELINUX=enforcing --> SELINUX=disabled
$ sudo reboot
```

## Build in Docker

### Get Docker image

```bash
$ cd fenix
$ docker pull numbqq/fenix-namtso:latest
```

### Build image in Docker

Run fenix in docker.

```bash
$ docker run -it --name fenix-namtso -v $(pwd):/home/namtso/fenix \
             -v /etc/localtime:/etc/localtime:ro \
             -v /etc/timezone:/etc/timezone:ro \
             -v $HOME/.ccache:/home/namtso/.ccache --privileged \
             --device=/dev/loop-control:/dev/loop-control \
             --device=/dev/loop0:/dev/loop0 --cap-add SYS_ADMIN \
             numbqq/fenix-namtso
```

We are in Docker container now, start to build.

```bash
namtso@2236f8203036:~/fenix$ source env/setenv.sh
namtso@2236f8203036:~/fenix$ make
```

For Chinese users, it's better to use mirror from China:

```bash
namtso@2236f8203036:~/fenix$ DOWNLOAD_MIRROR=china make
```


To restart the Docker container a second time.

```bash
$ docker start fenix-namtso
$ docker exec -ti fenix-namtso bash
```
