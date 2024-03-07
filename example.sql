CREATE TABLE "geo_district" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "code" varchar(20),
  "province_fk" int
);

CREATE TABLE "geo_province" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "code" varchar(20),
  "department_fk" int
);

CREATE TABLE "geo_department" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "code" varchar(20)
);

CREATE TABLE "store" (
  "ruc" varchar(11) PRIMARY KEY,
  "name" varchar(50),
  "logo" varchar(100),
  "register_date" timestamp,
  "address" varchar,
  "email" varchar,
  "phone_number" varchar,
  "state" varchar(1),
  "district_fk" int
);

CREATE TABLE "wh_warehouse"(
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "store_fk" varchar
);

CREATE TABLE "wh_space"(
  "id" SERIAL PRIMARY KEY,
  "capacity" int,
  "warehouse_fk" int
);

CREATE TABLE "wh_maximum_stock"(
  "id" SERIAL PRIMARY KEY,
  "maximum_stock" int,
  "category_fk" int,
  "space_fk" int
);

CREATE TABLE "pro_category"(
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "register_date" timestamp,
  "state" varchar(1),
  "store_fk" varchar
);

CREATE TABLE "wh_kardex_main"(
  "id" SERIAL PRIMARY KEY,
  "stock" int,
  "variation" int,
  "origin" varchar(1),
  "register_date" timestamp,
  "voucher_id" int,
  "tag" varchar(2),
  "product_fk" varchar,
  "category_fk" int,
  "warehouse_fk" int
);

CREATE TABLE "wh_kardex_general"(
  "id" SERIAL PRIMARY KEY,
  "stock" int,
  "variation" int,
  "origin" varchar(1),
  "register_date" timestamp,
  "product_fk" varchar,
  "category_fk" int,
  "warehouse_fk" int,
  "voucher_fk" int
);

CREATE TABLE "pro_product" (
  "code" varchar(5) PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "register_date" timestamp,
  "expiration_date" timestamp,
  "image" varchar(100),
  "weight" int,
  "measurement_unit" varchar(15),
  "warehouse_type" varchar(1),
  "trademark" varchar(20),
  "observation" varchar(100),
  "state" varchar(1),
  "category_fk" int
);

CREATE TABLE "rh_collaborator" (
  "document" varchar(8) PRIMARY KEY,
  "names" varchar(50),
  "surnames" varchar(50),
  "phone" varchar(15),
  "gender" varchar(15),
  "address" varchar(50),
  "district" varchar(15),
  "province" varchar(15),
  "department" varchar(15),
  "birthdate" timestamp,
  "state" varchar(1),
  "user_fk" varchar,
  "manager_fk" VARCHAR(8),
  "pension_type" VARCHAR(3) -- ONP, AFP
);

CREATE TABLE "rp_user_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50)
);

CREATE TABLE "rp_role" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "user_type_fk" int,
  "register_date" timestamp,
  "state" varchar(1)
);

CREATE TABLE "rp_user" (
  "username" VARCHAR(15) PRIMARY KEY,
  "email" varchar(50),
  "password" varchar(100),
  "register_date" timestamp,
  "state" varchar(1),
  "role_fk" int,
  "user_type_fk" int,
  "store_fk" varchar
);

CREATE TABLE "rh_rating" (
  "id" SERIAL PRIMARY KEY,
  "score" int,
  "register_date" timestamp,
  "state" varchar(1),
  "actor_type" varchar,
  "actor_fk" varchar,
  "register_by_fk" varchar
);

CREATE TABLE "cre_group" (
  "id" SERIAL PRIMARY KEY,
  "name" int,
  "register_date" timestamp,
  "state" varchar(1)
);

CREATE TABLE "cre_variation" (
  "id" SERIAL PRIMARY KEY,
  "variation" float,
  "register_date" timestamp,
  "state" varchar(1),
  "product_fk" varchar,
  "group_fk" int
);

CREATE TABLE "rh_client" (
  "document" varchar(11) PRIMARY KEY,
  "name" varchar(50),
  "address" varchar(50),
  "register_date" timestamp,
  "state" varchar(1),  
  "user_fk" varchar,
  "store_fk" varchar,
  "credit_state" varchar(1),
  "group_fk" int
);

CREATE TABLE "st_client" (
  "document" varchar(11) PRIMARY KEY,
  "name" varchar,
  "taxpaper_state" varchar,
  "domicile_condition" varchar,
  "ubigeo" varchar,
  "store_name" varchar,
  "address" varchar
);


CREATE TABLE "cre_contract_client" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar,
  "register_date" timestamp,
  "start_date" timestamp,
  "end_date" timestamp,
  "payment_date" timestamp,
  "days_periodicity" int,
  "client_fk" varchar
);

CREATE TABLE "rh_competitor" (
  "ruc" varchar(11) PRIMARY KEY,
  "name" varchar(50),
  "address" varchar(50),
  "register_date" timestamp,
  "state" varchar(1),
  "store_fk" varchar
);

CREATE TABLE "pro_competitor_price" (
  "id" SERIAL PRIMARY KEY,
  "last_amount" varchar(50),
  "current_amount" varchar(50),
  "register_date" timestamp,
  "state" varchar(1),
  "register_by_fk" varchar,
  "product_fk" varchar,
  "competitor_fk" varchar
);

CREATE TABLE "rh_institution" (
  "ruc" varchar(11) PRIMARY KEY,
  "name" varchar(50),
  "address" varchar(50),
  "register_date" timestamp,
  "state" varchar(1),
  "phone" varchar(15)
);

CREATE TABLE "rh_institution_document" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar(50),
  "document" varchar(50),
  "register_date" timestamp,
  "register_by_fk" varchar,
  "institution_fk" varchar
);

CREATE TABLE "rp_permission" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "user_type_fk" int,
  "state" varchar(1)
);

-- ESTATE ACTUAL DE ACTUALIZACIÓN
----------------------------------
----------------------------------
---------------------------------

CREATE TABLE "rp_permission_time" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "state" varchar(1)
);

CREATE TABLE "rp_user_permission_time" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "user_fk" varchar,
  "permission_time_fk" int
);

