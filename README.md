# inception
running many services using a VM a some docker containers

## What is a VM?
A Virtual Machine is a software that simulates a computer in it's entirity, from hardware to OS and user applications.

## What is a container?
A container is a way to package an executable software with all that's needed for it's execution, all together in an isolated environment where it can be run consistently among different machines with different OS.

## What is an image?
The image contains all instructions needed for a container to be executed. You can say that a container is a running image. The container uses an isolated filesystem and the image provides this filesystem, containing all the code, instructions, dependencies, a default command to run and other metadatas.

## What is a Dockerfile?
It's a text file used to build a docker image.

## What is a docker compose?
It's a tool for defining and running multiple containers in a simple way. With a docker-compose.yml file you can start many docker containers using one command.