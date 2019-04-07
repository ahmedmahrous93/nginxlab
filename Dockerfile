FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
ARG userid
RUN chown -R $userid:root /var/cache/nginx && \
  mkdir -p /var/www/ahmed && \
  touch /var/www/ahmed/index.html && \
  echo "Hello ahmed" > /var/www/ahmed/index.html && \
  touch /var/run/nginx.pid && \
  chown -R $userid:root /var/run/nginx.pid
USER $userid
VOLUME /var/www/ahmed
EXPOSE 8080
CMD ["/bin/bash", "-c", "sudo nginx -g 'daemon off"]
