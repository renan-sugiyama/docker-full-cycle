FROM golang:1.18 AS builder

WORKDIR /go/app

COPY *.go ./

RUN go mod init example/hello

RUN go build

FROM scratch
WORKDIR /app
COPY --from=builder /go/app /app

RUN [ "./hello" ]
