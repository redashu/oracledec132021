FROM oraclelinux:8.5 
# use base image from DOcker hub 
LABEL name="ashutoshh"
RUN yum install python3 -y 
RUN mkdir /code
# creating folder inside image to store code
ADD hello.py  /code/
# copy from Docker client to Docker engine during image build
# ADD and copy both are but add can take data from URL also
WORKDIR /code
# changing directory during build 
# likie cd command in linux 
ENTRYPOINT  ["python3","hello.py"]
# default process cmd and entrypoint both are same 
# diff wil discuss