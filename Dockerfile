# 1. 베이스 이미지 설정 (가장 흔하게 사용되는 'bullseye' 버전의 slim 태그로 수정)
FROM openjdk:17-jdk-slim-bullseye
# 이전: FROM openjdk:17-jdk-slim (에러 발생)

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 빌드된 JAR 파일을 컨테이너로 복사
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# 4. 실행 명령어
ENTRYPOINT ["java", "-jar", "app.jar"]