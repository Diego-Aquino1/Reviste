CREATE TABLE "user" (
    "username" VARCHAR(50) PRIMARY KEY,
    "password" VARCHAR(255),
    "register_date" TIMESTAMP,
    "role" VARCHAR(1) CHECK ("role" IN ('V', 'C'))
);

CREATE TABLE "store" (
    "ruc" VARCHAR(11) PRIMARY KEY,
    "name" VARCHAR(100),
    "register_date" TIMESTAMP,
    "logo_path" VARCHAR(255),
    "user_fk" VARCHAR(50) REFERENCES "user"("username")
);

CREATE TABLE "client" (
    "dni" VARCHAR(100) PRIMARY KEY,
    "name" VARCHAR(100),
    "sur_name" VARCHAR(100),
    "email" VARCHAR(100),
    "phone_number" VARCHAR(100),
    "register_date" TIMESTAMP,
    "user_fk" VARCHAR(50) REFERENCES "user"("username")
);

CREATE TABLE "person_type" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) UNIQUE
);

CREATE TABLE "product_type" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) UNIQUE
);

CREATE TABLE "category" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    "description" TEXT,
    "person_type_fk" INTEGER REFERENCES "person_type"("id"),
    "product_type_fk" INTEGER REFERENCES "product_type"("id")
);

CREATE TABLE "product" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    "description" TEXT,
    "original_price" FLOAT,
    "liquidation_price" FLOAT,
    "front_view_path" VARCHAR(255),
    "back_view_path" VARCHAR(255),
    "register_date" TIMESTAMP,
    "state" VARCHAR(1),
    "category_fk" INTEGER REFERENCES "category"("id")
);

CREATE TABLE "warehouse" (
    "id" SERIAL PRIMARY KEY,
    "amount" INT,
    "last_amount" INT,
    "product_fk" INTEGER REFERENCES "product"("id"),
    "store_fk" VARCHAR(11) REFERENCES "store"("ruc")
);

CREATE TABLE "shopping_cart" (
    "id" SERIAL PRIMARY KEY,
    "user_fk" VARCHAR(50) REFERENCES "user"("username"),
    "register_date" TIMESTAMP,
    "state" VARCHAR(1)
);

CREATE TABLE "shopping_cart_details" (
    "id" SERIAL PRIMARY KEY,
    "amount" INT,
    "unit_price" FLOAT,
    "total_price" FLOAT,
    "register_date" TIMESTAMP,
    "product_fk" INTEGER REFERENCES "product"("id"),
    "shopping_cart_fk" INTEGER REFERENCES "shopping_cart"("id")
);
