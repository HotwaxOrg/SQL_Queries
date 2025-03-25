# Question: Canceled Orders (Last Month) - The merchandising team needs to know how many orders were canceled in the previous month and their reasons.

## Attributes
- **TOTAL_ORDERS**
- **CHANGE_REASON**

```
-- Fetching the attributes
select
	count(os.STATUS_ID) Total_Orders,
	os.CHANGE_REASON
from
	order_status os
where
	os.STATUS_ID = 'ORDER_CANCELLED'
	and os.STATUS_DATETIME between '2023-12-01' and '2023-12-31';
```

-- Query Cost: 10,075.39

![image](https://github.com/user-attachments/assets/2c8dc3d5-b719-4f3f-9883-53e954d1a6c0)
