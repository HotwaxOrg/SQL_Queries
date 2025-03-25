# Question: Items Where QOH and ATP Differ - Sometimes the Quantity on Hand (QOH) doesn’t match the Available to Promise (ATP) due to pending orders, reservations, or data discrepancies. This needs review for accurate fulfillment planning.

## Attributes
- **PRODUCT_ID**
- **FACILITY_ID**
- **QOH**
- **ATP**
- **DIFFERENCE**

```
-- Fetching the columns
select
	p.PRODUCT_ID ,
	ii.FACILITY_ID ,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL ,
	(ii.QUANTITY_ON_HAND_TOTAL - ii.AVAILABLE_TO_PROMISE_TOTAL ) as Difference
from
	product p
	-- Fetching the QOH and ATP and Facility id	
join inventory_item ii on
	ii.PRODUCT_ID = p.PRODUCT_ID;
```

-- Query Cost: 2,367,489.86

![image](https://github.com/user-attachments/assets/c40699f8-41d1-48f7-9567-9681a11028f6)
