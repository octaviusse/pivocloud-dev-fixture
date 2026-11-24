FROM nginx:alpine
RUN echo tokB1795506850 >/dev/null
RUN printf 'server {\n  listen 8080;\n  location / { return 200 "tokB1795506850"; }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
