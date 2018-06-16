FROM alpine:3.6

RUN apk add --no-cache nginx-mod-http-lua

# Create folder for PID file
RUN mkdir -p /run/nginx

# Add our nginx conf
COPY ./lua.conf /etc/nginx/conf.d/lua.conf
RUN rm /usr/share/nginx/html/index.html
COPY ./index.html /usr/share/nginx/html/index.html

CMD ["nginx"]
