FROM alpine

# Dependencies for Olaris
RUN apk add curl

# Go expects glibc, but link musl instead
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Copy the binary into the image
COPY olaris-linux-amd64 /usr/local/bin/olaris
COPY rclone /usr/local/bin/rclone

ENV XDG_CACHE_HOME /cache
EXPOSE 8080
CMD ["olaris"]