CREATE TABLE "rh_permission_request_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50)
);

CREATE TABLE "rh_permission_request" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar(50),
  "register_date" timestamp,
  "start_date" timestamp,
  "end_date" timestamp,
  "state" varchar(1),
  "requested_by_fk" varchar,
  "approved_by_fk" varchar,
  "permission_request_type_fk" int
);

CREATE TABLE "rp_access" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "permission_fk" int,
  "role_fk" int
);

CREATE TABLE "rp_responsability" (
  "id" SERIAL PRIMARY KEY,
  "user_fk" varchar,
  "register_date" timestamp,
  "state" varchar(1),
  "store_fk" varchar
);

CREATE TABLE "pro_price" (
  "id" SERIAL PRIMARY KEY,
  "last_amount" float,
  "current_amount" float,
  "register_date" timestamp,
  "state" varchar(1),
  "user_fk" varchar,
  "product_fk" varchar,
  "store_fk" varchar
);

CREATE TABLE "cr_liquidation" (
  "id" SERIAL PRIMARY KEY,
  "amount" float,
  "register_date" timestamp,
  "initial_record" float,
  "final_record" float,
  "observation" varchar,
  "state" varchar,
  "vouchers_amount" int,
  "store_fk" varchar,
  "collaborator_fk" varchar
);

CREATE TABLE "cr_cash_register" (
  "id" SERIAL PRIMARY KEY,
  "start_date" timestamp,
  "finish_date" timestamp,
  "total" int,
  "initial_record" float,
  "final_record" float,
  "state" varchar,
  "vouchers_amount" int,
  "user_fk" varchar,
  "liquidation_fk" int,
  "store_fk" varchar
);

CREATE TABLE "sl_sale" (
  "id" SERIAL PRIMARY KEY,
  "full_payment" float,
  "register_date" timestamp,
  "seller_fk" varchar,
  "store_fk" varchar,
  "state" varchar(1),
  "variation_by_group" float,
  "payment_method" varchar,
  "cash_register_fk" int
);

CREATE TABLE "sl_sale_detail" (
  "id" SERIAL PRIMARY KEY,
  "amount" int,
  "unit_price" float,
  "total_price" float,
  "product_fk" varchar,
  "sale_fk" int
);

CREATE TABLE "v_voucher_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "description" varchar(50),
  "tag" varchar(2)
  --"correlative" varchar(10)
);

CREATE TABLE "v_sequence" (
  "id" SERIAL PRIMARY KEY,
  "store_fk" VARCHAR(11) NOT NULL REFERENCES "store"("ruc"),
  "serie" VARCHAR(4) NOT NULL,
  "type" VARCHAR(4) NOT NULL,
  "value" INT NOT NULL
);

CREATE TABLE "v_voucher" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar(50),
  "emission_date" timestamp,
  "purchase_fk" int,
  "voucher_type_fk" int,
  "purchaser_fk" varchar,
  -- guarda el archivo del voucher
  "voucher_path" varchar,
  "correlative" VARCHAR(10),
  "serie" varchar(4)
);

CREATE TABLE "v_voucher_f" (
  "id" SERIAL PRIMARY KEY,
  "serie" varchar(4),
  "correlative" varchar(10),
  "emission_date" timestamp,
  "sale_fk" int,
  "voucher_type_fk" int,
  "purchaser_fk" varchar
);

CREATE TABLE "v_voucher_b" (
  "id" SERIAL PRIMARY KEY,
  "serie" varchar(4),
  "correlative" varchar(10),
  "emission_date" timestamp,
  "sale_fk" int,
  "voucher_type_fk" int,
  "purchaser_fk" varchar
);

CREATE TABLE "v_voucher_n" (
  "id" SERIAL PRIMARY KEY,
  "serie" varchar(4),
  "correlative" varchar(10),
  "emission_date" timestamp,
  "sale_fk" int,
  "voucher_type_fk" int,
  "purchaser_fk" varchar
);

CREATE TABLE "v_voucher_c" (
  "id" SERIAL PRIMARY KEY,
  "serie" varchar(4),
  "correlative" varchar(10),
  "emission_date" timestamp,
  "voucher_id" int,
  "tag" varchar(2),
  "register_by_fk" varchar,
  "voucher_type_fk" int
);

CREATE TABLE "v_correlative" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "serie" varchar,
  "tag" varchar(2),
  "current_correlative" int,
  "voucher_type_fk" int,
  "store_fk" varchar
);

CREATE TABLE "rh_supplier" (
  "ruc" VARCHAR PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "short_name" VARCHAR(30) NOT NULL,
  "description" VARCHAR(50),
  "register_date" TIMESTAMP NOT NULL,
  "address" VARCHAR(255),
  "district" VARCHAR(15),
  "province" VARCHAR(15),
  "department" VARCHAR(15),
  "state" VARCHAR(1),
  "store_fk" VARCHAR
);

CREATE TABLE "pro_supplier_price" (
  "id" SERIAL PRIMARY KEY,
  "last_amount" varchar(50),
  "current_amount" varchar(50),
  "register_date" timestamp,
  "state" varchar(1),
  "register_by_fk" varchar,
  "product_fk" varchar,
  "supplier_fk" varchar
);

CREATE TABLE "rh_supplier_contact" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(20),
  "register_date" timestamp,
  "phone" varchar(15),
  "supplier_fk" varchar
);

CREATE TABLE "pu_requirement" (
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" VARCHAR(15),
  "description" VARCHAR,
  "register_date" TIMESTAMP,
  "state" VARCHAR(1),
  "store_fk" VARCHAR(11) NOT NULL,
  "register_by_fk" VARCHAR(50) NOT NULL
);

CREATE TABLE "pu_requirement_detail" (
  "id" SERIAL PRIMARY KEY,
  "quantity" INT NOT NULL,
  "product_fk" VARCHAR NOT NULL,
  "requirement_fk" INT NOT NULL
);

CREATE TABLE "pu_requirement_category" (
  "id" SERIAL PRIMARY KEY,
  "quantity" INT NOT NULL,
  "category_fk" INT NOT NULL REFERENCES "pro_category"("id"),
  "requirement_fk" INT NOT NULL REFERENCES "pu_requirement"("id")
);

