FROM alpine:3.15.4

RUN apk add thttpd


WORKDIR /etc/thttpd/
COPY ./.docker/conf/* ./

RUN adduser -D content
USER content
WORKDIR /home/content/

COPY . .
RUN chown -R content .
RUN chmod -R 0444 .

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/thttpd"]
CMD [ "-C",  "/etc/thttpd/thttpd.conf", "-D", "-l", "/dev/null"]

