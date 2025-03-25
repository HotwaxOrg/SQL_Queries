# Question: Total Orders by Sales Channel - Marketing and sales teams want to see how many orders come from each channel (e.g., web, mobile app, in-store POS, marketplace) to allocate resources effectively.

## Attributes
- **SALES_CHANNEL**
- **TOTAL_ORDERS**
- **TOTAL_REVENUE**
- **REPORTING_PERIOD**

```
select
	oh.SALES_CHANNEL_ENUM_ID SALES_CHANNEL,
	count(oh.ORDER_ID) TOTAL_ORDERS,
	sum(oh.GRAND_TOTAL) TOTAL_REVENUE,
	CONCAT(
        MIN(DATE(oh.ORDER_DATE)), ' to ', MAX(DATE(oh.ORDER_DATE))
    ) REPORTING_PERIOD
from
	order_header oh
group by
	oh.SALES_CHANNEL_ENUM_ID ;
```

-- Query Cost: 8,450.55

![image](https://github.com/user-attachments/assets/51d36ab3-811e-4653-9c6b-c350788d76af)
