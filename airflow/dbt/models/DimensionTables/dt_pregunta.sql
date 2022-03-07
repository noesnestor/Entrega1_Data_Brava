with pregunta as
(
    select
    id,
    texto

    from {{ source('staging','polls_pregunta') }}
)

select * from pregunta

