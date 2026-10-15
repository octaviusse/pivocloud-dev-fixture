# Branch symlinks-312-1: a repository that commits symlinks (PivoCloud phase 312.1).
# The build must keep every link as a link and never copy anything from
# outside the repository. The RUN step fails the build if a link was
# dereferenced or dropped, or if .git was shipped despite .dockerignore.
FROM node:20-alpine
WORKDIR /ctx
COPY . /ctx
RUN test "$(readlink /ctx/filelink)" = "server.js" \
 && test "$(readlink /ctx/dirlink)" = "web" \
 && test "$(readlink /ctx/abs_out)" = "/etc/hostname" \
 && test "$(readlink /ctx/rel_out)" = "../outside" \
 && test ! -e /ctx/.git \
 && echo "symlinks-312-1: all four links arrived as links, .git ignored"
WORKDIR /app
COPY server.js .
EXPOSE 3000
CMD ["node", "server.js"]
