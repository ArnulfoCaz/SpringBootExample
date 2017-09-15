FROM maven:3-jdk-8
VOLUME /tmp

COPY pom.xml .
RUN mvn dependency:resolve

COPY src ./src
RUN mvn clean package

RUN ls -l -a

ADD ./target/gs-spring-boot-0.1.0.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