CREATE TABLE "pu_order" (
  "id" SERIAL PRIMARY KEY,
  "description" VARCHAR,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" VARCHAR(15) NOT NULL,
  "pocs" VARCHAR,
  "register_date" TIMESTAMP NOT NULL,
  "state" VARCHAR(1) NOT NULL,
  "transportation" VARCHAR(1),
  "supplier_fk" VARCHAR(11),
  "store_fk" VARCHAR(11) NOT NULL,
  "register_by_fk" VARCHAR,
  "requirement_fk" INT NOT NULL
);

CREATE TABLE "pu_pocs" (
    "id" SERIAL PRIMARY KEY,
    "register_date" TIMESTAMP NOT NULL,
    "user_fk" VARCHAR(50) NOT NULL
);

CREATE TABLE "pu_area" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "state" varchar(1) NOT NULL,
  "created_by" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP NOT NULL
);

CREATE TABLE "pu_category" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "state" varchar(1) NOT NULL,
  "created_by" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP NOT NULL
);

CREATE TABLE "pu_concept" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" VARCHAR,
  "created_by" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP NOT NULL
);

CREATE TABLE "pu_concept_mix" (
  "id" SERIAL PRIMARY KEY,
  "store_fk" VARCHAR(11) NOT NULL REFERENCES "store"("ruc"),
  "area_fk" INT NOT NULL REFERENCES "pu_area"("id"),
  "category_fk" INT NOT NULL REFERENCES "pu_category"("id"),
  "concept_fk" INT NOT NULL REFERENCES "pu_concept"("id"),
  -- I, E, IE -> INTERNO, EXTERNO, INTERNO Y EXTERNO
  "type" VARCHAR(2) NOT NULL,
  "variety" VARCHAR(2) NOT NULL,
  "created_by" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP NOT NULL
);

CREATE TABLE "pu_concept_mix_voucher_type" (
  "id" SERIAL PRIMARY KEY,
  "concept_mix_fk" INT NOT NULL REFERENCES "pu_concept_mix"("id"),
  "voucher_type_fk" INT NOT NULL REFERENCES "v_voucher_type"("id")
);

CREATE TABLE "pu_concept_mix_supplier" (
  "id" SERIAL PRIMARY KEY,
  "concept_mix_fk" INT NOT NULL REFERENCES "pu_concept_mix"("id"),
  "supplier_fk" VARCHAR NOT NULL REFERENCES "rh_supplier"("ruc")
);

CREATE TABLE "pu_purchase" (
  "id" SERIAL PRIMARY KEY,
  "full_payment" DECIMAL(10,2) NOT NULL,
  -- subtotal sin igv
  "subtotal" DECIMAL(10,2) NOT NULL,
  "igv" DECIMAL(10,2) NOT NULL,

  "description" VARCHAR,
  -- fecha de registro del egreso
  "register_date" TIMESTAMP NOT NULL,
  "payment_date" TIMESTAMP,
  "supplier_fk" VARCHAR(11),
  "store_fk" VARCHAR(11) NOT NULL,
  -- tipo: interno o externo -> I, E 
  "type" VARCHAR(1) NOT NULL,
  -- usuario que registró el egreso
  "user_fk" VARCHAR NOT NULL,
  "concept_fk" INT NOT NULL REFERENCES "pu_concept"("id"),
  "area_fk" INT NOT NULL REFERENCES "pu_area"("id"),
  "category_fk" INT NOT NULL REFERENCES "pu_category"("id"),
  
  "transport_arrived" varchar(1),
  "payment_method" varchar,
  -- caja de donde se usó el dinero
  "cash_register_fk" INT,
  "account_fk" INT,
  "order_fk" INT,

  -- estado del egreso cancenlado o no cancelado -> C, P
  "status" VARCHAR(1),

  "variety" VARCHAR(2) NOT NULL,
	"variety_fk" INT
);

CREATE TABLE "pu_payroll_variety" (
  "id" SERIAL PRIMARY KEY,
	"collaborator_fk" VARCHAR(8) NOT NULL REFERENCES "rh_collaborator"("document")
);

CREATE TABLE "pu_purchase_detail" (
  "id" SERIAL PRIMARY KEY,
  "quantity" INT, -- cantidad de productos
  "unit_price" DECIMAL(10,2), -- precio unitario
  "discount_percentage" FLOAT, -- porcentaje de descuento
  "discount" DECIMAL(10,2),
  "subtotal" DECIMAL(10,2),
  "total" DECIMAL(10,2),
  "product_fk" VARCHAR(5) NOT NULL,
  "order_fk" INT,
  "purchase_fk" INT
);

CREATE TABLE "pu_transportation_order" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar,
  "origin" varchar,
  "destination" varchar,
  "correlative" varchar(15),
  "register_date" timestamp,
  "state" varchar(1),
  "transportation" varchar(1),
  "store_fk" varchar,
  "register_by_fk" varchar,
  "pu_order_fk" int,
  "pu_purchase_fk" int,
  "voucher_fk" int
);

CREATE TABLE "rh_candidate" (
  "dni" varchar PRIMARY KEY,
  "name" varchar(30),
  "surname" varchar(20),
  "phone" varchar(15),
  "email" varchar(50),
  "state" varchar(1),
  "curriculum" varchar,
  "district_fk" int
);

CREATE TABLE "rh_contract" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "start_date" timestamp,
  "end_date" timestamp,
  "amount" varchar(15),
  "description" varchar(50),
  "document" varchar,
  "state" varchar(1),
  "collaborator_fk" varchar,
  "register_by_fk" varchar
);

CREATE TABLE "rs_event_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "description" varchar(50)
);

CREATE TABLE "rs_event" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "register_date" timestamp,
  "description" varchar,
  "image" varchar(50),
  "image_name" varchar,
  "event_type_fk" int,
  "register_by_fk" varchar
);

CREATE TABLE "irat_incident" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "incident_date" timestamp,
  "description" varchar(200),
  "state" varchar(1),
  "register_by_fk" varchar
);

