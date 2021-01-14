FROM amd64/alpine as builder

WORKDIR /build

# Install build dependencies
RUN apk add --no-cache alpine-sdk git cvs zlib-dev

# Pull and install libowfat
RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat
RUN cd libowfat && make

# Clone and install opentracker
RUN git clone git://erdgeist.org/opentracker
RUN cd opentracker && make

FROM amd64/alpine

COPY --from=builder /build/opentracker/opentracker /bin/
RUN apk add --no-cache curl

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -sf http://localhost:6969/stats || exit 1

EXPOSE 6969/udp
EXPOSE 6969/tcp

CMD ["opentracker"]
