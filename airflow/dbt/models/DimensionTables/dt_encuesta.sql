with encuesta as
(
    select
    id,
    esta_completada,
    fecha_limite,
    titulo
    
    from {{ source('staging','polls_encuesta') }}
)

select * from encuesta