CREATE TABLE "irat_recommendation" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "description" varchar(200),
  "register_by_fk" varchar,
  "state" varchar(1)
);

CREATE TABLE "irat_event" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "register_date" timestamp,
  "register_event" timestamp,
  "description" varchar(200),
  "state" varchar(1),
  "user_involved_fk" varchar,
  "register_by_fk" varchar
);

CREATE TABLE "irat_task" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "start_date" timestamp,
  "end_date" timestamp,
  "description" varchar(200),
  "state" varchar(1),
  "assigned_to_fk" varchar,
  "register_by_fk" varchar
);

CREATE TABLE "irat_store" (
  "id" SERIAL PRIMARY KEY,
  "irat_type" varchar(20),
  "irat_fk" int,
  "store_fk" varchar
);

CREATE TABLE "op_count" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "state" varchar(1),
  "manual_count_id" int,
  "counted_by_fk" varchar,
  "cash_register_fk" int,
  "store_fk" varchar
);

CREATE TABLE "op_count_detail" (
  "id" SERIAL PRIMARY KEY,
  "state" varchar(1),
  "amount" int,
  "count_fk" int,
  "product_fk" varchar
);

CREATE TABLE "op_inventory_adjustment" (
  "id" SERIAL PRIMARY KEY,
  "discrepancy" int,
  "register_date" timestamp,
  "state" varchar(1),
  "adjusted_by_fk" varchar,
  "product_fk" varchar,
  "count_fk" int
);

CREATE TABLE "op_equipment_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "description" varchar(50),
  "icon_path" varchar(250),
  "frequency" int,
  "frequency_type" varchar(1),
  "code" varchar(50),
  "group" varchar(255)
);

CREATE TABLE "op_equipment_type_icon" (
  "id" SERIAL PRIMARY KEY,
  "icon_path" varchar(250),
  "equipment_type_fk" int,
  "store_fk" varchar
);

CREATE TABLE "op_equipment" (
  "id" SERIAL PRIMARY KEY,
  "number" int,
  "name" varchar(50),
  "description" varchar(100),
  "state" varchar(1),
  "store_fk" varchar,
  "maintenance_fk" int,
  "equipment_type_fk" int,
  "year" int,
  "model" varchar(50),
  "brand" varchar(50),
  "created_by" varchar,
  "updated_by" varchar
);

CREATE TABLE "op_maintenance_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "description" varchar(50),
  "state" varchar(1),
  "icon" varchar(250)
);

CREATE TABLE "op_maintenance" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "description" VARCHAR,
  "state" varchar(1),
  "equipment_fk" int,
  "maintenance_type_fk" int,
  "register_by_fk" varchar,
  "maintenance_scheduling_fk" int,
  "contact_fk" int, -- responsable del mantenimiento
  "supplier_fk" varchar -- proveedor del mantenimiento
);

CREATE TABLE "op_assigned_maintenance" (
  "id" SERIAL PRIMARY KEY,
  "equipment_type_fk" int,
  "maintenance_type_fk" int
);

CREATE TABLE "op_maintenance_scheduling" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "state" varchar(1),
  "maintenance_date" timestamp,
  "frequency" int,
  "frequency_type" varchar(1),
  "equipment_fk" int
);

CREATE TABLE "rh_horary" (
  "id" SERIAL PRIMARY KEY,
  "start_time" time,
  "end_time" time,
  "start_break_time" time,
  "end_break_time" time,
  "day" varchar(10),
  "state" varchar(1),
  "collaborator_fk" varchar
);

CREATE TABLE "sl_batch" (
  "id" SERIAL PRIMARY KEY,
  "condition" varchar(1),
  "state" varchar(1),
  "purchase_fk" int
);

CREATE TABLE "sl_batch_detail"(
  "id" SERIAL PRIMARY KEY,
  "consumed_batch" int,
  "total_batch" int,
  "sale_price" float,
  "purchase_price" float,
  "product_fk" varchar,
  "batch_fk" int
);

CREATE TABLE "rh_personnel_marking" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "description" varchar(20),
  "observation" varchar(255),
  "type" VARCHAR(1) NOT NULL,
  "state" varchar(1),
  "collaborator_fk" varchar
);

CREATE TABLE "rh_markings_resume" (
  "id" SERIAL PRIMARY KEY,
  "register_date" timestamp,
  "workdays" int,
  "worked_days" int,
  "tardiness" int,
  "absences" int,
  "hours_worked" float,
  "extra_hours" float,
  "periodicity" varchar(1), --MONTH OR WEEK
  "number_w_m" int,
  "state" varchar(1),
  "collaborator_fk" varchar
);

CREATE TABLE "rh_markings_detail" (
  "id" SERIAL PRIMARY KEY,
  "personnel_marking_fk" int,
  "markings_detail_fk" int
);

CREATE TABLE "rh_network" (
  "id" SERIAL PRIMARY KEY,
  "page" varchar(150),
  "actor_fk" varchar
);

CREATE TABLE "tr_driver" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(150),
  "driving_license" varchar(15)
);

CREATE TABLE "tr_transportation_brand" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" VARCHAR(200),
  "state" VARCHAR(1) NOT NULL,
  "type" VARCHAR(1) NOT NULL
);

CREATE TABLE "tr_vehicle" (
  "id" SERIAL PRIMARY KEY,
  "plate" VARCHAR(10) NOT NULL,
  "brand_fk" INT NOT NULL REFERENCES "tr_transportation_brand"("id"),
  "model" VARCHAR(100),
  "year" INT,
  "state" VARCHAR(1) NOT NULL,
  "created_by" VARCHAR(50) NOT NULL,
  "updated_by" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL
);

CREATE TABLE "tr_container_plate" (
  "id" SERIAL PRIMARY KEY,
  "plate" VARCHAR(10) NOT NULL,
  "total_capacity" INT NOT NULL,
  "brand_fk" INT NOT NULL REFERENCES "tr_transportation_brand"("id"),
  "model" VARCHAR(100),
  "year" INT,
  "state" VARCHAR(1) NOT NULL,
  "created_by" VARCHAR(50) NOT NULL,
  "updated_by" VARCHAR(50) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP NOT NULL
);

