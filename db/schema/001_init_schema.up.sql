CREATE TABLE "business" (
  "business_id" serial PRIMARY KEY,
  "business_name" varchar(100),
  "business_owner" varchar(100),
  "address_street" varchar(100),
  "address_city" varchar(100),
  "address_state" varchar(100),
  "address_zipcode" varchar(10),
  "business_hours" integer[],
  "business_days" integer[],
  "seating" int,
  "business_type" varchar(50),
  "is_active" boolean,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "reservations" (
  "reservations_id" serial PRIMARY KEY,
  "business_id" int,
  "guest_name" varchar(100),
  "reservation_date" varchar(100),
  "reservation_hours" smallint,
  "guests" smallint,
  "dining_room" boolean,
  "paid" boolean,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "menu" (
  "menu_id" serial PRIMARY KEY,
  "business_id" int,
  "item_name" varchar(100),
  "item_description" varchar(255),
  "price" decimal,
  "image_url" varchar(4000),
  "is_active" boolean,
  "created_at" timestamp,
  "updated_at" timestamp
);

ALTER TABLE "reservations" ADD FOREIGN KEY ("business_id") REFERENCES "business" ("business_id");

ALTER TABLE "menu" ADD FOREIGN KEY ("business_id") REFERENCES "business" ("business_id");
