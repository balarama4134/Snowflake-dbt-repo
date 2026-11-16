{#use following for commeting#}
{# place your comment here #}


{#1)Datatypes operations in jinja#}
{#string#}
{{"guru"}}
{#integer#} 
{{22224232242}}
{#multiple strings#}
{{'a','b','c','d','e'}}
{#list of strings#}
{{['a','b','c','d','e']}}
{#dictionary#}
{{{"name":"Guru","age":27,"address":"Kadapa"}}}
{#set or tuple#}
{{('a','b','c','d','e')}}
{#Boolean values#}
{{True}}
{{False}}

{#2)Varibales in jinja#}
{%- set var1="Guru" -%}
{%- set var2={"name":"Guru","age":27,"address":"Kadapa"} -%}
{{var1,var2}}

{#Condition Logics#}
{#1#}
{%- if 1==1 -%}
  {{"I am inside first block"}}
{%- else -%}
  {{"I am inside second block"}}
{%endif%}

{#2#}
{%- if 1==2 -%}
 {{"I am inside Second block"}}
{%- elif 1==3 -%}
 {{"I am inside 3rd block"}}
{%- else -%}
  {{"I am inisde first block"}}
{%endif%}



