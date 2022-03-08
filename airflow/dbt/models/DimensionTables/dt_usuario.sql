with usuario as
(
    select
    id,
    is_superuser,
    encuesta_completada,
    is_staff,
    is_active

    from {{ source('staging','polls_usuario') }}
)

select * from usuario