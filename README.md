# Olaris (Unofficial)
This is an unofficial image I'm maintaining for [Olaris](https://gitlab.com/olaris/olaris-server). Keep in mind that Olaris is pre-release software.

**Use this image at your own risk.**

## Running
The configuration directory can be empty when you first run the image. Olaris will create some files there, and using a volume allows you to persist that data during upgrades.

```bash
docker run -d \
    -v /path/to/media:/var/media \
    -v /path/to/config:/root/.config \
    -p 8080:8080 \
    idrum4316/olaris:tag
```

## Cache/Transcode Volume
The cache location in the container is `/cache`. This is where temporary transcode files are stored, so it can get fairly large depending on what your server is doing. It may be helpful to use a volume for the cache directory if you don't have enough free space to store those files in the container.

```bash
docker run -d \
    -v /path/to/media:/var/media \
    -v /path/to/config:/root/.config \
    -p 8080:8080 \
    -v /path/to/cache:/cache \
    idrum4316/olaris:tag
```

## Rclone (Added in 0.2.0)
I have not been able to do any successful testing with rclone because I don't use Google Drive. I've included the binary in the image, so it's theoretically available if you want to set it up. The config file is going to be `/root/.config/rclone/rclone.conf` inside of the container, so if you have an existing rclone configuration file, you can go ahead and put it in `/path/to/config/rclone/rclone.conf` using the example paths from the commands above. The paths will likely need to be modified to fit your system.

If you don't have an existing rclone configuration, you can start the image and then run this command to launch the configuration wizard.

```bash
docker exec -it <my-container-name> rclone config
```

The rclone command is available in the path, so if you're running in something like Unraid, you can open a console in your container and use the rclone command from there.

## Reporting Issues
If you run into any issues with this image, let me know on [GitHub](https://github.com/idrum4316/olaris-docker).
