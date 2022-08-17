#!/bin/bash

docker build . -t 911960542707.dkr.ecr.ap-southeast-1.amazonaws.com/infra-training-test-pod:v1
docker login --username AWS --password $(aws ecr get-login-password --region ap-southeast-1) 911960542707.dkr.ecr.ap-southeast-1.amazonaws.com
docker push 911960542707.dkr.ecr.ap-southeast-1.amazonaws.com/infra-training-test-pod:v1
