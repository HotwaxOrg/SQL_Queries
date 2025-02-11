select
	oh.SALES_CHANNEL_ENUM_ID ,
	count(oh.ORDER_ID) TotalOrder,
	sum(oh.GRAND_TOTAL) TotalRevenue,
	CONCAT(
        MIN(DATE(oh.ORDER_DATE)), ' to ', MAX(DATE(oh.ORDER_DATE))
    )  ReportingPeriod
from
	order_header oh
group by
	oh.SALES_CHANNEL_ENUM_ID ;