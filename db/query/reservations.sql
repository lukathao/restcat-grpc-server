-- name: CreateReservation :one
INSERT INTO reservations (
  business_id, guest_name, guests, dining_room, reservation_date, reservation_hours, paid
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
)
RETURNING *;
