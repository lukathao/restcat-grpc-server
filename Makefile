gen_res:
	protoc --go_out=generated/reservations --go_opt=paths=source_relative --go-grpc_out=generated/reservations --go-grpc_opt=paths=source_relative proto/reservations.proto