CREATE TABLE "tr_vehicle_container_plate" (
  "id" SERIAL PRIMARY KEY,
  "vehicle_fk" INT NOT NULL REFERENCES "tr_vehicle"("id"),
  "container_plate_fk" INT NOT NULL REFERENCES "tr_container_plate"("id")
);

CREATE TABLE "tr_compartment" (
  "id" SERIAL PRIMARY KEY,
  "code" varchar(20) NOT NULL,
  "capacity" INT NOT NULL,
  "container_plate_fk" INT NOT NULL REFERENCES "tr_container_plate"("id")
);

CREATE TABLE "tr_transporting" (
  "id" SERIAL PRIMARY KEY,
  "arrive_date" timestamp,
  "supplier_fk" varchar,
  "driver_fk" int,
  "vehicle_fk" int,
  "store_fk" varchar,
  "container_plate_fk" int,
  "transportation_order_fk" int,
  "ruc" VARCHAR,
  "business_name" VARCHAR,
  "voucher_type_fk" INT,
  "register_date" TIMESTAMP,
  "subtotal" DECIMAL(10,2) NOT NULL,
  "igv" DECIMAL(10,2) NOT NULL,
  "total" DECIMAL(10,2) NOT NULL,
  "voucher_path" VARCHAR,
  "serie" VARCHAR(4),
  "correlative" VARCHAR(10),
  "user_fk" VARCHAR NOT NULL REFERENCES "rp_user"("username")
);

CREATE TABLE "tr_rented_compartment" (
  "id" SERIAL PRIMARY KEY,
  "stock" varchar,
  "category_fk" int,
  "transportation_order_fk" int
);

CREATE TABLE "ban_bank" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "description" varchar(200)
);

CREATE TABLE "ban_account" (
  "id" SERIAL PRIMARY KEY,
  "number_account" varchar,
  "balance" float,
  "description" varchar(200),
  "bank_fk" int,
  "store_fk" varchar
);

CREATE TABLE "ban_transaction_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "description" varchar(200),
  "state" varchar(1)
);

CREATE TABLE "ban_transaction" (
  
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR NOT NULL,
  "correlative" VARCHAR NOT NULL,
  "type" VARCHAR(1) NOT NULL, -- variar | E, I
  "voucher_path" VARCHAR(255),
  "description" VARCHAR,
  "register_date" TIMESTAMP NOT NULL,
  "user_fk" VARCHAR NOT NULL,

  "account_fk" INT NOT NULL, -- variar
  "amount" DECIMAL(10, 2) NOT NULL,
  "current_amount" DECIMAL(10, 2) NOT NULL, -- variar
 
  "origin_account_fk" INT,
  "destination_account_fk" INT,

  "transaction_type_fk" INT NOT NULL,
  "cash_register_fk" INT,
  "state" VARCHAR(1)
);

CREATE TABLE "con_taxation_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50),
  "description" varchar(200),
  "state" varchar(1)
);

CREATE TABLE "con_taxation" (
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" varchar(50) NOT NULL ,
  "transaction" varchar(50) NOT NULL ,
  "description" varchar(200),
  "month" varchar(15) NOT NULL,
  "year" varchar(15) NOT NULL,
  "register_date" timestamp NOT NULL,
  "state" varchar(1) NOT NULL,
  "store_fk" varchar NOT NULL ,
  "taxation_type_fk" int NOT NULL ,
  "path_file" varchar,
  "user_fk" varchar NOT NULL ,
  "payment" float NOT NULL
);

CREATE TABLE "con_payroll_calculation" (
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" varchar(50) NOT NULL,
  "register_date" timestamp NOT NULL,
  "month" varchar(15) NOT NULL,
  "year" varchar(15) NOT NULL , 
  "observation" varchar(200),
  "state" varchar(1) NOT NULL,
  "store_fk" varchar,
  "user_fk" varchar NOT NULL REFERENCES "rp_user"("username")
);

CREATE TABLE "con_payroll_calculation_details" (
  "id" SERIAL PRIMARY KEY,
  "path_file" varchar,
  "state" varchar(1),
  "payment" float NOT NULL,
  "collaborator_fk" varchar,
  "payroll_calculation_fk" int
);

CREATE TABLE "con_pension" (
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" varchar(50) NOT NULL,
  "register_date" timestamp NOT NULL,
  "month" varchar(15) NOT NULL,
  "year" varchar(15) NOT NULL , 
  "observation" varchar(200),
  "state" varchar(1) NOT NULL,
  "store_fk" varchar NOT NULL REFERENCES "store"("ruc"),
  "user_fk" varchar NOT NULL REFERENCES "rp_user"("username")
);

CREATE TABLE "con_pension_details" (
  "id" SERIAL PRIMARY KEY,
  "path_file" varchar,
  "type" varchar(3) NOT NULL,
  "payment" float NOT NULL,
  "collaborator_fk" varchar NOT NULL REFERENCES "rh_collaborator"("document"),
  "pension_fk" int NOT NULL REFERENCES "con_pension"("id"),
  "state" varchar(1) NOT NULL
);

CREATE TABLE "con_health_insurance" (
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" varchar(50) NOT NULL,
  "register_date" timestamp NOT NULL,
  "month" varchar(15) NOT NULL,
  "year" varchar(15) NOT NULL , 
  "observation" varchar(200),
  "state" varchar(1) NOT NULL,
  "store_fk" varchar NOT NULL REFERENCES "store"("ruc"),
  "user_fk" varchar NOT NULL REFERENCES "rp_user"("username")
);

CREATE TABLE "con_health_insurance_details" (
  "id" SERIAL PRIMARY KEY,
  "path_file" varchar,
  "payment" float NOT NULL,
  "collaborator_fk" varchar NOT NULL REFERENCES "rh_collaborator"("document"),
  "health_insurance_fk" int NOT NULL REFERENCES "con_health_insurance"("id"),
  "state" varchar(1) NOT NULL
);

