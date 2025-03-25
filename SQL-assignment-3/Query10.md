# Problem Statement: Total Items in Various Virtual Facilities - Retailers need to study the relation of inventory levels of products to the type of facility it's stored at. Retrieve all inventory levels for products at locations and include the facility type Id. Do not retrieve facilities that are of type Virtual.

## Attributes
- **PRODUCT_ID**
- **FACILITY_ID**
- **FACILITY_TYPE_ID**
- **QUANTITY_ON_HAND_TOTAL**
- **AVAILABLE_TO_PROMISE_TOTAL**

```
-- Query to get the stock of product in virtual facilities
select
	ii.PRODUCT_ID ,
	ii.FACILITY_ID ,
	f.FACILITY_TYPE_ID,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL 
from
	inventory_item ii
join facility f on
	f.FACILITY_ID = ii.FACILITY_ID
where
	f.FACILITY_TYPE_ID = 'VIRTUAL_FACILITY'
	or f.FACILITY_TYPE_ID = 'CONFIGURATION';
```

-- Cost: 59,409.3

![image](https://github.com/user-attachments/assets/ed157ad5-8a41-4c78-95f6-2cb71e926196)

