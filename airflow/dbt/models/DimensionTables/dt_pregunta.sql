{{ config(materialized='table', unlogged=True) }}

with source_table as 
(
    select * from {{ source('staging', 'polls_pregunta') }}
),

final as
(
    select id, texto, id_encuesta, tipo_pregunta_id from source_table
)

select * from final
