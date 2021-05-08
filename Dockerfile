FROM jenkins/jenkins:lts

USER root

COPY setup/install-docker.sh /install-docker.sh
RUN chmod +x /install-docker.sh
RUN /install-docker.sh
RUN rm /install-docker.sh

RUN usermod -aG docker jenkins

USER jenkins
