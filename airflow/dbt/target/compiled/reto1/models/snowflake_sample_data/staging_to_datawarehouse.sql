

with source_table as 
(
    select * from "postgres"."staging_schema"."users"
),

final as
(
    select * from source_table
)

select * from final