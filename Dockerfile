FROM bluenviron/mediamtx:latest

COPY mediamtx.yml /config/mediamtx.yml

VOLUME [ "/config" ]

ENTRYPOINT [ "/mediamtx", "/config/mediamtx.yml" ]