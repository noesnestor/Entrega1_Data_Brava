with usuario as
(
    select
    id,
    is_superuser

    from {{ source('staging','polls_usuario') }}
)

select * from usuario