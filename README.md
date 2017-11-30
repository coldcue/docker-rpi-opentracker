# What is opentracker?
[opentracker](http://erdgeist.org/arts/software/opentracker/) is a open and free bittorrent tracker project. It aims for minimal resource usage and is intended to run at your wlan router. Currently it is deployed as an open and free tracker instance.

# Usage
```bash
docker run -itd \
  -p 6969:6969/udp \
  -p 6969:6969/tcp \
  --name opentracker \
  andrasszell/rpi-opentracker
```
This starts an opentracker docker container right away. 
You can check the status on `http://< the ip of your raspberry >:6969/stats`

# Contribute
This is an open-source project, check out the github repo: https://github.com/coldcue/docker-rpi-opentracker/
