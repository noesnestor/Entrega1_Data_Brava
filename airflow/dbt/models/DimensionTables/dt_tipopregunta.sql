with tipo_pregunta as
(
    select
    id,
    tipo as tipo_pregunta,
    dato

    from {{ source('staging','polls_tipopregunta') }}
)

select * from tipo_pregunta