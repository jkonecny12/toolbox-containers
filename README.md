# Container Images for Toolbox
My personal container images for [Toolbox](https://github.com/containers/toolbox).

I'm using Fedora SilverBlue with my custom configuration. That means that I have a bit special requirements for the containers. Having `Containerfile`s will enable me to easily rebase to a new base image and also I know what is installed where. Anyone is welcome to use this for inspiration :).

# How to use this
There is a Makefile available to make the work with the repository smooth.

## Build the container image
Build or rebuild is done by the same way.

Build the base container image. The base container image is for direct consuming for general use containers or a base for other containers here.

```
make base
```

Build the specialized container image by:

```
make emacs  # supported container images are directories in this repository
```

## How to create new container from the image
You have to create the toolbox container from the image build locally.

```
make create CBASE=emacs  # to create emacs container from the image build here
toolbox enter emacs      # enter the new container
```

Or create a container from an image with different name.

```
make create CBASE=base CNAME=test-container  # create a container from 'localhost/base:<fedora-version>' with name 'test-container'
toolbox enter test-container                 # enter the new container
```

If you are not on the Fedora system or you want to have the image against other distribution version.

```
make create CNAME=packager FEDORA_VERSION=32  # create a container with name 'packager' with a base container of Fedora-32
toolbox enter packager                        # enter the new container
```

## How to refresh existing container from the new image
You can also recreate the container from the updated image. The create above won't work if you already has the container.

```
make refresh CBASE=emacs  # remove old emacs container and create a new one
toolbox enter emacs       # enter the new container
```