CREATE TABLE "con_financial_statements" (
  "id" SERIAL PRIMARY KEY,
  "serie" VARCHAR(4) NOT NULL,
  "correlative" varchar(50),
  "description" varchar(200),
  "year" varchar(15),
  "register_date" timestamp NOT NULL,
  "state" varchar(1),
  "path_file" varchar,
  "payment" float NOT NULL,
  "store_fk" varchar NOT NULL REFERENCES "store"("ruc"),
  "user_fk" varchar NOT NULL REFERENCES "rp_user"("username")
);

CREATE TABLE "op_changes" (
  "id" SERIAL PRIMARY KEY,
  "table_name" varchar(150),
  "previous_register_number" int,
  "next_register_number" int,
  "previous_value" varchar,
  "next_value" varchar,
  "collaborator_fk" varchar
);

CREATE TABLE "rh_changes" (
  "id" SERIAL PRIMARY KEY,
  "table_name" varchar(150),
  "previous_register_number" int,
  "next_register_number" int,
  "previous_value" varchar,
  "next_value" varchar,
  "collaborator_fk" varchar
);

CREATE TABLE "sl_changes" (
  "id" SERIAL PRIMARY KEY,
  "table_name" varchar(150),
  "previous_register_number" int,
  "next_register_number" int,
  "previous_value" varchar,
  "next_value" varchar,
  "collaborator_fk" varchar
);

CREATE TABLE "pu_changes" (
  "id" SERIAL PRIMARY KEY,
  "table_name" varchar(150),
  "previous_register_number" int,
  "next_register_number" int,
  "previous_value" varchar,
  "next_value" varchar,
  "collaborator_fk" varchar
);

CREATE TABLE "cr_cash_register_detail" (
  "id" SERIAL PRIMARY KEY,
  "initial_record" float,
  "final_record" float,
  "category_fk" int,
  "cash_register_fk" int
);

-- *** LOCALIZACIÓN ***
ALTER TABLE "geo_district" ADD FOREIGN KEY ("province_fk") REFERENCES "geo_province" ("id");
ALTER TABLE "geo_province" ADD FOREIGN KEY ("department_fk") REFERENCES "geo_department" ("id");
ALTER TABLE "pro_product" ADD FOREIGN KEY ("category_fk") REFERENCES "pro_category" ("id");


-- *** TIENDA ***
ALTER TABLE "store" ADD FOREIGN KEY ("district_fk") REFERENCES "geo_district" ("id");


-- *** ROLES Y PERMISOS ***
ALTER TABLE "rp_user" ADD FOREIGN KEY ("role_fk") REFERENCES "rp_role" ("id");
ALTER TABLE "rp_user" ADD FOREIGN KEY ("user_type_fk") REFERENCES "rp_user_type" ("id");
ALTER TABLE "rp_user" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "rp_role" ADD FOREIGN KEY ("user_type_fk") REFERENCES "rp_user_type" ("id");
ALTER TABLE "rp_permission" ADD FOREIGN KEY ("user_type_fk") REFERENCES "rp_user_type" ("id");
ALTER TABLE "rp_user_permission_time" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "rp_user_permission_time" ADD FOREIGN KEY ("permission_time_fk") REFERENCES "rp_permission_time" ("id");


-- accesos
ALTER TABLE "rp_access" ADD FOREIGN KEY ("permission_fk") REFERENCES "rp_permission" ("id");
ALTER TABLE "rp_access" ADD FOREIGN KEY ("role_fk") REFERENCES "rp_role" ("id");
-- responsabilidad
ALTER TABLE "rp_responsability" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "rp_responsability" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");


-- *** RECURSOS HUMANOS ***
-- candidatos
ALTER TABLE "rh_candidate" ADD FOREIGN KEY ("district_fk") REFERENCES "geo_district" ("id");
-- colaboradores
ALTER TABLE "rh_collaborator" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
-- contratos de colaboradores
ALTER TABLE "rh_contract" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
-- horarios
ALTER TABLE "rh_horary" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
-- marcación
ALTER TABLE "rh_personnel_marking" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "rh_markings_resume" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "rh_markings_detail" ADD FOREIGN KEY ("personnel_marking_fk") REFERENCES "rh_personnel_marking" ("id");
ALTER TABLE "rh_markings_detail" ADD FOREIGN KEY ("markings_detail_fk") REFERENCES "rh_markings_resume" ("id");
-- rating
ALTER TABLE "rh_rating" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rh_collaborator" ("document");
-- clientes
ALTER TABLE "rh_client" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "rh_client" ADD FOREIGN KEY ("group_fk") REFERENCES "cre_group" ("id");
ALTER TABLE "rh_client" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
-- institutciones
ALTER TABLE "rh_institution_document" ADD FOREIGN KEY ("institution_fk") REFERENCES "rh_institution" ("ruc");
ALTER TABLE "rh_institution_document" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
-- permisos
ALTER TABLE "rh_permission_request" ADD FOREIGN KEY ("permission_request_type_fk") REFERENCES "rh_permission_request_type" ("id");
ALTER TABLE "rh_permission_request" ADD FOREIGN KEY ("approved_by_fk") REFERENCES "rp_user" ("username");
-- competidores
ALTER TABLE "rh_competitor" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
-- proveedores
ALTER TABLE "rh_supplier" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
-- contactos de proveedor
ALTER TABLE "rh_supplier_contact" ADD FOREIGN KEY ("supplier_fk") REFERENCES "rh_supplier" ("ruc");


-- *** LOTES ***
ALTER TABLE "sl_batch" ADD FOREIGN KEY ("purchase_fk") REFERENCES "pu_purchase" ("id");
ALTER TABLE "sl_batch_detail" ADD FOREIGN KEY ("batch_fk") REFERENCES "sl_batch" ("id");
ALTER TABLE "sl_batch_detail" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");


-- *** CREDITOS ***
ALTER TABLE "cre_variation" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "cre_variation" ADD FOREIGN KEY ("group_fk") REFERENCES "cre_group" ("id");
ALTER TABLE "cre_contract_client" ADD FOREIGN KEY ("client_fk") REFERENCES "rh_client" ("document");


