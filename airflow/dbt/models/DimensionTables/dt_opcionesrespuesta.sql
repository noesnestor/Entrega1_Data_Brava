with opcionesrespuesta as
(
    select
    id,
    opciones

    from {{ source('staging','polls_opcionesrespuesta') }}
)

select * from opcionesrespuesta