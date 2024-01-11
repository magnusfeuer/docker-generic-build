# Generic Docker build container
  
Thanks to Ravi Chandran for providing [input and templates](https://opensource.com/article/20/4/how-containerize-build-system)

This repo contains simple docker files, container creation scripts,
and build scripts to build most C/C++ (and other) systems.


See official [Docker documentation](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
for instructions on how to install docker on a Debian/Ubuntu box.

## Creating a customzied build container


1. **Copy and modify docker file template**  
   Create a copy of the template
   `docker-build/template-build-container.dockerfile` and add apt
   packages and additional setup commands as needed.

2. **Create a docker image**  
   Run the docker image build script with your customized docker file as a single argument: 
   ```shell
   cd docker-build
   ./build-docker.image.sh my-docker-image.dockerfile
   ``` 
   The docker image will be named `my-docker-image:v1`

3. **Launch the docker image with a shell**  
   Run the `build.sh` script with your docker image name and source
   code directory on your local machine:
    ```shell
    ./build.sh my-docker-image ~/work/my-source-code /bin/bash
    ```
    (The `/bin/bash` command argument is optional since that is the
    default command if nothing is specified)

    The docker image will launch and drop you into an interactive bash shell.

    The current directory of the shell is `/src/`, which is mounted
    as a docker volume to the local machine's `~/work/my-source-code`
    directory/

4. **Do trial builds inside docker**  
   Do a test build from inside the container and note any missing
   packages and setups needed to successfully build the code in
   `~/work/my-source-code`

5. **Update docker file and re-create docker image**  
   Exit the docker container (ctrl-d) and update the docker file with the
   necessary changes.  Recreate the docker image and test again as
   described in step 2-4.


## Building code using the customized docker image
Run the build script, providing docker image, source dir and build command

```shell
./build.sh my-docker-image ~/work/my-source-code make all
```

The `make all` command will be exceuted inside the docker container in the
`/src/` directory mapped to `~/work/my-source-code`.

