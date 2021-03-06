# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="adsoft@live.com.mx"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 5021

# The application's jar file
ARG JAR_FILE=target/postgres-demo-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} postgres-demo.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/postgres-demo.jar"]

# docker build
# sudo docker build -t <dockerhub-user>/ng5-api .

# docker run
# sudo docker run --name <linuxuser>-api -p 5022:8080 -d <monteshgu>/postgres-demo-api  
