FROM nginx:1.17-alpine

COPY public /usr/share/nginx/html

EXPOSE 

CMD ["nginx", "-g", "daemon off;"]