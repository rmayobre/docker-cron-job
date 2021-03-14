# Docker Cron Template
A template for a docker image that supports cron jobs. Pull or fork this repo and build from it a docker container that requires cron jobs running in the background (or create a container for cron jobs).

## Dependencies
* Docker
* Docker-Compose (recommended)

## Running
You can run this docker container with just docker or use docker-compose.

### Docker

**Docker Build**
```shell
$ sudo docker build -t cron .
```
**Build output**
```shell
Sending build context to Docker daemon  97.28kB
Step 1/7 : FROM alpine
 ---> 28f6e2705743
Step 2/7 : COPY /scripts/entrypoint.sh /entrypoint.sh
 ---> 1c844ab52f94
Step 3/7 : COPY /scripts/timestamp.sh /timestamp.sh
 ---> 35274d295aef
Step 4/7 : COPY /data/cron/crontabs/*.cron /var/spool/cron/crontabs
 ---> a27f98dbb6fd
Step 5/7 : RUN mkdir -p /var/log/cron/ &&     chmod -R 0644 /var/spool/cron/crontabs &&     chmod +x  /timestamp.sh /entrypoint.sh
 ---> Running in 7f929156cad5
Removing intermediate container 7f929156cad5
 ---> 58d44fc9a9a4
Step 6/7 : VOLUME ["/var/log/cron/"]
 ---> Running in 8e9f2b4c591c
Removing intermediate container 8e9f2b4c591c
 ---> d0d46c9e7f46
Step 7/7 : ENTRYPOINT ["/entrypoint.sh"]
 ---> Running in 7e04c55dd932
Removing intermediate container 7e04c55dd932
 ---> 04c4421dbf9d
Successfully built 04c4421dbf9d

```
**Docker Run**
```shell
$ sudo docker run --rm -v ${PWD}/data/cron/log:/var/log/cron cron
```

**Docker Run Output**
```shell
Docker running...
example.cron
root
Press CTRL-C to exit
```

### Docker-Compose
```shell
$ docker-compose up
```
**Compose output**
```shell
$ sudo docker-compose up
Building cron
Step 1/7 : FROM alpine
 ---> 28f6e2705743
Step 2/7 : COPY /scripts/entrypoint.sh /entrypoint.sh
 ---> 8165a60a4aee
Step 3/7 : COPY /scripts/timestamp.sh /timestamp.sh
 ---> 04592dfd2f4f
Step 4/7 : COPY /data/cron/crontabs/*.cron /var/spool/cron/crontabs
 ---> 24952ca12dc2
Step 5/7 : RUN mkdir -p /var/log/cron/ &&     chmod -R 0644 /var/spool/cron/crontabs &&     chmod +x  /timestamp.sh /entrypoint.sh
 ---> Running in 2945fe795b98
Removing intermediate container 2945fe795b98
 ---> 2b02017aecfe
Step 6/7 : VOLUME ["/var/log/cron/"]
 ---> Running in 657a09181ee9
Removing intermediate container 657a09181ee9
 ---> 50403a563fde
Step 7/7 : ENTRYPOINT ["/entrypoint.sh"]
 ---> Running in beaf68fc6d56
Removing intermediate container beaf68fc6d56
 ---> c3ec742eeeb0

Successfully built c3ec742eeeb0
Successfully tagged docker-cron-job_cron:latest
WARNING: Image for service cron was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating cron-test ... done
Attaching to cron-test
cron-test | Docker running...
cron-test | example.cron
cron-test | root
cron-test | Press CTRL-C to exit
```
