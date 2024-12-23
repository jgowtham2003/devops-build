#!/bin/bash

echo "run_from_aws.sh  <imageName> <tagname>"

if [ $# -ne 2 ];
then 
    echo "Please pass imagename from dockerhub as parameter and tagname as second param\n"
    echo "run_from_aws.sh <imageName> <tagname>"
else
    IMAGE_NAME=$1
    TAG=$2
    CONTAINER_NAME="build-devops"
    PORT="3030:3030"  # Change as needed

    # Pull the latest image
    docker pull $IMAGE_NAME:$TAG

    # Stop and remove existing container if running
    docker stop $CONTAINER_NAME 2>/dev/null
    docker rm $CONTAINER_NAME 2>/dev/null

    # Run new container
    docker run -d \
        --name $CONTAINER_NAME \
        -p $PORT \
        $IMAGE_NAME:$TAG

    # Verify container is running
    docker ps | grep $CONTAINER_NAME
fi
