ARG NGINX_VERSION="mainline"


FROM nginx:${NGINX_VERSION} AS builder

RUN mv /etc/nginx/mime.types /etc/nginx/mime.types.old \
  && mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.old \
  && mkdir /etc/nginx/custom.d \
  && mkdir /etc/nginx/conf.d/templates \
  && rm /etc/nginx/conf.d/default.conf

COPY h5bp/mime.types h5bp/nginx.conf /etc/nginx
COPY h5bp/conf.d/templates /etc/nginx/conf.d/templates
COPY h5bp/h5bp /etc/nginx/h5bp

### Allow an upstream to send caching headers.
RUN sed -i 's/epoch/off/' /etc/nginx/h5bp/web_performance/cache_expiration.conf


FROM nginx:${NGINX_VERSION}

RUN rm /etc/nginx/conf.d/default.conf
COPY --from=builder /etc/nginx /etc/nginx
