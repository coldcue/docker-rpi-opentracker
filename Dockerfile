FROM alpine:latest as builder
WORKDIR /build

# Install build dependencies
RUN apk add --no-cache alpine-sdk git zlib-dev

# Pull and install libowfat
RUN git clone https://github.com/masroore/libowfat.git
RUN cd libowfat && make

# Clone and install opentracker
RUN git clone git://erdgeist.org/opentracker
RUN cd opentracker && make

FROM alpine:latest

COPY --from=builder /build/opentracker/opentracker /bin/
RUN apk add --no-cache curl

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -sf http://localhost:6969/stats || exit 1

EXPOSE 6969/udp
EXPOSE 6969/tcp

CMD ["opentracker"]
