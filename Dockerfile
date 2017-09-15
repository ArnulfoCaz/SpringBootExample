FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY pom.xml .
RUN mvn dependency:resolve
COPY src ./src
RUN mvn package spring-boot:repackage
ADD build/libs/gs-spring-boot-0.1.0.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
