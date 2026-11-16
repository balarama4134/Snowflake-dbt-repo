{{config(
    database= 'STAGING',
    schema = 'stg'
)}}

with raw_data as(
    select * from {{source("Guru_project","raw_payments")}}
),
final as (
    select ID as Payment_Id,
    ORDER_ID,
    PAYMENT_METHOD AS PAYMENT_MODE,
    AMOUNT/100 as AMOUNT
    from raw_data
)

select * from final