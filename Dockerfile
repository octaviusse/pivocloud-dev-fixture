# Deliberately classic Dockerfile syntax — no BuildKit-only features.
#
# PivoCloud's worker builds with the legacy Docker builder (it passes
# DOCKER_BUILDKIT as a build ARG, which does nothing; see the PivoCloud
# broken-windows ledger, window #6). Any `RUN --mount=...` here would fail to
# deploy. Keep this file boring on purpose: its whole job is to always build.
FROM node:20-alpine
WORKDIR /app
COPY server.js .
EXPOSE 3000
CMD ["node", "server.js"]
