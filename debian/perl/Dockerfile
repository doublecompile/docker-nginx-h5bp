ARG NGINX_VERSION="mainline"

FROM nginx:${NGINX_VERSION}-perl

RUN mv /etc/nginx /etc/nginx-previous
COPY h5bp /etc/nginx
