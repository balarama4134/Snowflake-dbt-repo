select * from {{source("guru_source","USERS")}}

{# to get all the column values from country columnas a list#}
{%- set list_of_cntries = dbt_utils.get_column_values(source("guru_source","USERS"),'country') -%}
{% do log(list_of_cntries, info=True) %}

{# to get all the columns value from country column through iterating#}
{%- set list_of_cntries = dbt_utils.get_column_values(source("guru_source","USERS"),'country') -%}
{%- for i in list_of_cntries -%}
{{i}}
{% endfor %}

{# to get only India value from country column#}
{%- set list_of_cntries = dbt_utils.get_column_values(source("guru_source","USERS"),'country') -%}
{%- for i in list_of_cntries -%}
{%- if i=='India' -%}
{{i}}
{% endif %}
{% endfor %}

{#Using adapter built in function to get entire schema information as a list of tuples#}
{% set list_of_cols = adapter.get_columns_in_relation(source("guru_source","USERS")) %}
{% do log(list_of_cols, info=True) %}

{# looping through columns to get entire schema information #}
{%- set list_of_cols = adapter.get_columns_in_relation(source("guru_source","USERS")) -%}
{%- for i in list_of_cols -%}
{{i}}
{% endfor %}

{#to get just columns names#}
{%- set col_names=adapter.get_columns_in_relation(source("guru_source","USERS")) -%}
{%- for i in col_names -%}
{{i.column}}
{% endfor %}
