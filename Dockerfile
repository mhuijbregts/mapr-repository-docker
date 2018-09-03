# Local MapR Package repository using nginx
#
# VERSION 0.1 - not for production, use at own risk
#

#
# Use a CentOS image as the base
FROM centos

MAINTAINER mkieboom @ mapr.com (code has gracefully been provided by mkieboom)

# Install and run Nginx
RUN yum install -y epel-release nginx

# Allow directory browsing
RUN sed -ie "s|location / {|location / { autoindex on;|g" /etc/nginx/nginx.conf

EXPOSE 80

# Launch nginx webserver and keep it in foreground to keep container alive
CMD nginx -g 'daemon off;'
