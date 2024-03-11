-- Database: schema

-- DROP DATABASE IF EXISTS schema;

CREATE DATABASE schema
    WITH
    ENCODING = 'UTF8'
;

CREATE TABLE IF NOT EXISTS public.discount
(
    id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    "desc" text COLLATE pg_catalog."default" NOT NULL,
    discount_percent double precision NOT NULL,
    active boolean NOT NULL,
    created_at time with time zone NOT NULL,
    modified_at time with time zone NOT NULL,
    deleted_at time with time zone NOT NULL,
    CONSTRAINT discount_pkey PRIMARY KEY (id),
    CONSTRAINT discount_id_key UNIQUE (id)
)

CREATE TABLE IF NOT EXISTS public.product_category
(
    id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    "desc" text COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone NOT NULL,
    CONSTRAINT product_category_pkey PRIMARY KEY (id),
    CONSTRAINT product_category_id_key1 UNIQUE (id)
)

CREATE TABLE IF NOT EXISTS public.product_inventory
(
    id integer NOT NULL,
    quantity integer NOT NULL,
    created_at time with time zone NOT NULL,
    modified_at time with time zone NOT NULL,
    deleted_at time with time zone NOT NULL,
    CONSTRAINT product_inventory_pkey PRIMARY KEY (id),
    CONSTRAINT product_inventory_id_key1 UNIQUE (id),
    CONSTRAINT product_inventory_id_fkey FOREIGN KEY (id)
        REFERENCES public.product (inventory_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

CREATE TABLE IF NOT EXISTS public.product
(
    id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    "desc" text COLLATE pg_catalog."default" NOT NULL,
    "SKU" character varying COLLATE pg_catalog."default" NOT NULL,
    category_id integer NOT NULL,
    inventory_id integer NOT NULL,
    price double precision NOT NULL,
    discount_id integer NOT NULL,
    created_at time with time zone NOT NULL,
    modified_at time with time zone NOT NULL,
    deleted_at time with time zone NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (id),
    CONSTRAINT product_category_id_key UNIQUE (category_id),
    CONSTRAINT product_discount_id_key UNIQUE (discount_id),
    CONSTRAINT product_inventory_id_key UNIQUE (inventory_id),
    CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.product_category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT product_discount_id_fkey FOREIGN KEY (discount_id)
        REFERENCES public.discount (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)