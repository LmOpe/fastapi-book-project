FROM nginx:alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy SSL certificates and Nginx configuration
COPY ./certs /etc/nginx/certs
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN pip install -r requirements.txt

# Expose port 80 and 443 for incoming traffic
EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
