# Fixture for the weekly security report (phase 118): an official php-fpm image with a
# known critical flaw in its PHP, plus nginx in front, both run by supervisord. This is
# the shape of the seed that started the phase: PHP compiled from source inside an
# official image, which a Trivy scan of the image reports clean.
# The base is pinned by digest on purpose: a moving tag would change what the test sees.
FROM php:8.2.34-fpm@sha256:a917845973544ae769db2a203b85a7a18a16fe4faa5e4962575a46728ec290f6

RUN apt-get update \
 && apt-get install -y --no-install-recommends nginx supervisor \
 && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/app.conf
COPY index.php /var/www/html/index.php

EXPOSE 8080
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
