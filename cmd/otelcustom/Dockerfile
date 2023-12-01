#FROM alpine:latest as prep
#RUN apk --update add ca-certificates
#
#RUN mkdir -p /tmp
#
##FROM scratch
#
#ARG USER_UID=10001
#USER ${USER_UID}
#
##COPY --from=prep /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
#COPY otelcustom /
#EXPOSE 4317 55680 55679
#ENTRYPOINT ["/otelcustom"]
#CMD ["--config", "/etc/otel/config.yaml"]

FROM golang:1.21.4-alpine AS builder
LABEL stage=gobuilder
ENV CGO_ENABLED 0
ENV GOOS linux
ENV GOARCH=amd64
RUN apk update --no-cache && apk add --no-cache tzdata
WORKDIR /build
ADD go.mod .
ADD go.sum .
RUN go mod download
COPY . .
RUN go build -ldflags="-s -w" -o /app/otelcustom
FROM alpine
RUN apk update --no-cache && apk add --no-cache ca-certificates
WORKDIR /app
COPY --from=builder /app/otelcustom /app/otelcustom
EXPOSE 4317 55680 55679
ENTRYPOINT ["/app/otelcustom"]
CMD ["--config", "/etc/otel/config.yaml"]

