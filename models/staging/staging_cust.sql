{{config(
    database= 'STAGING',
    schema = 'stg'
)}}

with raw as (
    select * from {{source("Guru_project","raw_cust")}}
),

final as (
    select ID as CUSTOMER_ID,FIRST_NAME,LAST_NAME from raw
)

select * from final
