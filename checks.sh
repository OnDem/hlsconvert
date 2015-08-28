#!/bin/bash
IP=213.170.88.6
PRT=$1
CAM=$2

function restart_stream() {
	(echo 123456; echo "control $CAM pause"; echo "control $CAM play" ) | nc 127.0.0.1 4212
}

cd /var/www/stream

nc -vz $IP $PRT && ( rm ${PRT}s_dissapear; touch ${PRT}s_available ) || ( rm ${PRT}s_available; touch ${PRT}s_dissapear )

restart_stream
