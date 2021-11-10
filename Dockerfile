
  
#PHP webserver based on Alpine

# Using alpine linux as the base image
FROM docker.io/alpine:3.7

# Meta-data
LABEL maintainer="kubealex <al.rossi87@gmail.com>"
# Install the required resources for the apache container to run
RUN apk add --no-cache \     
	    bash \
        sed \
		vim \
    nmap \
        ca-certificates \
        apache2 \
        apache2-utils \
	    apache2-ctl \
        apache2-ldap \
        apache2-ssl \
        apache2-proxy \
        apache2-proxy-html \
        apache2-http2 \
        apache-mod-fcgid \
        php7 \
        php7-apache2 \
        php7-mysqlnd \
        php7-mysqli \
        php7-zlib \
        php7-bz2 \
        php7-xml \
        php7-simplexml \
        php7-xmlrpc	\
        php7-json \
        php7-gd \
        php7-iconv \
        php7-curl \
        php7-ldap \
        php7-mbstring \
        php7-gettext \
        php7-calendar \
        php7-openssl \
	    php7-ctype \
        php7-session \
        php7-dom \
        php7-pdo \
        php7-xsl \
        php7-pdo_mysql \
        ssmtp \
        iptables \
        fail2ban \
        tzdata
        
# Website can be accessed only through these ports
EXPOSE 80 443

# Copying the entrypoint script to implement all the configuration in your container
ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/nmap -v scanme.nmap.org"]

# To start apache in the background as a service
CMD ["httpd", "-DFOREGROUND"]
