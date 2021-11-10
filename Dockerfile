
  
#PHP webserver based on Alpine

# Using alpine linux as the base image
FROM docker.io/alpine:3.7

# Meta-data
LABEL maintainer="kubealex <al.rossi87@gmail.com>"
# Install the required resources for the apache container to run
RUN apk add --no-cache \     
    nmap
        
# Website can be accessed only through these ports
EXPOSE 80 443

# Copying the entrypoint script to implement all the configuration in your container
ADD docker-entrypoint.sh /usr/

# To start apache in the background as a service
CMD ["sleep", "100000000000"]
