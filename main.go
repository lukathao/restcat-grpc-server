package main

import (
	"log"
	"net"

	reservations "github.com/lukathao/restcat-grpc-server/generated/reservations/proto"
	"github.com/lukathao/restcat-grpc-server/types"
	"google.golang.org/grpc"
)

func main() {
	lis, err := net.Listen("tcp", ":9000")
	if err != nil {
		log.Fatalf("Cannot create listener: %s", err)
	}
	serverRegistrar := grpc.NewServer()

	service := &types.ReservationServer{}
	reservations.RegisterReservationApiServer(serverRegistrar, service)

	serverRegistrar.Serve(lis)
}
