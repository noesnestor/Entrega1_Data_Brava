--
-- PostgreSQL database dump
--

CREATE TABLE public.users (
    "ID" integer NOT NULL,
    "Name" character varying,
    "Age" integer
);

ALTER TABLE public.users OWNER TO postgres;

CREATE SCHEMA IF NOT EXISTS staging_schema;

--
-- PostgreSQL database dump complete
--