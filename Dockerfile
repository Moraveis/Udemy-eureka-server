FROM openjdk:17-slim

WORKDIR /app

WORKDIR /app

RUN mkdir -p /app/libs && chmod 755 /app/libs

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /app/libs/opentelemetry-javaagent.jar https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.27.0/opentelemetry-javaagent.jar

COPY target/eurekaserver-0.0.1-SNAPSHOT.jar eurekaserver.jar

ENTRYPOINT ["java", "-jar", "eurekaserver.jar"]
