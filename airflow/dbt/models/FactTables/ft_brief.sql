with respuesta as
(
    select 
    id,
    respuesta
    
    from {{ source('staging','polls_respuesta') }}
),

dimension as
(
    select id from {{ ref('dt_dimension') }}
),

empresa as
(
    select id from {{ ref('dt_empresa') }}
),

encuesta as
(
    select id from {{ ref('dt_encuesta') }}
),

opcionesrespuesta as
(
    select id from {{ ref('dt_opcionesrespuesta') }}
),

pregunta as
(
    select id from {{ ref('dt_pregunta') }}
),

rol as
(
    select id from {{ ref('dt_rol') }}
),

tipopregunta as 
(
    select id from {{ ref('dt_tipopregunta') }}
),

usuario as
(
    select id from {{ ref('dt_usuario') }}
),

final as
(
    select
    respuesta,
    id 
    from respuesta,
    id from dimension,
    id from empresa,
    id from encuesta,
    id from opcionesrespuesta,
    id from pregunta,
    id from rol,
    id from tipopregunta,
    id from usuario
     
)

select * from final
