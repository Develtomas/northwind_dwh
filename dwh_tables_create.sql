-- DATE dimension
select * from dim_date;
drop table dim_date;

create table dim_date (
	date_key int4 not null generated by default as identity,
	date date not null,
	year int2 not null,
	month int2 null,
	day int2 not null,
	weekday_number int2 not null,
	week_number int2 not null,
	workday boolean not null
);

--Product dimension
select * from dim_product;
truncate table dim_product;

create table dim_product (
	product_key int4 not null default 0,
	product_id int4 not null default 0,
	product_name varchar not null,
	unit_price numeric(10,2),
	discontinued boolean not null,
	categorie_name varchar,
	updated_at_src timestamp(0),
	valid_from date,
	valid_to date,
	active boolean,
	created_at timestamp(0),
	updated_at timestamp(0),
	"version" int2
);

--zero str
insert into dim_product 
(product_key, product_id, product_name, unit_price, discontinued, categorie_name, updated_at_src, valid_from, valid_to, active, created_at, updated_at, "version")
values
(0, 0, 'no data', 0, false, 'no data', '1900-01-01', '1900-01-01', '2099-01-01', true, '1900-01-01', '1900-01-01', 1);


--Customer dimension
--DROP TABLE dim_customer;
select * from dim_customer;
truncate table dim_customer;

create table dim_customer (
	customer_key int4 not null default 0,
	customer_id varchar not null default '0',
	company_name varchar not null,
	contact_name varchar,
	address varchar,
	city varchar,
	region varchar,
	postal_code varchar,
	phone varchar,
	fax varchar,
	updated_at_src timestamp(0),
	valid_from date,
	valid_to date,
	active boolean,
	created_at timestamp(0),
	updated_at timestamp(0),
	"version" int2
);

--zero str
insert into dim_customer (
	customer_key, 
	customer_id,
	company_name, 
	contact_name, 
	address, 
	city, 
	region, 
	postal_code, 
	phone, 
	fax, 
	updated_at_src, 
	valid_from, 
	valid_to, 
	active, 
	created_at, 
	updated_at,
	"version"
) values (0, 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', '1900-01-01', '1900-01-01', '2099-01-01', false, '1900-01-01', '1900-01-01', 1);

--Suppliers dimension
drop table if exists dim_supplier;

create table dim_supplier (
	supplier_key int4 not null default 0,
	supplier_id int2 not null default 0,
	company_name varchar not null,
	contact_name varchar,
	address varchar,
	city varchar,
	region varchar,
	postal_code varchar,
	phone varchar,
	fax varchar,
	homepage varchar,
	updated_at_src timestamp(0),
	valid_from date,
	valid_to date,
	active boolean,
	created_at timestamp(0),
	updated_at timestamp(0),
	"version" int2
);

--zero str
insert into dim_supplier (
	supplier_key, 
	supplier_id,
	company_name, 
	contact_name, 
	address, 
	city, 
	region, 
	postal_code, 
	phone, 
	fax,
	homepage,
	updated_at_src, 
	valid_from, 
	valid_to, 
	active, 
	created_at, 
	updated_at,
	"version"
) values (0, 0, 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', 'no data', '1900-01-01', '1900-01-01', '2099-01-01', false, '1900-01-01', '1900-01-01', 1);

--Shipping dimension
drop table if exists dim_shipper;

create table dim_shipper (
	shipper_key int4 not null default 0,
	shipper_id int2 not null default 0,
	company_name varchar not null,
	updated_at_src timestamp(0),
	valid_from date,
	valid_to date,
	active boolean,
	created_at timestamp(0),
	updated_at timestamp(0),
	"version" int2
);

--zero str
insert into dim_shipper (
	shipper_key, 
	shipper_id,
	company_name,
	updated_at_src, 
	valid_from, 
	valid_to, 
	active, 
	created_at, 
	updated_at,
	"version"
) values (0, 0, 'no data', '1900-01-01', '1900-01-01', '2099-01-01', false, '1900-01-01', '1900-01-01', 1);

--Sale facts
--DROP TABLE IF EXISTS fct_sale;

create table fct_sale (
	date_key int not null,
	product_key int not null,
	customer_key int not null,
	supplier_key int not null,
	shipper_key int not null,
	order_id int not null,
	order_date date not null,
	required_date date,
	shipped_date date,
	freight float,
	unit_price numeric(10,2) not null,
	quantity int not null,
	discount numeric(10,2),
	total numeric(10,2) not null,
	total_and_discount numeric(10,2) not null
);

select * from fct_sale fs2;
	
