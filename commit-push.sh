#!/bin/bash 

# Reference: https://docs.docker.com/engine/userguide/containers/dockerimages/

echo "Usage: "
echo "  ${0} <comment> <repo-name/repo-tag>"
echo
echo "-- Make sure you do login first: "
echo "   docker login"
echo

comment=${1:-Default Comment}
image="jeffreymanning/jre-mvn-py"
accntTag=jeffreymanning
projectTag=jre-mvn-py
imageTag=${2:-${accntTag}/${projectTag}}

docker ps -a

containerID=`docker ps |grep "${imageTag} "|awk '{print $1}'`
echo "containerID=$containerID"

docker commit -m "$comment" ${containerID} ${imageTag}

docker push ${imageTag}


