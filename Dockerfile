# Liberica JDK is a lightweight, fully open-source distribution of OpenJDK, free for all users including commercial
# and production use, and verified by TCK for Java SE.
#
# https://hub.docker.com/r/bellsoft/liberica-openjdk-alpine
# https://bell-sw.com/libericajdk-containers/

FROM bellsoft/liberica-openjdk-alpine:21

LABEL maintainer="Gernot Krost <gernot@krost.org"

RUN apk --no-cache add curl

RUN apk add fontconfig ttf-dejavu

COPY target/ollama4j-web-ui-*.jar /app/ollama4j-web-ui.jar

RUN <<EOF cat >> /app/application.properties
server.port=\${SERVER_PORT:9090}
logging.level.org.atmosphere=warn
spring.mustache.check-template-location=false
vaadin.launch-browser=true
vaadin.allowed-packages=com.vaadin,org.vaadin,dev.hilla,io.github.ollama4j
spring.jpa.defer-datasource-initialization=true
ollama.url=\${OLLAMA_HOST_ADDR:http://localhost:11434}
ollama.request-timeout-seconds=600
spring.servlet.multipart.max-file-size=50MB
spring.servlet.multipart.max-request-size=50MB
EOF

ENV JAVA_OPTS="-Xms512m -Xmx1024m"

ENV APP_CFG_FILE_PATH="/app/application.properties"

HEALTHCHECK --interval=5s --timeout=30s --retries=30 CMD curl -I -XGET http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Dserver.port=9090 -Dspring.config.location=file:$APP_CFG_FILE_PATH -jar /app/ollama4j-web-ui.jar"]