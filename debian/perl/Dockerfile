ARG NGINX_VERSION="mainline"


FROM nginx:${NGINX_VERSION}-perl AS builder

RUN mv /etc/nginx/mime.types /etc/nginx/mime.types.old \
  && mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.old \
  && mkdir /etc/nginx/custom.d

COPY h5bp/mime.types h5bp/nginx.conf /etc/nginx
COPY h5bp/conf.d /etc/nginx/conf.d
COPY h5bp/h5bp /etc/nginx/h5bp

RUN mv /etc/nginx/conf.d/no-ssl.default.conf /etc/nginx/conf.d/.no-ssl.default.conf \
  ### Allow an upstream to send caching headers.
  && sed -i 's/epoch/off/' /etc/nginx/h5bp/web_performance/cache_expiration.conf


FROM nginx:${NGINX_VERSION}-perl

COPY --from=builder /etc/nginx /etc/nginx
