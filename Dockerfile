FROM openjdk:8-jre-alpine
EXPOSE 8080
ARG JAR_FILE=build/libs/Ramprasad-spring-CI-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} Ramprasad-spring.jar
CMD ["java", "-jar", "Ramprasad-spring.jar"]