FROM alpine:3.15.4

RUN apk add thttpd

RUN adduser -D content
USER content
WORKDIR /home/content/

COPY . .

ENTRYPOINT [ "service thttpd start && tail -f /dev/null"]

