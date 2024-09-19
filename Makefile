gen_res:
	protoc --go_out=generated/reservations --go_opt=paths=source_relative --go-grpc_out=generated/reservations --go-grpc_opt=paths=source_relative proto/reservations.proto

build:
	docker build . -t restcat-grpc-server:latest

run:
	docker run -e PORT=9000 -p 9000:9000 restcat-grpc-server:latest