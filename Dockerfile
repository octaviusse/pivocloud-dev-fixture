FROM nginx:alpine
RUN echo tokD1795506886 >/dev/null && sleep 30
RUN printf 'server {\n  listen 8080;\n  location / { return 200 "tokD1795506886"; }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
