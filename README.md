# docker-looper

Usage:

`docker run -d -v /root/.docker/config.json:/root/.docker/config.json -v /var/run/docker.sock:/var/run/docker.sock kamcio96/docker-looper:latest image-to-run:latest container-name`

Addional docker params:

`docker run -d -v /root/.docker/config.json:/root/.docker/config.json -v /var/run/docker.sock:/var/run/docker.sock kamcio96/docker-looper:latest image-to-run:latest container-name "-p 80:80"`
