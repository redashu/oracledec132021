FROM oraclelinux:8.5 as Builder 
# defining stage 1 
LABEL email="ashutoshh@linux.com"
# Install maven -- jdk support 
RUN yum install maven java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64 -y 
RUN mkdir /myproject 
# creating directory 
WORKDIR /myproject 
# changing 
COPY .  .
RUN  mvn clean package 
# is for building source code into .war file 
# target/WebApp.war 

FROM tomcat 
# this is final stage 
LABEL name="ashutoshh"
COPY --from=Builder /myproject/target/WebApp.war /usr/local/tomcat/webapps/
# Note if we are not using cmd / entrypoint then FROM image parent process
# will be inherited 