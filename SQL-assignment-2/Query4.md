# Question: Store-Specific (Facility-Wise) Revenue - Different physical or online stores (facilities) may have varying levels of performance. The business wants to compare revenue across facilities for sales planning and budgeting.

## Attributes
- **FACILITY_ID**
- **FACILITY_NAME**
- **TOTAL_ORDERS**
- **TOTAL_REVENUE**
- **DATE_RANGE**

```
-- Fetching the attributes
-- Fetching the attributes
select
	f.FACILITY_ID ,
	f.FACILITY_NAME ,
	count(oi.ORDER_ID) Total_Orders,
	sum(oi.UNIT_PRICE) Total_Revenue,
	CONCAT(
        MIN(DATE(oh.ORDER_DATE)), ' to ', MAX(DATE(oh.ORDER_DATE))
    ) as Date_Range
from
	order_item oi
	-- Getting the order details
join order_header oh on
	oh.ORDER_ID = oi.ORDER_ID
	and oh.STATUS_ID = "ORDER_COMPLETED"
	-- Getting the shipment details
join shipment s on
	s.PRIMARY_ORDER_ID = oh.ORDER_ID
	-- Getting the facility details
join facility f on
	f.FACILITY_ID = s.ORIGIN_FACILITY_ID
group by
	f.FACILITY_ID
order by
	total_orders desc;
```

-- Query Cost: 262,736.98

![image](https://github.com/user-attachments/assets/f6fb7955-ceb4-450e-9cc0-31ef729727cf)
