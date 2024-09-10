#!/bin/sh

curl -H "Authorization: Bearer $SUPERVISOR_TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"entity_id": "button.front_door_start_p2p_stream"}' \
        http://supervisor/core/api/services/button/press

ffmpeg -loglevel debug -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 5 \
     -i "rtsp://karlgharios:tonymontana@192.168.0.148:8554/T8B00511233623B2" \
     -c:v copy -f rtsp rtsp://localhost:8559/proxy_xxx_front_door
