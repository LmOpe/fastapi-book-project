FROM nginx:alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./certs /etc/nginx/certs

EXPOSE 80
EXPOSE 443

CMD envsubst '$BACKEND_URL' < /etc/nginx/nginx.conf > /etc/nginx/conf.d/default.conf && \
    nginx -g "daemon off;"
