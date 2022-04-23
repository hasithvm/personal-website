FROM alpine:3.15.4

RUN apk add thttpd

RUN adduser -D content
USER content
WORKDIR /home/content/

COPY . .


CMD ["thttpd", "-D", "-h 0.0.0.0 -p 9000 -d /home/content -u content"]
