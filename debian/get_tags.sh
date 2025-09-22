#!/bin/sh
# Usage: ./get_tags.sh $image_name $nginx_branch
nginx_branch=$2
debian_codename=$(docker run --rm $1 cat /etc/os-release | grep VERSION_CODENAME | cut -d'=' -f2)
nginx_full_version=$(docker run --rm $1 sh -c 'echo $NGINX_VERSION')
nginx_major_version=${nginx_full_version%%.*}
nginx_minor_version=${nginx_full_version%.*}

echo "type=raw,value=$nginx_full_version"
echo "type=raw,value=$nginx_minor_version"
echo "type=raw,value=$nginx_full_version-$debian_codename"
echo "type=raw,value=$nginx_minor_version-$debian_codename"
echo "type=raw,value=$nginx_branch"
echo "type=raw,value=$nginx_branch-$debian_codename"
if [ "$nginx_branch" = "mainline" ]; then
  echo "type=raw,value=latest"
  echo "type=raw,value=$nginx_major_version"
  echo "type=raw,value=$nginx_major_version-$debian_codename"
  echo "type=raw,value=$debian_codename"
fi
