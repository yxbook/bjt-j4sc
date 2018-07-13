FROM sapmachine/jdk10:10.0.1.10.0-jre-alpine
VOLUME /tmp
ADD j4sc-service.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]