FROM maven:3-jdk-8
VOLUME /tmp

COPY pom.xml .
RUN mvn dependency:resolve

COPY src ./src
RUN mvn clean package

ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
