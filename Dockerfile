FROM alpine:latest as builder
WORKDIR /build

# Install build dependencies
RUN apk add --no-cache alpine-sdk git cvs zlib-dev

# Pull and install libowfat
RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat
RUN cd libowfat && make

# Clone and install opentracker
RUN git clone git://erdgeist.org/opentracker
RUN cd opentracker && make

FROM alpine:latest

COPY --from=builder /build/opentracker/opentracker /bin/

EXPOSE 6969/udp
EXPOSE 6969/tcp

CMD ["opentracker"]
