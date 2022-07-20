FROM alpine:3.15.4

RUN apk add lighttpd

WORKDIR /etc/lighttpd/
COPY ./.docker/conf/lighttpd.conf ./

RUN adduser -D content

WORKDIR /home/content/
COPY . .

# delete docker build content from home folder

RUN rm -rf .docker
EXPOSE 80

RUN chown -R content:content .
RUN chmod -R 444 .
RUN find . -type d -print0 | xargs -0 -I {} chmod 555 "{}"


ENTRYPOINT [ "/usr/sbin/lighttpd"]
CMD [ "-f",  "/etc/lighttpd/lighttpd.conf", "-D"]

