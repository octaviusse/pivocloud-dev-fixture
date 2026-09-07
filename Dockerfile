# Phase 202 timing fixture — a build that reliably exceeds a shortened budget
# while its EARLY layers stay cacheable.
#
# Three SEPARATE slow layers, not one. With a 90s DEPLOYMENT_TIMEOUT on the dev
# worker: attempt 1 finishes layer A, caches it, and dies inside layer B;
# attempt 2 reuses A from cache, finishes B, and dies inside C; attempt 3 reuses
# A and B and completes. That is the "gets further each time" behaviour the
# timeout message promises, made observable.
#
# A single `RUN sleep 180` does NOT work: the first attempt dies inside it, the
# layer is never committed, and every later attempt repeats the whole thing —
# no speedup, and a false negative on the claim under test.
#
# Do not set DOCKER_BUILDKIT=0 when building this. BuildKit's per-layer cache
# surviving a cancelled build is the behaviour being measured.
FROM node:20-alpine
WORKDIR /app

RUN echo "layer A start" && sleep 60 && echo "layer A done"
RUN echo "layer B start" && sleep 60 && echo "layer B done"
RUN echo "layer C start" && sleep 60 && echo "layer C done"

COPY server.js .
EXPOSE 3000
CMD ["node", "server.js"]
