FROM alpine:3.20 AS downloader

ARG TARGETARCH
ARG FAKE_SERVICE_VERSION=v0.26.2

RUN apk add --no-cache ca-certificates curl unzip \
    && case "${TARGETARCH}" in \
         amd64) asset="fake_service_linux_amd64.zip" ;; \
         arm64) asset="fake_service_linux_arm64.zip" ;; \
         *) echo "Unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
       esac \
    && curl -fsSL -o /tmp/fake-service.zip "https://github.com/nicholasjackson/fake-service/releases/download/${FAKE_SERVICE_VERSION}/${asset}" \
    && unzip -q /tmp/fake-service.zip -d /out \
    && chmod +x /out/fake-service

FROM alpine:3.20

RUN apk add --no-cache ca-certificates
WORKDIR /app
COPY --from=downloader /out/fake-service /app/fake-service

ENTRYPOINT ["/app/fake-service"]