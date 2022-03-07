{{ config(materialized='table', unlogged=True) }}

with source_table as 
(
    select * from {{ source('staging', 'polls_rol') }}
),

final as
(
    select id, nombre_rol from source_table
)

select * from final
