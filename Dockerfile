FROM adoptopenjdk:11-jre-openj9

VOLUME /tmp

ARG JAR_FILE=build/libs/halo.jar
ARG PORT=8090
ARG TIME_ZONE=Asia/Shanghai

ENV TZ=${TIME_ZONE}
ENV HALO_VERSION 1.1.1

COPY ${JAR_FILE} halo.jar

EXPOSE ${PORT}

ENTRYPOINT -Djava.security.egd=file:/dev/./urandom -server -jar halo.jar
