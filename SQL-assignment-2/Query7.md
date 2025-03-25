# Question: Retrieve the Current Facility (Physical or Virtual) of Open Orders - The business wants to know where open orders are currently assigned, whether in a physical store or a virtual facility (e.g., a distribution center or online fulfillment location).

## Attributes
- **ORDER_ID**
- **STATUS_ID**
- **FACILITY_ID**
- **FACILITY_NAME**
- **FACILITY_TYPE_ID**

```
-- Fetching the required columns
select
	oh.ORDER_ID ,
	oh.STATUS_ID ,
	ii.FACILITY_ID ,
	f.FACILITY_NAME ,
	f.FACILITY_TYPE_ID
from
	order_header oh
	-- Fetching the inventory item details of an order
join inventory_item_detail iid on
	iid.ORDER_ID = oh.ORDER_ID
	-- Fetching the inventory of an item
join inventory_item ii on
	ii.INVENTORY_ITEM_ID = iid.INVENTORY_ITEM_ID
	-- Fetching the facility details
join facility f on
	f.FACILITY_ID = ii.FACILITY_ID
	-- Applying filters on the records
where
	oh.STATUS_ID = 'ORDER_APPROVED';
```

-- Query Cost: 15,631,140

![image](https://github.com/user-attachments/assets/29408958-30c9-4c45-9437-5919bf5a65e1)
