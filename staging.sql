--
-- PostgreSQL database dump
--

CREATE SCHEMA IF NOT EXISTS staging_schema;

CREATE TABLE staging_schema.users (
    "ID" integer NOT NULL,
    "Name" character varying,
    "Age" integer
);

ALTER TABLE staging_schema.users OWNER TO postgres;

--
-- PostgreSQL database dump complete
--