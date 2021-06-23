#FROM openjdk:latest

FROM   tr1-docker.jfrog.io/amazonlinux:2.0.20210126.0
 
# copy the packaged jar file into our docker image
#COPY marduk-aws-19.1.0.jar /app1.jar
 
ARG https://config-external-main-stable-use1.akkadia.5759.aws-int.thomsonreuters.com
#ARG jdbc:postgresql://localhost:5432/postgres?ApplicationName=${spring.application.name}

ENV spring.cloud.config.uri=https://config-external-main-stable-use1.akkadia.5759.aws-int.thomsonreuters.com
#ENV spring.datasource.url="jdbc:postgresql://localhost:5432/postgres?ApplicationName=${spring.application.name}"
 
# set the startup command to execute the jar
#RUN apt-get update
#RUN apt-get install java
WORKDIR /

RUN yum install -y java-11-amazon-corretto \
&& curl -sSf -H "X-JFrog-Art-Api:AKCp8jQJ6BxXqVHb2hjWSMnUSocTFKHRQ3CAGFxMr7M61nAwsSNiCGBiSZSpRMkxW7B7fMHHX" -O 'https://tr1.jfrog.io/artifactory/libs-release-local/com/tr/akkadia/anzu-aws/0.0.1/anzu-aws-0.0.1.jar' 


CMD ["java", "-jar", "anzu-aws-0.0.1.jar"]
#RUN java -ea -noverify  -D= #-D= -jar app1.jar