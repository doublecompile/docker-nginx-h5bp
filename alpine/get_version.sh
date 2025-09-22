#!/bin/sh
docker run --rm $1 cat /etc/os-release | grep VERSION_ID | cut -d'=' -f2
