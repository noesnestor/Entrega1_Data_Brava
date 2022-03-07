with rol as
(
    select
    id,
    nombre_rol

    from {{ source('staging','polls_rol') }}
)

select * from rol