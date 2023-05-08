ARG ALPINE_VERSION=latest
FROM alpine:$ALPINE_VERSION
RUN apk --no-cache add dnsmasq

COPY healthcheck.sh /
RUN chmod +x /healthcheck.sh

EXPOSE 53 53/udp 67/udp

HEALTHCHECK --interval=10s --timeout=3s CMD /healthcheck.sh

ENTRYPOINT ["dnsmasq"]
CMD ["-k", "--log-facility=-"]
