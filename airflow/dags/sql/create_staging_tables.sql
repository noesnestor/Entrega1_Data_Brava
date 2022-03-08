DROP SCHEMA IF EXISTS staging CASCADE; -- TODO: buscar una mejor solucion para hacerlo incremental

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS staging.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE staging.auth_group_id_seq OWNED BY staging.auth_group.id;


CREATE TABLE IF NOT EXISTS staging.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


CREATE SEQUENCE IF NOT EXISTS staging.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE staging.auth_group_permissions_id_seq OWNED BY staging.auth_group_permissions.id;

CREATE TABLE IF NOT EXISTS staging.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


CREATE SEQUENCE IF NOT EXISTS staging.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE staging.auth_permission_id_seq OWNED BY staging.auth_permission.id;

CREATE TABLE IF NOT EXISTS staging.polls_empresa (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    nombre_fantasia character varying(30) NOT NULL,
    rut character varying(20) NOT NULL,
    certificacion_brava_inicio timestamp with time zone,
    certificacion_brava_fin timestamp with time zone,
    cantidad_empleados integer NOT NULL,
    razon_social character varying(500) NOT NULL,
    fecha_creacion timestamp with time zone NOT NULL,
    direccion text NOT NULL,
    telefono_contacto character varying(30) NOT NULL,
    mail_contacto character varying(50) NOT NULL,
    web_empresa character varying(200) NOT NULL,
    logo character varying(100),
    cargar_padron character varying(100),
    ceo_id bigint NOT NULL,
    rubro_id bigint NOT NULL
);


CREATE SEQUENCE IF NOT EXISTS staging.polls_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE staging.polls_empresa_id_seq OWNED BY staging.polls_empresa.id;



CREATE TABLE IF NOT EXISTS staging.polls_encuesta (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    fecha_limite timestamp with time zone NOT NULL,
    titulo character varying(20) NOT NULL,
    tipo_encuesta_id bigint
);




CREATE SEQUENCE IF NOT EXISTS staging.polls_encuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





ALTER SEQUENCE staging.polls_encuesta_id_seq OWNED BY staging.polls_encuesta.id;



CREATE TABLE IF NOT EXISTS staging.polls_opcionesrespuesta (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    opciones character varying(20) NOT NULL,
    id_pregunta_id bigint
);





CREATE SEQUENCE IF NOT EXISTS staging.polls_opcionesrespuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





ALTER SEQUENCE staging.polls_opcionesrespuesta_id_seq OWNED BY staging.polls_opcionesrespuesta.id;



CREATE TABLE IF NOT EXISTS staging.polls_pregunta (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    texto character varying(500) NOT NULL,
    id_encuesta_id bigint,
    tipo_pregunta_id bigint,
    dimension character varying(150)
);





CREATE SEQUENCE IF NOT EXISTS staging.polls_pregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





ALTER SEQUENCE staging.polls_pregunta_id_seq OWNED BY staging.polls_pregunta.id;

CREATE TABLE IF NOT EXISTS staging.polls_respuesta (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    respuesta character varying(500) NOT NULL,
    id_pregunta_id bigint,
    id_usuario_id bigint
);




CREATE SEQUENCE IF NOT EXISTS staging.polls_respuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE staging.polls_respuesta_id_seq OWNED BY staging.polls_respuesta.id;

CREATE TABLE IF NOT EXISTS staging.polls_rol (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    nombre_rol character varying(20) NOT NULL
);



CREATE SEQUENCE IF NOT EXISTS staging.polls_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE staging.polls_roles_id_seq OWNED BY staging.polls_rol.id;

CREATE TABLE IF NOT EXISTS staging.polls_rubro (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    rubro character varying(20) NOT NULL
);



CREATE SEQUENCE IF NOT EXISTS staging.polls_rubro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE staging.polls_rubro_id_seq OWNED BY staging.polls_rubro.id;

CREATE TABLE IF NOT EXISTS staging.polls_tipoencuesta (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    tipo_encuesta character varying(20) NOT NULL
);




CREATE SEQUENCE IF NOT EXISTS staging.polls_tipoencuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




ALTER SEQUENCE staging.polls_tipoencuesta_id_seq OWNED BY staging.polls_tipoencuesta.id;

CREATE TABLE IF NOT EXISTS staging.polls_tipopregunta (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    removed timestamp with time zone,
    tipo character varying(20) NOT NULL,
    dato character varying(20) NOT NULL
);



