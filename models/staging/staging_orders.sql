{{config(
    database= 'STAGING',
    schema = 'stg'
)}}

with raw_data as (
    select * from {{source("Guru_project","raw_orders")}}
),

final as (
    select ID as Order_ID,ORDER_DATE,STATUS,USER_ID as CUSTOMER_ID from raw_data
)

select * from final