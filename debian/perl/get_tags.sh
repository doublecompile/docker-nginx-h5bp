#!/bin/sh
# Usage: ./get_tags.sh $image_name $nginx_branch
set -e
nginx_branch=$2
platform=${IMAGE_PLATFORM:-linux/amd64}
variant="perl"
debian_codename=$(docker run --platform $platform --rm $1 cat /etc/os-release | grep VERSION_CODENAME | cut -d'=' -f2)
nginx_full_version=$(docker run --platform $platform --rm $1 sh -c 'echo $NGINX_VERSION')
nginx_major_version=${nginx_full_version%%.*}
nginx_minor_version=${nginx_full_version%.*}

echo "type=raw,value=$nginx_full_version-$variant"
echo "type=raw,value=$nginx_minor_version-$variant"
echo "type=raw,value=$nginx_full_version-$debian_codename-$variant"
echo "type=raw,value=$nginx_minor_version-$debian_codename-$variant"
echo "type=raw,value=$nginx_branch-$variant"
echo "type=raw,value=$nginx_branch-$debian_codename-$variant"
if [ "$nginx_branch" = "mainline" ]; then
  echo "type=raw,value=$nginx_major_version-$variant"
  echo "type=raw,value=$nginx_major_version-$debian_codename-$variant"
  echo "type=raw,value=$debian_codename-$variant"
  echo "type=raw,value=$variant"
fi
