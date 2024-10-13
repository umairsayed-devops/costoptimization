#!/bin/bash

cloud_authentication_file="cloud_authentication.yaml"


AWS_ACCESS_KEY=$(yq '.cloud-credentials.aws.AWS_ACCESS_KEY' $cloud_authentication_file)
AWS_SECRET_KEY=$(yq '.cloud-credentials.aws.AWS_SECRET_KEY' $cloud_authentication_file)
AWS_REGION=$(yq '.cloud-credentials.aws.AWS_REGION' $cloud_authentication_file)
AWS_OUTPUT=$(yq '.cloud-credentials.aws.AWS_OUTPUT' $cloud_authentication_file)

aws configure set aws_access_key_id $AWS_ACCESS_KEY
aws configure set aws_secret_access_key $AWS_SECRET_KEY
aws configure set default.region $AWS_REGION
aws configure set output $AWS_OUTPUT

if [ $? -eq 0 ] 
then
  echo "AWS configuration completed successfully. Below are the login details."
  aws sts get-caller-identity
else
  echo "Failed to configure AWS."
fi

