#!/bin/bash

echo "build_app.sh  <imageName>"

if [[ ! -n $1 ]] ;
then 
	echo "Please pass new imagename for app as parameter\n build_app.sh <imageName>"
else
	echo "Creating  image $1"
	docker  build -t $1 .
fi