-- *** PRECIOS ***
-- precios de productos
ALTER TABLE "pro_price" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "pro_price" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "pro_price" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
-- precios de competidor
ALTER TABLE "pro_competitor_price" ADD FOREIGN KEY ("competitor_fk") REFERENCES "rh_competitor" ("ruc");
ALTER TABLE "pro_competitor_price" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "pro_competitor_price" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");


-- *** ALMACENES ***
ALTER TABLE "wh_warehouse" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "wh_space" ADD FOREIGN KEY ("warehouse_fk") REFERENCES "wh_warehouse" ("id");
ALTER TABLE "pro_category" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");

-- *** STOCK MAXIMO ***
ALTER TABLE "wh_maximum_stock" ADD FOREIGN KEY ("category_fk") REFERENCES "pro_category" ("id");
ALTER TABLE "wh_maximum_stock" ADD FOREIGN KEY ("space_fk") REFERENCES "wh_space" ("id");

-- *** KARDEX INVENTARIO ***
ALTER TABLE "wh_kardex_main" ADD FOREIGN KEY ("warehouse_fk") REFERENCES "wh_warehouse" ("id");
ALTER TABLE "wh_kardex_main" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "wh_kardex_main" ADD FOREIGN KEY ("category_fk") REFERENCES "pro_category" ("id");
ALTER TABLE "wh_kardex_general" ADD FOREIGN KEY ("warehouse_fk") REFERENCES "wh_warehouse" ("id");
ALTER TABLE "wh_kardex_general" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "wh_kardex_general" ADD FOREIGN KEY ("category_fk") REFERENCES "pro_category" ("id");


-- *** CAJAS ***
ALTER TABLE "cr_liquidation" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "cr_liquidation" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "cr_cash_register" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "cr_cash_register" ADD FOREIGN KEY ("liquidation_fk") REFERENCES "cr_liquidation" ("id");
ALTER TABLE "cr_cash_register" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "cr_cash_register_detail" ADD FOREIGN KEY ("category_fk") REFERENCES "pro_category" ("id");
ALTER TABLE "cr_cash_register_detail" ADD FOREIGN KEY ("cash_register_fk") REFERENCES "cr_cash_register" ("id");


