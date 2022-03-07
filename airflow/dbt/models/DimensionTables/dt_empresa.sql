{{ config(materialized='table', unlogged=True) }}

with empresa as 
(
    select * 
    from {{ source('staging', 'polls_empresa') }}
),

rubro as
(
    select * 
    from {{ source('staging', 'polls_rubro') }} 
),

final as
(
    select 
        rut as pk, nombre_fantasia, certificacion_brava_inicio, certificacion_brava_fin, razon_social,
        cantidad_empleados, rubro, fecha_creacion, direccion, mail_contacto, telefono_contacto, web_empresa
    from empresa inner join rubro on empresa.rubro_id = rubro.id
)

select * from final