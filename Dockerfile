FROM openjdk:17-slim

MAINTAINER joao-vitor-moraveis

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/* \

COPY target/eurekaserver-0.0.1-SNAPSHOT.jar eurekaserver-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "eurekaserver-0.0.1-SNAPSHOT.jar"]
