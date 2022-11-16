FROM --platform=${BUILDPLATFORM:-linux/amd64} tonistiigi/xx:golang AS xgo
FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.19-alpine as builder

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

COPY --from=xgo / /
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

ARG CLOUDFLARED_VERSION

RUN apk --update --no-cache add \
    bash \
    build-base \
    gcc \
    git \
  && rm -rf /tmp/* /var/cache/apk/*

RUN git clone --branch ${CLOUDFLARED_VERSION} https://github.com/cloudflare/cloudflared /go/src/github.com/cloudflare/cloudflared
WORKDIR /go/src/github.com/cloudflare/cloudflared
RUN go build -v -mod vendor -ldflags "-w -s -X 'main.Version=${CLOUDFLARED_VERSION}' -X 'main.BuildTime=${BUILD_DATE}'" github.com/cloudflare/cloudflared/cmd/cloudflared

FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="buildsociety" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.url="https://github.com/buildsociety/cloudflared" \
  org.opencontainers.image.source="https://github.com/buildsociety/cloudflared" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.vendor="buildsociety" \
  org.opencontainers.image.title="cloudflared" \
  org.opencontainers.image.description="cloudflared is the client side component of Argo Tunnel by Cloudflare" \
  org.opencontainers.image.licenses="MIT"

RUN apk --update --no-cache add \
    bind-tools \
    ca-certificates \
    dumb-init \
    libressl \
    shadow \
    tzdata \
  && addgroup -g 1000 cloudflared \
  && adduser -u 1000 -G cloudflared -s /sbin/nologin -D cloudflared \
  && rm -rf /tmp/* /var/cache/apk/*

COPY --from=builder /go/src/github.com/cloudflare/cloudflared/cloudflared /usr/local/bin/cloudflared
RUN cloudflared --version

USER cloudflared

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/usr/local/bin/cloudflared", "--no-autoupdate" ]
