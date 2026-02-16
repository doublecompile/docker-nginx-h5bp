# Nginx + H5BP Server Configs

[![Docker Pulls](https://img.shields.io/docker/pulls/doublecompile/nginx-h5bp?logo=docker&logoColor=white)](https://hub.docker.com/r/doublecompile/nginx-h5bp) [![Release Status](https://github.com/doublecompile/docker-nginx-h5bp/actions/workflows/release.yaml/badge.svg)](https://github.com/doublecompile/docker-nginx-h5bp/actions/workflows/release.yaml)

A container image based on [Nginx](https://hub.docker.com/_/nginx) that also includes the [H5BP Server Configs project](https://github.com/h5bp/server-configs-nginx).

> **Nginx** (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other \*nix flavors. It also has a proof of concept port for Microsoft Windows.

> **Nginx Server Configs** is a collection of configuration files that can help your server improve the website's performance and security, while also ensuring that resources are served with the correct content-type and are accessible, if needed, even cross-domain.

## Versions and Tags Available

We build the `stable` and `mainline` branches of Nginx as well as all variants. We install version 5.0.1 of the H5BP Server Configs. You can use any version tag that works for Nginx. Here are a few examples:

- 1.29-bookworm
- stable-alpine
- 1-alpine-otel
- 1.29.1-alpine3.22-slim
- mainline-alpine-perl
- bookworm-perl

Supported Architectures: `linux/amd64` and `linux/arm64`.
