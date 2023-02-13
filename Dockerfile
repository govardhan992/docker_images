# Use an official Debian-based image as the base image
FROM debian:10

# Set the working directory
WORKDIR /usr/local/tomcat

# Update the package list and install Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

# Download Apache Tomcat
RUN wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.tar.gz && \
    tar -xvzf apache-tomcat-9.0.38.tar.gz && \
    rm apache-tomcat-9.0.38.tar.gz && \
    mv apache-tomcat-9.0.38/* /usr/local/tomcat/

# Expose the default Tomcat port
EXPOSE 8081

# Set the entrypoint to start Tomcat
ENTRYPOINT [ "/usr/local/tomcat/bin/catalina.sh", "run" ]
