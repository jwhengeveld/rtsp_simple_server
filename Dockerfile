# Stage 2: Use bluenviron/mediamtx for MediaMTX setup
FROM bluenviron/mediamtx:latest-ffmpeg
WORKDIR /media

# Copy MediaMTX config
COPY mediamtx.yml /config/mediamtx.yml

# Expose volume for configuration
VOLUME [ "/config" ]

# Assuming the base image uses apt (Debian/Ubuntu based), adjust as needed for others
# RUN apt-get update && apt-get install -y curl

# Alternatively, if it's an Alpine-based image, use:
RUN apk add --no-cache curl

COPY ["entrypoint.sh", "/entrypoint.sh"]

# Optionally copy binaries or files from node stage to this image
RUN chmod a+x /entrypoint.sh
RUN chmod 777 /entrypoint.sh

COPY runOnDemand.sh /runOnDemand.sh

RUN chmod a+x /runOnDemand.sh

# Final entry point, e.g., start both node or MediaMTX-related commands
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]