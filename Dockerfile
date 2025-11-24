FROM openjdk:17.0.17-jdk-slim-buster AS builder

WORKDIR /app

COPY target/eureka-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]