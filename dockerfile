# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Remove the default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy your local static files into Nginx's web root
COPY . /usr/share/nginx/html

# Expose HTTP port 80
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]