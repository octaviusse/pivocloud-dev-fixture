FROM nginx:alpine
RUN printf 'server {\n  listen 8080;\n  location / { return 200 "tok329b1795701637"; }\n}\n' > /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]