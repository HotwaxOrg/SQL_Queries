select
	count(distinct oa.ORDER_ID) TOTAL_ORDERS,
	sum(oa.AMOUNT) TOTAL_SHIPPING_REVENUE ,
	DATE_FORMAT('2023-07-01', '%M') as MONTH_NAME
from
	order_adjustment oa
join order_header oh on
	oh.ORDER_ID = oa.ORDER_ID
where
	oa.ORDER_ADJUSTMENT_TYPE_ID = 'SHIPPING_CHARGES'
	and oh.ORDER_DATE between '2023-07-01' and '2023-07-31'
group by
	oa.ORDER_ADJUSTMENT_TYPE_ID;