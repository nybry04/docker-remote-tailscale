#!/bin/sh

tailscaled --tun=userspace-networking &
tailscale up --authkey=${TAILSCALE_AUTHKEY}

tailscale serve --bg --tcp 2375 tcp://localhost:2375
socat TCP-LISTEN:2375,reuseaddr,fork UNIX-CLIENT:/var/run/docker.sock
