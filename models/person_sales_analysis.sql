select *,
{{percentage_change ('sales1','sales2')}} as change1,
{{percentage_change('sales2','sales3')}} as change2,
{{percentage_change('sales3','sales1')}} as change3
from
{{source("guru_source",'person_sales')}}