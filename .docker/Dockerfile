FROM alpine:3.15.4

RUN apk add thttpd


WORKDIR /etc/thttpd/
COPY ./.docker/conf/* ./

RUN adduser -D content

WORKDIR /home/content/
COPY . .

EXPOSE 80

RUN chown -R content:content .
RUN chmod -R 444 .
RUN find . -type d -print0 | xargs -0 -I {} chmod 445 "{}"


ENTRYPOINT [ "/usr/sbin/thttpd"]
CMD [ "-C",  "/etc/thttpd/thttpd.conf", "-D", "-l", "/dev/stderr"]

