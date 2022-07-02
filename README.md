
# Arq 

>> Bash script -> ephemeral container in dev's host -> lambda start instance \
-> CI/CD instance -> ship artifactory -> lambda stop instance 

Bash script: 
Info: Check or build image in host and run container   
1. Validate if docker image exist 
1a. If the docker image doesn't exist build it
1b. If the docker image exist keep forward
2. Create a ephemeral container passing config.yml as argument

Docker image
1. Python based
2. Install AWS Cli
3. Configure aws cli
4. Install boto3
```sh
  apt update
  apt upgrade -y
  apt install curl -y
  apt install zip -y 
  cd /home/workspace/
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ./aws/install

```

BIG QUESTION
1. Docker secrets
2. Download image from ECR 

Ephemeral container:
Info: Load the new parameters in parameter store, start CICD instance using lambda and connect to it to run build scripts
# aws ssm put-parameter --overwrite --name "parameter-name" --type "String" --value "parameter-value"
1. Delete old values in parameter store
2. Add new values in parameters store
3. Validate new values in parameter store
4. Invoke lambda function to start CICD instance 
5. Get output and invoke lambda function to stop CICD instance

Lambda start instance:
1. Get values from parameter store
2. Start CICD and prod instance.. how shit pass parameter to instance? :)
3. Trigger an function to get healtchecks 

CICD instance
1. Get env
2. Download repository 
3. Checkout to tag
4. Build

**Build frontend**
run container and build 
download build directory to folder (docker cp)
delete all files in bucket s3
upload new files in bucket s3
create cloudfront invalidations

**Build backend**
docker build
docker save
scp to prod
ssh instance 
stop old container
delete old container
docker load
start new container
curl to instance and show output

Lambda stop instance 
1. stop CICD and prod instance

# Stack 
> Technologies & dependencies

Dependencies in dev host 
- Docker

Technologies:
- Bash 
- Python


