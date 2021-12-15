FROM python
# use base image from DOcker hub 
LABEL name="ashutoshh"
RUN mkdir /code
# creating folder inside image to store code
COPY hello.py  /code/
# copy from Docker client to Docker engine during image build
WORKDIR /code
# changing directory during build 
# likie cd command in linux 
CMD ["python","hello.py"]
# default process