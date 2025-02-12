FROM nginx:alpine

# Remove default Nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for incoming traffic
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
