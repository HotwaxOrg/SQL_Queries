# Question:  Orders Completed Hourly - Operations teams may want to see how orders complete across the day to schedule staffing.

## Attributes
- **TOTAL_ORDER**
- **HOURS**

```
-- Fetching the attributes
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
```

-- Query Cost: 15,106.45

![image](https://github.com/user-attachments/assets/1106b4c0-09f2-4404-a9a6-bd4fe05de2b8)