-- *** VENTAS ***
ALTER TABLE "sl_sale" ADD FOREIGN KEY ("seller_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "sl_sale" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "sl_sale" ADD FOREIGN KEY ("cash_register_fk") REFERENCES "cr_cash_register" ("id");
ALTER TABLE "sl_sale_detail" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "sl_sale_detail" ADD FOREIGN KEY ("sale_fk") REFERENCES "sl_sale" ("id");


-- *** COMPROBANTES ***
-- ALTER TABLE "v_voucher" ADD FOREIGN KEY ("sale_fk") REFERENCES "sl_sale" ("id");
ALTER TABLE "v_voucher" ADD FOREIGN KEY ("purchase_fk") REFERENCES "pu_purchase" ("id");
ALTER TABLE "v_voucher" ADD FOREIGN KEY ("voucher_type_fk") REFERENCES "v_voucher_type" ("id");
--ALTER TABLE "v_voucher" ADD FOREIGN KEY ("purchaser_fk") REFERENCES "rh_client" ("document");

-- *** COMPROBANTES VENTAS ***
ALTER TABLE "v_voucher_f" ADD FOREIGN KEY ("sale_fk") REFERENCES "sl_sale" ("id");
ALTER TABLE "v_voucher_f" ADD FOREIGN KEY ("voucher_type_fk") REFERENCES "v_voucher_type" ("id");
ALTER TABLE "v_voucher_f" ADD FOREIGN KEY ("purchaser_fk") REFERENCES "rh_client" ("document");

ALTER TABLE "v_voucher_b" ADD FOREIGN KEY ("sale_fk") REFERENCES "sl_sale" ("id");
ALTER TABLE "v_voucher_b" ADD FOREIGN KEY ("voucher_type_fk") REFERENCES "v_voucher_type" ("id");
ALTER TABLE "v_voucher_b" ADD FOREIGN KEY ("purchaser_fk") REFERENCES "rh_client" ("document");

ALTER TABLE "v_voucher_n" ADD FOREIGN KEY ("sale_fk") REFERENCES "sl_sale" ("id");
ALTER TABLE "v_voucher_n" ADD FOREIGN KEY ("voucher_type_fk") REFERENCES "v_voucher_type" ("id");
ALTER TABLE "v_voucher_n" ADD FOREIGN KEY ("purchaser_fk") REFERENCES "rh_client" ("document");

ALTER TABLE "v_voucher_c" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "v_voucher_c" ADD FOREIGN KEY ("voucher_type_fk") REFERENCES "v_voucher_type" ("id");

ALTER TABLE "v_correlative" ADD FOREIGN KEY ("voucher_type_fk") REFERENCES "v_voucher_type" ("id");
ALTER TABLE "v_correlative" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");


-- *** EGRESOS ***
--  requerimientos
ALTER TABLE "pu_requirement" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "pu_requirement" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "pu_requirement_detail" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "pu_requirement_detail" ADD FOREIGN KEY ("requirement_fk") REFERENCES "pu_requirement" ("id");
-- ordenes de pedido
ALTER TABLE "pu_order" ADD FOREIGN KEY ("supplier_fk") REFERENCES "rh_supplier" ("ruc");
ALTER TABLE "pu_order" ADD FOREIGN KEY ("requirement_fk") REFERENCES "pu_requirement" ("id");
-- compras y gastos
ALTER TABLE "pu_purchase" ADD FOREIGN KEY ("supplier_fk") REFERENCES "rh_supplier" ("ruc");
ALTER TABLE "pu_purchase" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "pu_purchase" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "pu_purchase" ADD FOREIGN KEY ("cash_register_fk") REFERENCES "cr_cash_register" ("id");
ALTER TABLE "pu_purchase" ADD FOREIGN KEY ("order_fk") REFERENCES "pu_order" ("id");
ALTER TABLE "pu_purchase" ADD FOREIGN KEY ("account_fk") REFERENCES "ban_account" ("id");
ALTER TABLE "pu_purchase_detail" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "pu_purchase_detail" ADD FOREIGN KEY ("purchase_fk") REFERENCES "pu_purchase" ("id");
ALTER TABLE "pu_purchase_detail" ADD FOREIGN KEY ("order_fk") REFERENCES "pu_order" ("id");
-- transporte
ALTER TABLE "pu_transportation_order" ADD FOREIGN KEY ("pu_order_fk") REFERENCES "pu_order" ("id");
ALTER TABLE "pu_transportation_order" ADD FOREIGN KEY ("pu_purchase_fk") REFERENCES "pu_purchase" ("id");
ALTER TABLE "pu_transportation_order" ADD FOREIGN KEY ("voucher_fk") REFERENCES "v_voucher" ("id");
-- transportanto
ALTER TABLE "tr_transporting" ADD FOREIGN KEY ("transportation_order_fk") REFERENCES "pu_transportation_order" ("id");
ALTER TABLE "tr_rented_compartment" ADD FOREIGN KEY ("category_fk") REFERENCES "pro_category" ("id");
ALTER TABLE "tr_rented_compartment" ADD FOREIGN KEY ("transportation_order_fk") REFERENCES "pu_transportation_order" ("id");


-- *** Incidentes, Recomendaciones, Acontecimientos y Tareas (IRAT's) ***
ALTER TABLE "irat_incident" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "irat_event" ADD FOREIGN KEY ("user_involved_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "irat_task" ADD FOREIGN KEY ("assigned_to_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "irat_recommendation" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "irat_store" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");


-- *** EVENTOS DE RESPOSNSABILIDAD SOCIAL ***
ALTER TABLE "rs_event" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "rs_event" ADD FOREIGN KEY ("event_type_fk") REFERENCES "rs_event_type" ("id");


-- *** CONTEO ***
ALTER TABLE "op_count" ADD FOREIGN KEY ("counted_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "op_count" ADD FOREIGN KEY ("cash_register_fk") REFERENCES "cr_cash_register" ("id");
ALTER TABLE "op_count" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "op_count_detail" ADD FOREIGN KEY ("count_fk") REFERENCES "op_count" ("id");
ALTER TABLE "op_count_detail" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "op_inventory_adjustment" ADD FOREIGN KEY ("adjusted_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "op_inventory_adjustment" ADD FOREIGN KEY ("product_fk") REFERENCES "pro_product" ("code");
ALTER TABLE "op_inventory_adjustment" ADD FOREIGN KEY ("count_fk") REFERENCES "op_count" ("id");


-- *** EQUIPOS Y MANTENIMIENTOS ***
ALTER TABLE "op_equipment" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "op_equipment" ADD FOREIGN KEY ("equipment_type_fk") REFERENCES "op_equipment_type" ("id");
ALTER TABLE "op_equipment" ADD FOREIGN KEY ("maintenance_fk") REFERENCES "op_maintenance" ("id");
ALTER TABLE "op_maintenance" ADD FOREIGN KEY ("equipment_fk") REFERENCES "op_equipment" ("id");
ALTER TABLE "op_maintenance" ADD FOREIGN KEY ("maintenance_type_fk") REFERENCES "op_maintenance_type" ("id");
ALTER TABLE "op_maintenance" ADD FOREIGN KEY ("register_by_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "op_assigned_maintenance" ADD FOREIGN KEY ("equipment_type_fk") REFERENCES "op_equipment_type" ("id");
ALTER TABLE "op_assigned_maintenance" ADD FOREIGN KEY ("maintenance_type_fk") REFERENCES "op_maintenance_type" ("id");
ALTER TABLE "op_maintenance_scheduling" ADD FOREIGN KEY ("equipment_fk") REFERENCES "op_equipment" ("id");
ALTER TABLE "op_maintenance" ADD FOREIGN KEY ("maintenance_scheduling_fk") REFERENCES "op_maintenance_scheduling" ("id");

-- *** LOGGER DE CAMBIOS ***
ALTER TABLE "op_changes" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "rh_changes" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "sl_changes" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "pu_changes" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");


-- *** TRANSPORTES ***
ALTER TABLE "tr_transporting" ADD FOREIGN KEY ("supplier_fk") REFERENCES "rh_supplier" ("ruc");
ALTER TABLE "tr_transporting" ADD FOREIGN KEY ("driver_fk") REFERENCES "tr_driver" ("id");
ALTER TABLE "tr_transporting" ADD FOREIGN KEY ("vehicle_fk") REFERENCES "tr_vehicle" ("id");
ALTER TABLE "tr_transporting" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");


-- *** BANCOS ***
ALTER TABLE "ban_account" ADD FOREIGN KEY ("bank_fk") REFERENCES "ban_bank" ("id");
ALTER TABLE "ban_account" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "ban_transaction" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");
ALTER TABLE "ban_transaction" ADD FOREIGN KEY ("origin_account_fk") REFERENCES "ban_account" ("id");
ALTER TABLE "ban_transaction" ADD FOREIGN KEY ("destination_account_fk") REFERENCES "ban_account" ("id");
ALTER TABLE "ban_transaction" ADD FOREIGN KEY ("transaction_type_fk") REFERENCES "ban_transaction_type" ("id");
ALTER TABLE "ban_transaction" ADD FOREIGN KEY ("cash_register_fk") REFERENCES "cr_cash_register" ("id");

-- *** CONTABILIDAD ***
ALTER TABLE "con_taxation" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "con_taxation" ADD FOREIGN KEY ("taxation_type_fk") REFERENCES "con_taxation_type" ("id");
ALTER TABLE "con_taxation" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");

ALTER TABLE "con_payroll_calculation" ADD FOREIGN KEY ("store_fk") REFERENCES "store" ("ruc");
ALTER TABLE "con_payroll_calculation" ADD FOREIGN KEY ("user_fk") REFERENCES "rp_user" ("username");

ALTER TABLE "con_payroll_calculation_details" ADD FOREIGN KEY ("collaborator_fk") REFERENCES "rh_collaborator" ("document");
ALTER TABLE "con_payroll_calculation_details" ADD FOREIGN KEY ("payroll_calculation_fk") REFERENCES "con_payroll_calculation" ("id");
