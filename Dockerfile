FROM maven:3.9.2-openjdk-21-slim AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 2) Imagen ligera para runtime
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/target/transporte-api-0.0.1-SNAPSHOT.war ./app.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.war"]
