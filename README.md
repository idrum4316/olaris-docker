# Olaris (Unofficial)
This is an unofficial image I'm maintaining for [Olaris](https://gitlab.com/olaris/olaris-server). Keep in mind that Olaris is pre-release software, and may be unstable at times.

**Use this image at your own risk.**

## Running
The configuration directory can be empty when you first run the image. Olaris will create some files there, and using a volume allows you to persist that data during upgrades.

```
docker run -d \
    -v /path/to/media:/var/media \
    -v /path/to/config:/root/.config/olaris \
    -p 8080:8080 \
    idrum4316/olaris:tag
```

## Cache/Transcode Volume
The cache location in the container is `/cache`. This is where temporary transcode files are stored, so it can get fairly large depending on what your server is doing. It may be helpful to use a volume for the cache directory if you don't have enough free space to store those files in the container.

```
docker run -d \
    -v /path/to/media:/var/media \
    -v /path/to/config:/root/.config/olaris \
    -p 8080:8080 \
    -v /path/to/cache:/cache \
    idrum4316/olaris:tag
```

## Reporting Issues
If you run into any issues with this image, let me know on [GitHub](https://github.com/idrum4316/olaris-docker).
