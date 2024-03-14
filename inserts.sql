INSERT INTO "user" ("username", "password", "register_date", "role") 
VALUES 
('usuario1', 'contraseña1', CURRENT_TIMESTAMP, 'V'),
('usuario2', 'contraseña2', CURRENT_TIMESTAMP, 'C'),
('usuario3', 'contraseña3', CURRENT_TIMESTAMP, 'V'),
('usuario4', 'contraseña4', CURRENT_TIMESTAMP, 'C');

INSERT INTO "store" ("ruc", "name", "register_date", "logo_path", "user_fk") 
VALUES 
('12345678901', 'Tienda 1', CURRENT_TIMESTAMP, '/path/to/logo1.jpg', 'usuario1'),
('23456789012', 'Tienda 2', CURRENT_TIMESTAMP, '/path/to/logo2.jpg', 'usuario2'),
('34567890123', 'Tienda 3', CURRENT_TIMESTAMP, '/path/to/logo3.jpg', 'usuario3'),
('45678901234', 'Tienda 4', CURRENT_TIMESTAMP, '/path/to/logo4.jpg', 'usuario4');

INSERT INTO "client" ("dni", "name", "email", "phone_number", "register_date", "user_fk") 
VALUES 
('1234567890', 'Cliente 1', 'cliente1@example.com', '123456789', CURRENT_TIMESTAMP, 'usuario1'),
('2345678901', 'Cliente 2', 'cliente2@example.com', '234567890', CURRENT_TIMESTAMP, 'usuario2'),
('3456789012', 'Cliente 3', 'cliente3@example.com', '345678901', CURRENT_TIMESTAMP, 'usuario3'),
('4567890123', 'Cliente 4', 'cliente4@example.com', '456789012', CURRENT_TIMESTAMP, 'usuario4');


INSERT INTO "person_type" ("name") 
VALUES 
('Tipo de persona 1'),
('Tipo de persona 2'),
('Tipo de persona 3'),
('Tipo de persona 4');

INSERT INTO "product_type" ("name") 
VALUES 
('Tipo de producto 1'),
('Tipo de producto 2'),
('Tipo de producto 3'),
('Tipo de producto 4');

INSERT INTO "category" ("name", "description", "person_type_fk", "product_type_fk") 
VALUES 
('Categoría 1', 'Descripción de categoría 1', 1, 1),
('Categoría 2', 'Descripción de categoría 2', 2, 2),
('Categoría 3', 'Descripción de categoría 3', 3, 3),
('Categoría 4', 'Descripción de categoría 4', 4, 4);

INSERT INTO "product" ("name", "description", "original_price", "liquidation_price", "front_view_path", "back_view_path", "category_fk") 
VALUES 
('Producto 1', 'Descripción de producto 1', 100.00, 80.00, '/path/to/front1.jpg', '/path/to/back1.jpg', 1),
('Producto 2', 'Descripción de producto 2', 50.00, 40.00, '/path/to/front2.jpg', '/path/to/back2.jpg', 2),
('Producto 3', 'Descripción de producto 3', 80.00, 60.00, '/path/to/front3.jpg', '/path/to/back3.jpg', 3),
('Producto 4', 'Descripción de producto 4', 120.00, 100.00, '/path/to/front4.jpg', '/path/to/back4.jpg', 4);