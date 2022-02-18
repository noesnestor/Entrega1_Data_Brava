{{ config(materialized='table', sort='timestamp', dist='user_id') }}

with source_table as 
(
    select * from {{ source('postgres_table', 'users') }}
),

final as
(
    select * from source_table
)

select * from final