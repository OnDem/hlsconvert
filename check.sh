#!/bin/bash
IP=213.110.200.154
PRT=$1
CAM=$2

function restart_stream() {
	(echo 123456; echo "control $CAM pause"; echo "control $CAM play" ) | nc 127.0.0.1 4212
}

cd /var/www/stream

nc -vz $IP $PRT && ( rm ${PRT}_dissapear; touch ${PRT}_available ) || ( rm ${PRT}_available; touch ${PRT}_dissapear )

restart_stream
