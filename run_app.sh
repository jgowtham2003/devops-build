#!/bin/bash

echo "run_app.sh  <imageName>"

if [[ ! -n $1 ]] ;
then 
	echo "Please pass imagename for app as parameter\n run_app.sh <imageName>"
else
	echo "Creating  image $1"
	docker run  -p 3030:3030 -d $1
fi
