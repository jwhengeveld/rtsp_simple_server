ARG BUILD_FROM
FROM $BUILD_FROM

RUN mkdir -p /config/

CMD [ "/mediamtx", "/config/mediamtx.yml"]