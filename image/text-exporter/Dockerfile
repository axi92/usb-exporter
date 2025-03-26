FROM golang:latest AS builder

WORKDIR /app
RUN git clone https://github.com/IBM/textfile-exporter.git
WORKDIR /app/textfile-exporter
RUN git checkout 50bfdaac9fe04f62429fed2fd65c90bc68c8d787
RUN go build -o textfile_exporter .

FROM ubuntu:24.04
EXPOSE 9014
WORKDIR /app
RUN apt update && apt install jq usbutils curl -y
COPY --from=builder /app/textfile-exporter/textfile_exporter /usr/bin/textfile_exporter
HEALTHCHECK CMD curl --fail http://localhost:9014/alive || exit 1