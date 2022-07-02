# Build image without caching

config ?= config.yml
include $(config.yml)
export $(shell sed 's/=.*//' $(config))

build:
      docker build -t ecoap_deployment_tool .

# Run ephemeral container 

run:
      docker run -it --rm --env-file./config.yml --name="deployment"



