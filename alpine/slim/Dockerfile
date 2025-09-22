ARG NGINX_VERSION="mainline"

FROM nginx:${NGINX_VERSION}-alpine-slim

RUN mv /etc/nginx /etc/nginx-previous
COPY h5bp /etc/nginx
