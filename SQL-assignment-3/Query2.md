# Problem Statement: Customer service and finance often need insights into returned items to manage refunds, replacements, and inventory restocking.

## Attributes
- **RETURN_ID**  
- **ORDER_ID**  
- **PRODUCT_STORE_ID**  
- **STATUS_DATETIME**  
- **ORDER_NAME**  
- **FROM_PARTY_ID**  
- **RETURN_DATE**  
- **ENTRY_DATE**  
- **RETURN_CHANNEL_ENUM_ID**  

```
-- Fetching the columns
select
	rh.RETURN_ID ,
	ri.ORDER_ID ,
	oh.PRODUCT_STORE_ID ,
	rs.STATUS_DATETIME ,
	oh.ORDER_NAME,
	rh.FROM_PARTY_ID ,
	rh.RETURN_DATE ,
	rh.ENTRY_DATE ,
	rh.RETURN_CHANNEL_ENUM_ID 
from
	return_header rh
	-- Getting the order id
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
	-- Getting the store id and order name
join order_header oh on
	oh.ORDER_ID = ri.ORDER_ID
	-- Getting the return status datetime
join return_status rs on
	rs.RETURN_ID = rh.RETURN_ID
;
```

-- Cost: 15,830.44

![image](https://github.com/user-attachments/assets/0cc180de-8bab-45e3-9841-0742c6ffa85e)
