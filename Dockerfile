FROM nginx:alpine
RUN echo tokC1795506867 >/dev/null && sleep 90
RUN printf 'server {\n  listen 8080;\n  location / { return 200 "tokC1795506867"; }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
