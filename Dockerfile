#FROM nginx:1.17-alpine

COPY public /usr/share/nginx/html

EXPOSE 80

COPY

CMD ["nginx", "-g", "daemon off;"]