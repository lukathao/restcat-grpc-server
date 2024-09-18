package types

import (
	"context"

	reservations "github.com/lukathao/restcat-grpc-server/generated/reservations/proto"
)

type ReservationServer struct {
	reservations.UnimplementedReservationApiServer
}

func (server ReservationServer) Create(ctx context.Context, req *reservations.CreateReservationRequest) (*reservations.CreateReservationResponse, error) {
	// TODO save request to DB here
	return &reservations.CreateReservationResponse{
		Code:    []byte("201"),
		Message: []byte(req.ReservationName),
	}, nil
}
