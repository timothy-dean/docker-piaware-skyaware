FROM alpine:3.12 AS builder

RUN apk add --no-cache \
    git && \
    git clone -b v4.0 https://github.com/flightaware/dump1090.git /tmp/dump1090 

FROM nginx:latest

COPY --from=builder /tmp/dump1090/public_html /usr/share/nginx/html