# Nginx + H5BP Server Configs

[![Docker Pulls](https://img.shields.io/docker/pulls/doublecompile/nginx-h5bp?logo=docker&logoColor=white)](https://hub.docker.com/r/doublecompile/nginx-h5bp) [![Release Status](https://github.com/doublecompile/docker-nginx-h5bp/actions/workflows/release.yaml/badge.svg)](https://github.com/doublecompile/docker-nginx-h5bp/actions/workflows/release.yaml)

A container image based on [Nginx](https://hub.docker.com/_/nginx):

> **Nginx** (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other \*nix flavors. It also has a proof of concept port for Microsoft Windows.

…that also includes the [H5BP Server Configs project](https://github.com/h5bp/server-configs-nginx):

> **Nginx Server Configs** is a collection of configuration files that can help your server improve the website's performance and security, while also ensuring that resources are served with the correct content-type and are accessible, if needed, even cross-domain.

At this time, all images contain version 5.0.1 of the H5BP Server Configs.

## Versions and Tags Available

We create images for both branches of Nginx (i.e. `stable` and `mainline`) as well as all variants:

- alpine
- alpine/otel
- alpine/perl
- alpine/slim
- debian
- debian/otel
- debian/perl

You can use any version tag that works for the `nginx` image itself. Here are a few examples:

- 1.29-trixie
- stable-alpine
- 1-alpine-otel
- 1.29.1-alpine3.22-slim
- mainline-alpine-perl
- bookworm-perl

Supported Architectures: `linux/amd64` and `linux/arm64`.

## Configuration

Add your site configuration in `/etc/nginx/conf.d`. You can use the files in `/etc/nginx/conf.d/templates` as examples.

The H5BP Server Configs project ships with configuration for the default server to turn away requests for unknown hosts. If you'd like to use this behavior, delete the `default.conf` file and then remove the leading dot in the filename for both `.default.conf` and `.no-ssl.default.conf`.

### TLS

The `h5bp/tls/certificate_files.conf` configuration file assumes your TLS certificates are located at `/etc/nginx/certs/default.crt` and `/etc/nginx/certs/default.key`. You can mount your certificates in this location. On Debian, you can leverage the "Snakeoil" certificates if untrusted certificates are acceptable.

```
apt-get update \
&& apt-get install -y --no-install-recommends ssl-cert \
&& mkdir -p /etc/nginx/certs \
&& ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/nginx/certs/default.crt \
&& ln -s /etc/ssl/private/ssl-cert-snakeoil.key /etc/nginx/certs/default.key
```
