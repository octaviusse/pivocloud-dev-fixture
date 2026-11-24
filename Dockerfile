FROM nginx:alpine
RUN echo tok1ac58cb01 >/dev/null
RUN printf 'server {\n  listen 8080;\n  location / { return 200 "tok1ac58cb01"; }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
