--DBMS ASSIGNMENT

create table "user"
("user_id" uuid not null  default uuid_generate_v4(),
"name" character varying not null,
"address" character varying not null,
"phone_number" character varying not null,
"email" character varying not null,
"password" character varying not null,
CONSTRAINT "CONSTRAINT_PK_user" PRIMARY key ("user_id")
);


create table product
("product_id" uuid not null  default uuid_generate_v4(),
"name" character varying not null,
"description" character varying not null,
"price" integer not null,
"sku" character varying not null,
"product_category" character varying not null,
CONSTRAINT "CONSTRAINT_PK_product" PRIMARY key ("product_id")
);


create table "order"
("order_id" uuid not null default uuid_generate_v4(),
"user_id" uuid not null  default uuid_generate_v4(),
"address_id" uuid not null  default uuid_generate_v4(),
"price" integer not null,
CONSTRAINT "CONSTRAINT_PK_order" PRIMARY key ("order_id"),
CONSTRAINT "CONSTRAINT_FK_user" Foreign key ("user_id") references "user"("user_id"),
CONSTRAINT "CONSTRAINT_FK_address" Foreign key ("address_id") references "address"("address_id")
);


create table "order_product"
("order_id" uuid not null  default uuid_generate_v4(),
"product_id" uuid not null  default uuid_generate_v4(),
"product_count" integer not null,
CONSTRAINT "CONSTRAINT_FK_order" Foreign key ("order_id") references "order"("order_id"),
CONSTRAINT "CONSTRAINT_FK_product" Foreign key ("product_id") references "product"("product_id")
);


create table "address"
("address_id" uuid not null  default uuid_generate_v4(),
"user_id" uuid not null  default uuid_generate_v4(),
"address" character varying not null,
CONSTRAINT "CONSTRAINT_PK_address" PRIMARY key ("address_id")
);



INSERT INTO public."user"
(user_id, "name", address, phone_number, email, "password")
VALUES(uuid_generate_v4(), 'Harry', 'Edinburg', '1423515624', 'harry@gmail.com', 'harry@123'),
(uuid_generate_v4(), 'Ron', 'Amsterdam', '1475515624', 'ron@gmail.com', 'ron@123'),
(uuid_generate_v4(), 'Hermione', 'Edinburg', '1423253624', 'hermione@gmail.com', 'hermione@123')
;


INSERT INTO public."product"
(product_id, "name", description, price, sku, product_category)
VALUES(uuid_generate_v4(), 'Galays23', 'Smart Phone', 1000, 'P1001', 'Electronics'),
(uuid_generate_v4(), 'RogStrix', 'laptop', 5000, 'P1002', 'Electronics'),
(uuid_generate_v4(), 'Nike Shoes', 'Casual Shoes',2000, 'P1003', 'Foot wear'),
(uuid_generate_v4(), 'T-Shirt', 'Top wear', 8000, 'P1004', 'Textiles'),
(uuid_generate_v4(), 'Jeans', 'Bottom wear',1500, 'P1005', 'Textiles');


INSERT INTO public.address
(address_id, user_id, address)
VALUES(uuid_generate_v4(), '25d761d5-925d-4d40-8ef9-c6658f2640b0', 'abc'),
(uuid_generate_v4(), '3e39d96c-bce0-4f0d-b50b-022403f9a2a3', 'xyz'),
(uuid_generate_v4(), '3e39d96c-bce0-4f0d-b50b-022403f9a2a3', 'ijk'),
(uuid_generate_v4(), 'df8ebc96-251a-4e9d-a1be-a5f99a27cca5', 'lmn'),
(uuid_generate_v4(), 'df8ebc96-251a-4e9d-a1be-a5f99a27cca5', 'pqr');


INSERT INTO public."order"
(order_id, user_id, address_id, price)
VALUES(uuid_generate_v4(), '25d761d5-925d-4d40-8ef9-c6658f2640b0', '15fd4700-41af-4e64-af5f-d2d9f0128bde', 1000),
(uuid_generate_v4(), '25d761d5-925d-4d40-8ef9-c6658f2640b0', '15fd4700-41af-4e64-af5f-d2d9f0128bde', 10000),
(uuid_generate_v4(), '3e39d96c-bce0-4f0d-b50b-022403f9a2a3', '15fd4700-41af-4e64-af5f-d2d9f0128bde', 6000),
(uuid_generate_v4(), '3e39d96c-bce0-4f0d-b50b-022403f9a2a3', '9841d3da-f990-4fa7-b9e1-a1359081a1d6', 8000),
(uuid_generate_v4(), 'df8ebc96-251a-4e9d-a1be-a5f99a27cca5', 'deb9e9aa-c0fc-4b5c-974c-c61ceb6e7014', 1500);



INSERT INTO public.order_product
(order_id, product_id, product_count)
VALUES((select order_id from "order" where price=1000), (select product_id from product where "name"='Galaxys23'), 1),
((select order_id from "order" where price=10000), (select product_id from product where "name"='RogStrix'), 2),
((select order_id from "order" where price=6000), (select product_id from product where "name"='Nike Shoes'), 3),
((select order_id from "order" where price=8000), (select product_id from product where "name"='T-Shirt'), 1),
((select order_id from "order" where price=1500), (select product_id from product where "name"='Jeans'), 1)
;


create index product_index on product("name");

