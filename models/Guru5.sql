{{
    config(
        materialized = 'ephemeral'
    )
}}

select *,'{{invocation_id}}' as invocation_id from {{source("guru_source","USERS")}}