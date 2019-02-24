# Start from apache base image
FROM httpd:2.4

# Copy contents of the camera web interfaces
COPY ./custom-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./root_dir/ /usr/local/apache2/htdocs/

# Expose to outside containers
EXPOSE 80
