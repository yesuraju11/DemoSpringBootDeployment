# Build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /workspace

COPY pom.xml ./
COPY .mvn .mvn
COPY mvnw ./
RUN chmod +x mvnw
RUN ./mvnw -q -DskipTests dependency:go-offline

COPY src ./src
RUN ./mvnw -q -DskipTests package

# Runtime stage
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

COPY --from=build /workspace/target/demo-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
