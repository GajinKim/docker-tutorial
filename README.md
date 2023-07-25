### Image
think of it as a zip file that holds an application
- contains *everything* the application needs to run
- think of the image as the executable

### Container
the instance of the running application - think of a virtual machine
- think of the container as the running process

### Where to find images
can either be a repository or can locate in [docker hub](https://hub.docker.com/) (public docker images)

### Docker commands
`docker run {name of image}` - will run the container (it will also download the image if it is already not downloaded)
`docker pull {name of image}` - will download the image

`docker start {name of container OR container id}` - will start up an existing docker container (that is not already running)
`docker attach {name of container OR container id}` - will put you inside an interactive session for specified, running docker container

### Flags
`-i` interactive
`-t` terminal
- The idea is you do `-it` and it gives you an interactive terminal session
  
`--rm` by default exiting a container doesn't delete it (trash can).

`--name {name of the container}` gives the container name, it needs to be before the name of the container
  - For example, `docker run --rm -it --name {container name} {name of image}`

### Managing Containers
In Docker Desktop, if you do not specify the container to be removed (i.e. `--rm`) you will need to delete it manually (trash can icon)

Note: Status `Exited` means the container is no longer running, but any previous changes to the container state are still saved. 
- The container is no longer running (but it still exists)
- Adding the `--rm` flag not only stops the container from running, it also deletes it forever

![Alt text](image.png)

`docker ps -a` - lists ALL containers (whether they're running or not)
`docker ps` - lists only RUNNING containers