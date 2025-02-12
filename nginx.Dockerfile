FROM nginx:alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy SSL certificates
COPY ./certs /etc/nginx/certs

# Expose ports
EXPOSE 80
EXPOSE 443

# Debug connection before starting Nginx
CMD envsubst '$BACKEND_URL' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf && \
    nginx -g "daemon off;"
