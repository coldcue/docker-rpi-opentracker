FROM resin/rpi-raspbian

COPY opentracker/opentracker /bin/
#COPY opentracker.conf /conf

EXPOSE 6969/udp
EXPOSE 6969/tcp

CMD ["opentracker"]
