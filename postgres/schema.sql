CREATE TABLE "Customers"
(
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1000 MAXVALUE 2147483647 CACHE 1 ),
    "FirstName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Email" character varying(255) COLLATE pg_catalog."default",
    "Mobile" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "DateAdded" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "DateUpdated" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "IsActive" boolean NOT NULL DEFAULT true,
    CONSTRAINT customers_pk PRIMARY KEY ("Id")
);

ALTER TABLE "Customers" OWNER to myshopdb_user;

CREATE TABLE "Addresses"
(
    "Id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1000 MAXVALUE 9223372036854775807 CACHE 1 ),
    "AddressLine1" character varying(250) COLLATE pg_catalog."default",
    "AddressLine2" character varying(250) COLLATE pg_catalog."default",
    "Suburb" character varying(50) COLLATE pg_catalog."default",
    "City" character varying(20) COLLATE pg_catalog."default",
    "PostCode" character varying(20) COLLATE pg_catalog."default",
    "CountryCode" character varying(10) COLLATE pg_catalog."default",
    "DateAdded" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "DateUpdated" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT addresses_pk PRIMARY KEY ("Id")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "Addresses" OWNER to myshopdb_user;

CREATE TABLE "CustomerAddresses"
(
    "Id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1000 MAXVALUE 9223372036854775807 CACHE 1 ),
    "CustomerId" bigint REFERENCES "Customers"("Id"),
    "AddressId" bigint REFERENCES "Addresses"("Id"),
    "DateAdded" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "DateUpdated" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT customeraddresses_pk PRIMARY KEY ("Id")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "CustomerAddresses" OWNER to myshopdb_user;
