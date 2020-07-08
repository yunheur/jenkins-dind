# Jenkins DinD (Docker in Docker)

The jenkins docker image is for using docker.

# Create Docker Image

```bash
docker build -t yunheur/jenkins-dind:latest .
docker push yunheur/jenkins-dind
```

# How to use this image

The following is how to use docker container.

```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 \
        -v /your/home:/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        yunheur/jenkins-dind:latest
```

The following is how to use docker compose.
```yaml 
jenkins:
    image: yunheur/jenkins-dind:latest
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

# Reference

- https://coding-start.tistory.com/329