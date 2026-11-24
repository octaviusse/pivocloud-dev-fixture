FROM nginx:alpine
RUN echo tokA1795506836 >/dev/null
RUN printf 'server {\n  listen 8080;\n  location / { return 200 "tokA1795506836"; }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
