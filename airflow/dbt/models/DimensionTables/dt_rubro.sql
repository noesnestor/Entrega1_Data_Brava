with rubro as
(
    select
    id,
    rubro

    from {{ source('staging','polls_rubro') }}
)

select * from rubro