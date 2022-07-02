#!/bin/bash  

if ! docker info > /dev/null 2>&1; then
  echo "This script uses docker, and it isn't running - please start docker and try again!"
  exit 1
fi

if ! (docker image ls | grep "astro")  > /dev/null 2>&1; then

  docker build -t "astro:v0.0.1" --secret id=my_env,src=.env .
fi

TYPE=$(grep -i type config.yml | awk '{ print $2 }' | tr -d '""')
VERSION=$(grep -i version config.yml | awk '{ print $2 }' | tr -d '""')

echo "The type of service is $TYPE and version is $VERSION"
read -p "Do you wish to continue? [y/n] " RESPONSE 

if [[ $RESPONSE = "n" ]]; 
then
  echo "Deploy cancelled"
  exit 
fi

echo "Starting astro deploy" 

# docker run --rm -e $TYPE -e $VERSION astro:v0.0.1 -c sh "something" 


