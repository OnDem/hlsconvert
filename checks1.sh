#!/bin/bash
#IP=109.188.132.127
IP=91.233.168.162
PRT=$1
CAM=$2

function restart_stream() {
	(echo 123456; echo "control $CAM pause"; echo "control $CAM play" ) | nc 127.0.0.1 4212
}

cd /var/www/stream

nc -vz $IP $PRT && ( rm ${PRT}s1_dissapear; touch ${PRT}s1_available ) || ( rm ${PRT}s1_available; touch ${PRT}s1_dissapear )

restart_stream
