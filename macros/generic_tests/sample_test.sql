{% test sample_test(model) %}

select *
from {{ model }}
where ...

{% endtest %}