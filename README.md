# docker-rpi-nzbget

This is a raspberry pi compatible nzbget DockerFile.

To build it :

    build.sh

(you may want to update the version inside the build.sh)

To load it from pre-build image:

    docker load -i rpi-nzbget.tar

To run it (with pre-build tar image) :

    docker run -d -p 6789:6789 \
    -v /path_to_your_config_folder:/volumes/config \
    -v /path_to_your_download_folder:/volumes/download \
    -v /etc/localtime:/etc/localtime:ro \
    --restart unless-stopped \
    --name nzbget \
    rpi-nzbget

Description of parameters :
  - **-d** : to launch container as demon
  - **-v /path_to_your_media_folder:/volumes/media** : mount media folder in your container to a folder in your host. The media folder is the folder where nzbget scan your actuals media
  - **-v /path_to_your_config_folder:/volumes/config** : mount config folder in your container to a folder in your host
  - **-v /etc/localtime:/etc/localtime:ro** : synchronise time between host and container
  - **--restart unless-stopped** : restart the container unless it has been stopped by user
  - **--name nzbget** : container's name
  - **tbressers/rpi-nzbget** : image's name

The default login/password are :
  - login : **nzbget**
  - password : **tegbzn6789**
