#!/bin/bash

REPOSITORY_NAME=yunheur/jenkins-dind
BRANCH_NAME="$(git name-rev --name-only HEAD | awk -F/ '{print $NF}')"
COMMIT_HASH="$(git rev-parse --verify HEAD | awk '{print substr($0,0,7)}')"

function login(){
   docker login --username yunheur
}

if [[ "$BRANCH_NAME" == "master" ]]; then
   docker build -t $REPOSITORY_NAME:lts -t $REPOSITORY_NAME:master.$COMMIT_HASH .

   login

   docker push $REPOSITORY_NAME:lts
   docker push $REPOSITORY_NAME:master.$COMMIT_HASH

   docker rmi $REPOSITORY_NAME:lts
   docker rmi $REPOSITORY_NAME:master.$COMMIT_HASH
else
   docker build -t $REPOSITORY_NAME:$BRANCH_NAME.$COMMIT_HASH .

   login

   docker push $REPOSITORY_NAME:$BRANCH_NAME.$COMMIT_HASH

   docker rmi $REPOSITORY_NAME:$BRANCH_NAME.$COMMIT_HASH
fi
