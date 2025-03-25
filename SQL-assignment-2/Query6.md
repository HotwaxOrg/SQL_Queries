# Question: Low Stock or Out of Stock Items Report - Avoiding out-of-stock situations is critical. This report flags items that have fallen below a certain reorder threshold or have zero available stock.

## Attributes
- **PRODUCT_ID**  
- **PRODUCT_NAME**  
- **FACILITY_ID**  
- **QOH** (Quantity on Hand)  
- **ATP** (Available to Promise)  
- **REORDER_THRESHOLD**  
- **DATE_CHECKED**  

```
-- Fetching the columns
select
	distinct p.PRODUCT_ID ,
	p.PRODUCT_NAME ,
	ii.FACILITY_ID ,
	ii.QUANTITY_ON_HAND_TOTAL QUANTITY_ON_HAND,
	ii.AVAILABLE_TO_PROMISE_TOTAL AVAILABLE_TO_PROMISE,
	pf.REORDER_QUANTITY REORDER_THRESHOLD
from
	product p
-- Fetching the inventory details of the product
join inventory_item ii on
	ii.PRODUCT_ID = p.PRODUCT_ID
-- Fetching the reorder quantity abnd last updated stamp
join product_facility pf on
	pf.PRODUCT_ID = p.PRODUCT_ID
;
```

-- Query Cost: 7,735,850.42

![image](https://github.com/user-attachments/assets/4de1fdb0-c514-4397-b74e-2ad0131a2bca)

