FROM maven:3.6.0-jdk-11-slim AS build

RUN mvn package

COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080