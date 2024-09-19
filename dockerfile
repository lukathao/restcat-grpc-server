FROM golang:1.23.0

WORKDIR /app

COPY go.mod .
COPY generated/ .
COPY proto/ .
COPY types/ .

RUN go get
RUN protoc --go_out=generated/reservations --go_opt=paths=source_relative --go-grpc_out=generated/reservations --go-grpc_opt=paths=source_relative proto/reservations.proto
RUN go build -o bin .

ENTRYPOINT [ "/app/bin" ]