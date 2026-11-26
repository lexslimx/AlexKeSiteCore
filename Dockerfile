FROM nginx:stable-alpine

COPY index.html /usr/share/nginx/html/index.html
COPY favicon.ico /usr/share/nginx/html/favicon.ico
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80
