with pregunta as
(
    select
    id,
    texto,
    dimension

    from {{ source('staging','polls_pregunta') }}
)

select * from pregunta

