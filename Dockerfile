FROM golang:1.12.7-alpine3.10 as builder
RUN apk add --update git && go get github.com/Shinzu/mtr_exporter

FROM alpine:3.10
COPY --from=builder /go/bin/mtr_exporter .
RUN apk add --no-cache --update mtr
EXPOSE 9116
ENTRYPOINT ./mtr_exporter --config.file /srv/mtr.yaml