# Fixture for the weekly security report (phase 118, D-08): an image that DECLARES a PHP
# version in its environment but ships no PHP at all, so the scanner finds no php package.
# The report must show this app as unknown, never as safe.
# The base is pinned by digest on purpose: a moving tag would change what the test sees.
FROM busybox@sha256:a7dbc319b1438115a207e11930dc4bb3e643dcb3ec0bdd694bb36cd8fad289ec

ENV PHP_VERSION=8.2.34

WORKDIR /www
COPY index.html /www/index.html

EXPOSE 8080
CMD ["httpd", "-f", "-v", "-p", "8080", "-h", "/www"]
