FROM ubuntu:latest
ENV DEBIAN_FRONTEND=nonintercative

# Installing necessary softwares
RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install sudo
RUN apt-get -y install apache2
RUN apt-get -y install curl
RUN apt install apache2-utils

# Enabling necessary modules
RUN a2enmod userdir
RUN a2enmod autoindex
RUN a2enmod rewrite
RUN a2enmod alias
RUN a2enmod vhost_alias
RUN a2enmod auth_basic
RUN a2enmod ssl
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_html
RUN a2enmod proxy_balancer
RUN a2enmod lbmethod_byrequests
RUN a2enmod headers

# Creating a user
RUN sudo adduser yhl50756
RUN sudo passwd -d yhl50756
RUN sudo usermod -aG sudo yhl50756

# Creating the working directory                                  
WORKDIR /home/yhl50756/public_html

# making and adding necessary dir and files
RUN mkdir /home/yhl50756/public_html/Dev
RUN mkdir /home/images
COPY images /home/images/
RUN touch .htpasswd /home/yhl50756/public_html/Dev/.htpasswd

# COPY necessary files to each sites
RUN mkdir /var/www/html/site1
COPY index.html /var/www/html/site1/public_html/index.html
COPY style.css /var/www/html/site1/public_html/style.css
COPY img /var/www/html/site1/public_html/img

RUN mkdir /var/www/html/site2
COPY index.html /var/www/html/site2/public_html/index.html
COPY style2.css /var/www/html/site2/public_html/style.css
COPY img /var/www/html/site2/public_html/img

RUN mkdir /var/www/html/site3
COPY index.html /var/www/html/site3/public_html/index.html
COPY style3.css /var/www/html/site3/public_html/style.css
COPY img /var/www/html/site3/public_html/img
RUN mkdir /var/www/html/site3/public_html/special
COPY index.html /var/www/html/site3/public_html/special/
COPY style3.css /var/www/html/site3/public_html/special/
COPY img /var/www/html/site3/public_html/special/img

# Copying necessary files to DocumentRoot directory               
COPY index.html .
COPY style.css .
COPY img ./img
COPY index.html /var/www/html/index.html
COPY style.css /var/www/html/
COPY img /var/www/html/img

# Copying necessary system files and ssl files
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY site1.conf /etc/apache2/sites-available/site1.conf
COPY site2.conf /etc/apache2/sites-available/site2.conf
COPY site3.conf /etc/apache2/sites-available/site3.conf
COPY site1.internal.cert /etc/apache2/ssl/
COPY site1.internal.key /etc/apache2/ssl/
COPY site2.internal.cert /etc/apache2/ssl/
COPY site2.internal.key /etc/apache2/ssl/
COPY site3.internal.cert /etc/apache2/ssl/
COPY site3.internal.key /etc/apache2/ssl/

# Enabling the vhost files and disabling the default vhost file
RUN a2ensite site1.conf
RUN a2ensite site2.conf
RUN a2ensite site3.conf
RUN a2dissite 000-default.conf

# Add in other directives as needed
LABEL Maintainer: "ye.lu.273@my.csun.edu"

EXPOSE 80
# CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
