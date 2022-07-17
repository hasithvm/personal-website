FROM alpine:3.15.4

RUN apk add thttpd


WORKDIR /etc/thttpd/
COPY ./.docker/conf/* ./

RUN adduser -D content

WORKDIR /home/content/
COPY . .

# delete docker build content from home folder

RUN rm -rf .docker
EXPOSE 80

RUN chown -R content:content .
RUN chmod -R 444 .
RUN find . -type d -print0 | xargs -0 -I {} chmod 555 "{}"


ENTRYPOINT [ "/usr/sbin/thttpd"]
CMD [ "-C",  "/etc/thttpd/thttpd.conf", "-D", "-l", "/dev/stderr"]

