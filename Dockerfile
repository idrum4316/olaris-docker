FROM ubuntu:20.04

# Dependencies for Olaris
RUN apt update && apt install -y curl

# Copy the binary into the image
COPY olaris /usr/local/bin/olaris
COPY rclone /usr/local/bin/rclone

ENV XDG_CACHE_HOME /cache
EXPOSE 8080
CMD ["olaris"]
