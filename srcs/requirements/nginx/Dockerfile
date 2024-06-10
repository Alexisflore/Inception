FROM alpine:3.19

ARG USER

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
