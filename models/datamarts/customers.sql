with customers as (
    select * from {{ref('staging_cust')}}
),

payments as (
    select * from {{ref('staging_payments')}}
),

orders as (
    select * from {{ref('staging_orders')}}
),

customer_level_details as (
    select c.customer_id,
    min(o.order_date) as first_order_date,
    max(o.order_date) as latest_order_date
    from customers c 
    left join orders o on c.customer_id = o.customer_id
    group by c.customer_id
),

payment_details as (
    select o.customer_id,
    sum(p.amount) as amount 
    from payments p 
    left join orders o on o.order_id = p.order_id
    group by o.customer_id
),


final as(
    select cl.* from customer_level_details cl left join payment_details pd on cl.customer_id = pd.customer_id
)

select * from final