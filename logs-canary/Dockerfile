# Deliberately classic Dockerfile syntax, like the rest of this repository.
#
# PivoCloud dev fixture for phase 503 (an agent reads an app's recent logs with the
# app's secrets blanked). The RUN step prints a DUMMY planted value while the image
# builds; server.js prints it again, with its encodings, while the app runs.
#
# Deploy this directory as an app with root directory `logs-canary`, then set the
# environment variable PLANTED_CANARY to the dummy value below (it is not a real
# credential, it is committed here on purpose). An agent reading the app's build and
# runtime logs through PivoCloud must see the blanking mark where the value was.
FROM node:20-alpine
WORKDIR /app
RUN echo "build-canary pc503-dummy-canary-value-0001"
COPY server.js .
EXPOSE 3002
CMD ["node", "server.js"]
