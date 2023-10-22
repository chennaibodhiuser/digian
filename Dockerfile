# Use an official Amazon Linux as a parent image
FROM amazonlinux:2

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache2
RUN yum update -y && \
    yum install -y httpd && \
    yum clean all

# Copy the website files into the Apache web root directory
COPY digian-html/ /var/www/html/

# Expose port 80
EXPOSE 80

# Set the ServerName directive to suppress AH00558 warning
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

# Start Apache2 in the foreground
CMD ["httpd", "-D", "FOREGROUND"]