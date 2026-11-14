select * from {{source("guru_source","PAYMENT_MODES")}}

select
SUM(case when PAYMENT_MODE = 'UPI' then sales end) as UPI_SALES,
SUM(case when PAYMENT_MODE = 'cash' then sales end) as Cash_SALES,
SUM(case when PAYMENT_MODE = 'CC' then sales end) as Creditcard_SALES,
SUM(case when PAYMENT_MODE = 'DB' then sales end) as Debitcard_SALES,
SUM(case when PAYMENT_MODE = 'VOUCHER' then sales end) as Voucher_SALES
from {{source("guru_source","PAYMENT_MODES")}}

Select distinct(PAYMENT_MODE) from {{source("guru_source","PAYMENT_MODES")}}

{#Instead of using multiple case statements, use dynamic jinja #}
{% set payment_modes = ['UPI','cash','CC','DB','VOUCHER']%}
select 
{% for i in payment_modes %}
sum(case when payment_mode='{{i}}' then sales end) as {{i}}_sales,
{% endfor %}
from {{source("guru_source","PAYMENT_MODES")}}

{#Above one even more dynamnic instead of providing distinct col values#}
{% set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") %}
select
{% for i in payment_modes %}
    sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i }}_sales
    {% if not loop.last %},{% endif %}
{% endfor %}
from {{ source("guru_source","PAYMENT_MODES") }}


{#loop.first is used to met a condition and put commas before a loop when it is not for first loop #}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i }}_sales
{% if not loop.last %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{# to get your col names as lower#}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | lower}}_sales
{% if not loop.last %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{# to get your col names as upper this is only respect i in iterator which is
col name not additional like _sales#}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | upper}}_sales
{% if not loop.first %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{# Capitalize - To make starting letter Upper case #}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if not loop.last %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}


{# using loop.index similar to loop.first and loop.last#}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if not loop.index > 2 %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{#looping using index and placing commas#}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if  loop.index > 2 %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{#looping using index and length#}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if  loop.index < loop.length %},{% endif %}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{#print index of current loop#}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if  loop.index < loop.length %},{% endif %}
{{loop.index}}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{# using loop.first - gives boolean value #}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if  loop.index < loop.length %},{% endif %}
{{loop.first}}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}

{# using loop.last - gives boolean value #}
{%- set payment_modes = dbt_utils.get_column_values(source("guru_source","PAYMENT_MODES"),"PAYMENT_MODE") -%}
select     
{% for i in payment_modes -%}
sum(case when PAYMENT_MODE = '{{ i }}' then sales end) as {{ i | capitalize}}_sales
{% if  loop.index < loop.length %},{% endif %}
{{loop.first}}
{%- endfor -%}
from {{ source("guru_source","PAYMENT_MODES") }}





