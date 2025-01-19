## Description

An Ansible setup for my home Linux machine running Nobara, intended as a general purpose gaming machine and an API server specifically for ML tasks (my Hetzner VPS will receive all calls first and only redirect if ML tasks are needed since it runs 24/7). 

Run this after completing the initial "welcome" setup, which includes updating, setting up NVIDIA drivers, and installing other codecs.

Includes: 

- TODO

## Quick Start

```
./setup.sh
```

Then: 

- Login to 1Password (important, used for tokens/secrets)
- Setup KDE/GSConnect
- `gh auth login`

Next is to start DuckDNS, NGINX, and our app servers. 

However, we must first make sure that:

- An A/CNAME record has been created at DNS provider (mine is R53) pointing to DuckDNS. 
- Port forwarding rules are setup on the router for 80->80 and 443->443.

Finally:

```
./servers.sh
```

To summarize the full flow: 

1. Client --Request api.devinl.im--> AWS Route53
2. AWS Route53 --CNAME (da-nobara.duckdns.org)--> Client
3. Client --Request da-nobara.duckdns.org--> DuckDNS
4. DuckDNS --Machine public IP--> Client
5. Client --Request public IP:80/443--> Home router
6. Home router --Forward request--> Machine local IP
7. Machine's NGINX --Listen on 80/443--> Proxy request to localhost:8000
8. FastAPI/Uvicorn --Listen on 0.0.0.0:8000--> Process request and respond

## Ports

| Port  | App               |
| ----- | ----------------- |
| 8000  | FastAPI           |
| 9418  | Soft-Serve (git)  |
| 23231 | Soft-Serve (ssh)  |
| 23232 | Soft-Serve (http) |
