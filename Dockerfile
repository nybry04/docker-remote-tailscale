FROM alpine:latest

RUN apk add --no-cache tailscale socat

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV TAILSCALE_AUTHKEY=tskey-auth-

ENTRYPOINT ["/start.sh"]
