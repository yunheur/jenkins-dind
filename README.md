# Jenkins DinD (Docker in Docker)

The jenkins docker image is for using docker.

### Create Docker Image

```bash
./build-docker.sh
```

### How to use this image

The following is how to use docker container.

```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 \
        -v /your/home:/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        yunheur/jenkins-dind:lts
```

The following is how to use docker compose.
```yaml 
jenkins:
    image: yunheur/jenkins-dind:lts
    container_name: jenkins
    restart: always
    ports: 
        - "8080:8080"
        - "50000:50000"
    privileged: true
    volumes:
        - /your/home:/var/jenkins_home
        - /var/run/docker.sock:/var/run/docker.sock
```

### Trouble Shooting

If permission denied occurs, modify the permissions of the host's docker.sock file as shown below.
```bash
$ sudo chmod 666 /var/run/docker.sock
```

&nbsp;

If permission denied occurs in docker container, modify the permissions of the docker container's docker.sock file as shown below.
```bash
$ docker exec -it --user root jenkins bash
$ chmod 666 /var/run/docker.sock
$ exit
```



### References

- https://coding-start.tistory.com/329
