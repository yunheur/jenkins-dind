# Outline

Jenkins Docker in Docker Image

# Create Docker Image

```bash
docker build -t yunheur/jenkins-dind:latest .
docker push yunheur/jenkins-dind
```

# How to use?

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
        - ./jenkins/jenkins_home:/var/jenkins_home
        - /var/run/docker.sock:/var/run/docker.sock
```

# Reference

- https://coding-start.tistory.com/329