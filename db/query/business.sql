-- name: CreateBusiness :one
INSERT INTO business (
  business_name, business_owner, address_street, address_city, address_state, address_zipcode, business_days, business_hours, seating, business_type, is_active, created_at, updated_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13
)
RETURNING *;

-- name: GetBusiness :one
SELECT * FROM business
WHERE business_id = $1 LIMIT 1;

-- name: GetAllBusinesses :many
SELECT * FROM business
ORDER BY business_name;

-- name: UpdateBusinessOperations :exec
UPDATE business
SET address_street = $2, address_city = $3, address_state = $4, address_zipcode = $5, business_days = $6, business_hours = $7, seating = $8, business_type = $9, updated_at = $10
WHERE business_id = $1;

-- name: DeactivateBusiness :exec
UPDATE business
SET is_active = false
WHERE business_id = $1;