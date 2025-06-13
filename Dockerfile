# ------------------------------
# Stage 1: build con JDK 21 + Maven
# ------------------------------
FROM eclipse-temurin:21-jdk AS builder

# 1. Prepara el directorio de trabajo
WORKDIR /app

RUN apt-get update \
 && apt-get install -y maven \
 && rm -rf /var/lib/apt/lists/*

COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=builder /app/target/transporte-api-0.0.1-SNAPSHOT.war ./app.war

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.war"]
