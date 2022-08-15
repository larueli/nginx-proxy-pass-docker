FROM nginx:1.23-alpine

COPY default.conf /etc/nginx/conf.d/default.conf

ADD start.sh /start.sh
RUN chmod +x /start.sh && chmod -R g+rwx /var/run && chmod -R g+rwx /var/log && chmod -R g+rwx /var/cache && \
    sed -i 's/user  nginx;/user nobody;/g' /etc/nginx/nginx.conf && chmod -R g+rwx /etc/nginx/conf.d

EXPOSE 8080

USER 6542

CMD ["./start.sh"]
