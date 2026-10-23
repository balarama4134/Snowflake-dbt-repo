{{
    config(
        materialized = 'ephemeral'
    )
}}

select * from {{source("guru_source","USERS")}}