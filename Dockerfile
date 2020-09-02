# Use ubuntu as a base image
FROM ubuntu:20.04

# Update base image
RUN apt-get update -y
RUN apt-get upgrade -y

# set time sone
ENV timezone=UTC
RUN echo $timezone > input.txt
RUN apt-get install -y tzdata < input.txt
RUN rm input.txt

# Install PHP
RUN apt-get install php7.4 -y
RUN apt-get install libapache2-mod-php7.4 -y
RUN apt-get install php7.4-mysql -y
RUN apt-get install php7.4-cli -y
RUN apt-get install php7.4-zip -y

# Install apache2
RUN apt-get install -y apache2
RUN a2enmod rewrite
RUN rm /var/www/html/index.html

# run apache in the foreground
CMD apachectl -D FOREGROUND