# Deliberately classic Dockerfile syntax — no BuildKit-only features.
#
# Sibling of api/Dockerfile. `COPY server.js .` resolves against the BUILD
# CONTEXT, which for this app is the `web/` subdirectory, so a root_directory
# of `web` is what makes this line find web/server.js.
FROM node:20-alpine
WORKDIR /app
COPY server.js .
EXPOSE 3002
CMD ["node", "server.js"]
