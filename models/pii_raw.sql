{{config(
    materialized= 'table'
)}}

select * from {{source("guru_source","PII_RAW")}}