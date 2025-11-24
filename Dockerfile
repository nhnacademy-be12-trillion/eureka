# 1. 베이스 이미지 설정 (Java 17 예시)
FROM openjdk:17-jdk-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 빌드된 JAR 파일을 컨테이너로 복사
# (Gradle 빌드 기준 경로입니다. Maven이면 target/*.jar)
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# 4. 실행 명령어
# 환경 변수는 실행 시점(docker run)에 주입되므로 여기선 java -jar만 하면 됩니다.
ENTRYPOINT ["java", "-jar", "app.jar"]