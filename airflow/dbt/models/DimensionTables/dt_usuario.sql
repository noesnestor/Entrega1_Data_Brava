with usuario as
(
    select
    id,
    is_superuser,
    is_staff,
    is_active

    from {{ source('staging','polls_usuario') }}
)

select * from usuario