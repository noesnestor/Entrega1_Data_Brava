with encuesta as
(
    select
    id,
    fecha_limite,
    titulo
    
    from {{ source('staging','polls_encuesta') }}
)

select * from encuesta