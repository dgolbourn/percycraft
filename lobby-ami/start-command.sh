#!/bin/bash
source /opt/.env

start-server() {
    echo Server started >&2
    aws lambda invoke --function-name $STARTSTOPLAMBDA --payload "{\"start\":true,\"referrer\":\"server\"}" --cli-binary-format raw-in-base64-out /dev/null
    while true; do
        sleep 1
    done
    echo Server complete >&2
}

start-server
