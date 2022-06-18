FROM alpine:3.15.4

RUN apk add thttpd


WORKDIR /etc/thttpd/
COPY ./.docker/conf/* ./

RUN adduser -D content
USER content
WORKDIR /home/content/

COPY . .

ENTRYPOINT [ "/usr/sbin/thttpd -C /etc/thttpd/thttpd.conf -D"]

