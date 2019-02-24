# Start from apache base image
FROM httpd:2.4

# Copy contents of the camera web interfaces
COPY ./custom-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./root_dir/ /usr/local/apache2/htdocs/

# Create a password file for this specific camera
RUN htpasswd -b -c /usr/local/apache2/htdocs/.htpasswd admin default5837
RUN chmod 0644 /usr/local/apache2/htdocs/.htpasswd

# Expose to outside containers
EXPOSE 80
