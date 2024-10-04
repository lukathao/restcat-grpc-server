-- name: CreateMenuItem :one
INSERT INTO menu (
  business_id, item_name, item_description, price, image_url
) VALUES (
  $1, $2, $3, $4, $5
)
RETURNING *;
