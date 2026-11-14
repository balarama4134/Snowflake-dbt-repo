{{config(
    materialized = 'incremental'
)}}

select * from {{source("guru_source","dim_sales")}} t1

{% if is_incremental()%}
where t1.CREATED_AT > (select max(CREATED_AT) from {{this}})
{% endif %}


