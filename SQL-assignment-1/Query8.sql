select
	COUNT(os.STATUS_ID) as Total_Orders,
	DATE_FORMAT(os.STATUS_DATETIME, '%H') Hours
from
	order_status os
where
	os.STATUS_ID = 'ORDER_COMPLETED'
	and os.STATUS_DATETIME between '2023-08-17 00:00:00' and '2023-08-17 23:59:59'
group by
	hour(os.STATUS_DATETIME)
order by
	Hours;
