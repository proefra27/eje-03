# Utilizar la imagen oficial de Maven para crear un artefacto de compilación.
FROM amazoncorretto:17-alpine-jdk
COPY target/Listas-0.0.1-SNAPSHOT.jar app.jar

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]
