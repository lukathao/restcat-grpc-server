FROM golang:alpine AS builder

RUN apk --update add ca-certificates git

WORKDIR /app

COPY . .

RUN go mod download
RUN protoc --go_out=generated/reservations --go_opt=paths=source_relative --go-grpc_out=generated/reservations --go-grpc_opt=paths=source_relative proto/reservations.proto
RUN go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .

CMD ["/app/main"] 