# Build stage — not strictly needed for a pure HTML site,
# but gives a clean, reproducible copy of only the files we want.
FROM nginx:1.27-alpine AS production

# Remove the default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy site files
COPY index.html /usr/share/nginx/html/index.html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
