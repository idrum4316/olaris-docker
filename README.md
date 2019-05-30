# Olaris (Unofficial)
This is an unofficial image I'm maintaining for [Olaris](https://gitlab.com/olaris/olaris-server). Keep in mind that Olaris is still in heavy development, and it may be unstable at times.

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
If you want to store the cache files in a volume, you can specify a volume and environment variable to configure that. This is where temporary transcode files are stored, so it can get fairly large depending on what your server is doing.

```
docker run -d \
    -v /path/to/media:/var/media \
    -v /path/to/config:/root/.config/olaris \
    -p 8080:8080 \
    -e XDG_CACHE_HOME=/cache \
    -v /path/to/cache:/cache \
    idrum4316/olaris:tag
```

## Building the Image
To build the image, you need to have a build of Olaris in your working directory, called `olaris-linux-amd64`. Then you can build the image by doing a basic:

```
docker build -t idrum4316/olaris:tag .
```

## Reporting Issues
If you run into any issues with this image, let me know on [GitHub](https://github.com/idrum4316/olaris-docker).
