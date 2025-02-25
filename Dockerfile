# Utilizar la imagen oficial de Maven para crear un artefacto de compilación.
FROM maven:3.8.1-jdk-11 AS build
COPY pom.xml /app/
COPY src /app/src
WORKDIR /app
RUN mvn clean package -DskipTests

# Utilizar la imagen oficial de OpenJDK para una fase de producción más ligera.
FROM amazoncorretto:17-alpine-jdk
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 8080

# Ejecutar el archivo jar
ENTRYPOINT ["java", "-jar", "/app.jar"]