# Question:  BOPIS Orders Revenue (Last Year) - BOPIS (Buy Online, Pickup In Store) is a key retail strategy. Finance wants to know the revenue from BOPIS orders for the previous year.

## Attributes
- **TOTAL_ORDERS**
- **REVENUE**

```
-- Fetching the attributes
select
	count(oh.ORDER_ID) as Total_Orders,
	sum(oh.GRAND_TOTAL) as Revenu
from
	order_header oh
join order_item_ship_group oisg on
	oisg.ORDER_ID = oh.ORDER_ID
where
	oisg.SHIPMENT_METHOD_TYPE_ID = 'STOREPICKUP'
	and (oh.SALES_CHANNEL_ENUM_ID = 'CSR_SALES_CHANNEL'
		or oh.SALES_CHANNEL_ENUM_ID = 'WEB_SALES_CHANNEL')
	and oh.ORDER_DATE between '2024-01-01' and '2024-12-31';
```

-- Query Cost: 3,042.95

![image](https://github.com/user-attachments/assets/4cfeac1c-267f-41de-846e-c704126e3399)


