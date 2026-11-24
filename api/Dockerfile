# Deliberately classic Dockerfile syntax — no BuildKit-only features.
#
# PivoCloud's worker builds with the legacy Docker builder, so any
# `RUN --mount=...` here would fail to deploy. Keep this file boring on
# purpose: its whole job is to always build.
#
# `COPY server.js .` resolves against the BUILD CONTEXT, which for this app is
# the `api/` subdirectory rather than the repository root. That is the whole
# point of the fixture: a root_directory of `api` is what makes this line find
# api/server.js instead of failing.
FROM node:20-alpine
WORKDIR /app
COPY server.js .
EXPOSE 3001
CMD ["node", "server.js"]
