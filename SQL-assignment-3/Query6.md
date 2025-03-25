# Problem Statement:  Orders with Multiple Returns - Analyzing orders with multiple returns can identify potential fraud, chronic issues with certain items, or inconsistent shipping processes.

## Attributes
- **ORDER_ID**
- **RETURN_ID**
- **RETURN_DATE**
- **RETURN_REASON**
- **RETURN_QUANTITY**

```
-- Fetching the columns
select
	ri.ORDER_ID ,
	rh.RETURN_ID ,
	rh.RETURN_DATE ,
	ri.RETURN_REASON_ID ,
	ri.RETURN_QUANTITY
from
	return_header rh
	-- Fetching the order id, return reason id and quantity
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
where
	ri.RETURN_QUANTITY > 1;
```

-- Cost: 1,121.71

![image](https://github.com/user-attachments/assets/c9a7256e-a2ac-467b-ad80-988d23a4c671)
