FROM maven:3.8.6-amazoncorretto-17 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM eclipse-temurin:17-jdk-alpine
COPY --from=build usr/src/app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8888