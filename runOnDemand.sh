#!/bin/sh

curl -H "Authorization: Bearer $SUPERVISOR_TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"entity_id": "button.front_door_start_p2p_stream"}' \
        http://supervisor/core/api/services/button/press

ffmpeg -loglevel debug -rtsp_transport tcp   \
     -i rtsp://karlgharios:tonymontana@192.168.0.148:8554/front_door \
     -c:v copy -f rtsp rtsp://localhost:8554/proxy_xxx_front_door
