FROM maven:3.9.5-jdk-17 AS builder
WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM openjdk:17-jre-slim-bookworm
WORKDIR /app

COPY --from=builder /app/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]