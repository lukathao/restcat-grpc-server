-- name: CreateBusiness :one
INSERT INTO business (
  business_name, business_owner, address_street, address_city, address_state, address_zipcode, business_days, business_hours, seating, business_type, is_active, created_at, updated_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, true, NOW(), NULL
)
RETURNING *;

-- name: GetBusiness :one
SELECT * FROM busines
WHERE business_id = $1 
AND is_active = true
LIMIT 1;

-- name: GetAllBusinesses :many
SELECT business_name, address_street 
FROM business
WHERE is_active = true
ORDER BY business_name;

-- name: UpdateBusinessOperations :exec
UPDATE operations
SET address_street = $2, address_city = $3, address_state = $4, address_zipcode = $5, business_days = $6, business_hours = $7, seating = $8, business_type = $9, updated_at = NOW()
WHERE business_id = $1;

-- name: UpdateBusiness :exec
UPDATE business
SET business_name, business_owner, updated_at

-- name: DeactivateBusiness :exec
UPDATE business
SET is_active = false
WHERE business_id = $1;