CREATE SEQUENCE IF NOT EXISTS staging.polls_tipopregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE staging.polls_tipopregunta_id_seq OWNED BY staging.polls_tipopregunta.id;

CREATE TABLE IF NOT EXISTS staging.polls_usuario (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    encuesta_completada boolean NOT NULL,
    removed timestamp with time zone,
    id_empresa_id bigint,
    id_encuesta_id bigint,
    rol_id bigint
);

CREATE TABLE IF NOT EXISTS staging.polls_usuario_groups (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    group_id integer NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS staging.polls_usuario_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE staging.polls_usuario_groups_id_seq OWNED BY staging.polls_usuario_groups.id;

CREATE SEQUENCE IF NOT EXISTS staging.polls_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE staging.polls_usuario_id_seq OWNED BY staging.polls_usuario.id;

CREATE TABLE IF NOT EXISTS staging.polls_usuario_user_permissions (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    permission_id integer NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS staging.polls_usuario_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE staging.polls_usuario_user_permissions_id_seq OWNED BY staging.polls_usuario_user_permissions.id;

ALTER TABLE ONLY staging.auth_group ALTER COLUMN id SET DEFAULT nextval('staging.auth_group_id_seq'::regclass);
ALTER TABLE ONLY staging.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('staging.auth_group_permissions_id_seq'::regclass);
ALTER TABLE ONLY staging.auth_permission ALTER COLUMN id SET DEFAULT nextval('staging.auth_permission_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_empresa ALTER COLUMN id SET DEFAULT nextval('staging.polls_empresa_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_encuesta ALTER COLUMN id SET DEFAULT nextval('staging.polls_encuesta_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_opcionesrespuesta ALTER COLUMN id SET DEFAULT nextval('staging.polls_opcionesrespuesta_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_pregunta ALTER COLUMN id SET DEFAULT nextval('staging.polls_pregunta_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_respuesta ALTER COLUMN id SET DEFAULT nextval('staging.polls_respuesta_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_rol ALTER COLUMN id SET DEFAULT nextval('staging.polls_roles_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_rubro ALTER COLUMN id SET DEFAULT nextval('staging.polls_rubro_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_tipoencuesta ALTER COLUMN id SET DEFAULT nextval('staging.polls_tipoencuesta_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_tipopregunta ALTER COLUMN id SET DEFAULT nextval('staging.polls_tipopregunta_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_usuario ALTER COLUMN id SET DEFAULT nextval('staging.polls_usuario_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_usuario_groups ALTER COLUMN id SET DEFAULT nextval('staging.polls_usuario_groups_id_seq'::regclass);
ALTER TABLE ONLY staging.polls_usuario_user_permissions ALTER COLUMN id SET DEFAULT nextval('staging.polls_usuario_user_permissions_id_seq'::regclass);

ALTER TABLE ONLY staging.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);

ALTER TABLE ONLY staging.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);

ALTER TABLE ONLY staging.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);

ALTER TABLE ONLY staging.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_empresa
    ADD CONSTRAINT polls_empresa_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_encuesta
    ADD CONSTRAINT polls_encuesta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_opcionesrespuesta
    ADD CONSTRAINT polls_opcionesrespuesta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_pregunta
    ADD CONSTRAINT polls_pregunta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_respuesta
    ADD CONSTRAINT polls_respuesta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_rol
    ADD CONSTRAINT polls_roles_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_rubro
    ADD CONSTRAINT polls_rubro_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_tipoencuesta
    ADD CONSTRAINT polls_tipoencuesta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_tipopregunta
    ADD CONSTRAINT polls_tipopregunta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_usuario_groups
    ADD CONSTRAINT polls_usuario_groups_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_usuario_groups
    ADD CONSTRAINT polls_usuario_groups_usuario_id_group_id_b3e82601_uniq UNIQUE (usuario_id, group_id);

ALTER TABLE ONLY staging.polls_usuario
    ADD CONSTRAINT polls_usuario_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_usuario_user_permissions
    ADD CONSTRAINT polls_usuario_user_permi_usuario_id_permission_id_c516b116_uniq UNIQUE (usuario_id, permission_id);

ALTER TABLE ONLY staging.polls_usuario_user_permissions
    ADD CONSTRAINT polls_usuario_user_permissions_pkey PRIMARY KEY (id);

ALTER TABLE ONLY staging.polls_usuario
    ADD CONSTRAINT polls_usuario_username_key UNIQUE (username);