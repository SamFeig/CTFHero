# Start from apache base image
FROM httpd:2.4

# Copy contents of the camera web interfaces
COPY ./custom-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./root_dir/ /usr/local/apache2/htdocs/

# Remove default index.html to allow for error 404
# in this specific challenge
RUN rm /usr/local/apache2/htdocs/index.html

# Expose to outside containers
EXPOSE 80
