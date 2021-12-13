FROM oraclelinux:8.5 
# base os LIB image from docker hub 
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"
# LABEL is optional but you can share as contact details for image users 
RUN yum  install httpd -y 
# TO give shell access to docker image build process 
COPY . /var/www/html/ 
# copy data from DOckerfile location to target image location 
# COPY is also checking .dockerignore file
CMD  ["httpd","-DFOREGROUND"]
# use of CMD is to set default process for container 