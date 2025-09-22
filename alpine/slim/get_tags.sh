#!/bin/sh
# Usage: ./get_tags.sh $image_name $nginx_branch
set -e
nginx_branch=$2
platform=${IMAGE_PLATFORM:-linux/amd64}
variant="alpine-slim"
alpine_full_version=$(docker run --platform $platform --rm $1 cat /etc/os-release | grep VERSION_ID | cut -d'=' -f2)
alpine_minor_version=${alpine_full_version%.*}
nginx_full_version=$(docker run --platform $platform --rm $1 sh -c 'echo $NGINX_VERSION')
nginx_major_version=${nginx_full_version%%.*}
nginx_minor_version=${nginx_full_version%.*}

echo "type=raw,value=$nginx_full_version-$variant"
echo "type=raw,value=$nginx_major_version-$variant"
echo "type=raw,value=$nginx_minor_version-$variant"
echo "type=raw,value=$variant"
echo "type=raw,value=$nginx_full_version-alpine$alpine_minor_version-slim"
echo "type=raw,value=$nginx_major_version-alpine$alpine_minor_version-slim"
echo "type=raw,value=$nginx_minor_version-alpine$alpine_minor_version-slim"
echo "type=raw,value=alpine$alpine_minor_version-slim"
echo "type=raw,value=$nginx_branch-$variant"
echo "type=raw,value=$nginx_branch-alpine$alpine_minor_version-slim"
