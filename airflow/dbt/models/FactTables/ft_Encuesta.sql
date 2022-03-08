/*falta poner la id de la dimension*/

with respuesta as
(
    select 
    id as id_respuesta,
    respuesta as texto_respuesta,
    id_usuario_id as id_usuario,
    id_pregunta_id as id_pregunta

    from {{ source('staging2','polls_respuesta') }}
),

empresa as
(
    select 
    id as id_empresa,
    rubro_id as id_rubro,
    ceo_id as id_ceo
    
    from {{ source('staging2','polls_empresa') }}
),

encuesta as
(
    select 
    id as id_encuesta,
    tipo_encuesta_id as id_tipo_encuesta
    
    from {{ source('staging2','polls_encuesta') }}
),

opcionesrespuesta as
(
    select 
    id as id_opcionesrespuesta,
    id_pregunta_id as id_pregunta

    from {{ source('staging2','polls_opcionesrespuesta') }}
),

pregunta as
(
    select 
    id as id_pregunta,
    id_encuesta_id as id_encuesta,
    tipo_pregunta_id as id_tipo_pregunta 
    
    from {{ source('staging2','polls_pregunta') }}
),

rol as
(
    select id as id_rol from {{ source('staging2','polls_rol') }}
),

tipoencuesta as
(
    select id as id_tipo_encuesta from {{ source('staging2','polls_tipoencuesta') }}
),

tipopregunta as 
(
    select id as id_tipo_pregunta from {{ source('staging2','polls_tipopregunta') }}
),

usuario as
(
    select 
    id as id_usuario,
    id_empresa_id as id_empresa,
    id_encuesta_id as id_encuesta,
    rol_id as id_rol
    
    from {{ source('staging2','polls_usuario') }}
),

parte1 as
/* Joinear la tabla de opciones respuesta con la tabla de preguntas. Opciones respuesta es una tabla casi que aislada, asi que hay que unirla primero*/
(
    select o_r.id_opcionesrespuesta, pre.id_pregunta, pre.id_tipo_pregunta, pre.id_encuesta
    from opcionesrespuesta as o_r
    inner join pregunta as pre
    on o_r.id_pregunta = pre.id_pregunta
),

parte2 as
/* Joinear la tabla respuesta con la tabla de usuario, esto obtiene empresa, rol y encuesta, con la última id siendo la que utilizaremos para el último join*/
(
    select res.id_respuesta, res.texto_respuesta, us.id_encuesta, us.id_usuario, us.id_empresa, us.id_rol
    from respuesta as res
    inner join usuario as us
    on res.id_usuario = us.id_usuario
),

parte3 as
/* Joinear encuesta con la segunda tabla, para obtener una tabla que tiene el id del tipo de encuesta. Necesitamos este dato para ver como separaremos las fact tables.*/
(
    select p2.*, poll.id_tipo_encuesta
    from parte2 as p2
    inner join encuesta as poll
    on p2.id_encuesta = poll.id_encuesta
),

parte4 as
/* Joinear la primera tabla con la tercera en pos de tener una tabla con todos los datos */
(
    select * 
    from parte3 as p3
    inner join parte1 as p1
    on p3.id_encuesta = p1.id_encuesta
),

/* hacer que se seleccione únicamente las id que correspondan al tipo_encuesta "encuesta" */
final as
(
    select * from parte4 where parte4.id_tipo_encuesta = 2
)

select * from final