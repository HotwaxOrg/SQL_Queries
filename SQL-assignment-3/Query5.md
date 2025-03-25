# Problem Statement:  Detailed Return Information - Certain teams need granular return data (reason, date, refund amount) for analyzing return rates, identifying recurring issues, or updating policies.

## Attributes
- **RETURN_ID**  
- **ENTRY_DATE**  
- **RETURN_ADJUSTMENT_TYPE_ID** (refund type, store credit, etc.)  
- **AMOUNT**  
- **COMMENTS**  
- **ORDER_ID**  
- **ORDER_DATE**  
- **RETURN_DATE**  
- **PRODUCT_STORE_ID**

```
-- Fetching the columns
select
	rh.RETURN_ID ,
	rh.ENTRY_DATE ,
	rh.RETURN_DATE ,
	ri.ORDER_ID ,
	oh.ORDER_DATE ,
	oh.PRODUCT_STORE_ID ,
	ra.RETURN_ADJUSTMENT_TYPE_ID ,
	ra.AMOUNT ,
	ra.COMMENTS
from
	return_header rh
	-- Getting the order id
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
	-- Getting the order details
join order_header oh on
	oh.order_id = ri.ORDER_ID
	-- Getting the adjustment type, amount and comments
join return_adjustment ra on
	ra.RETURN_ID = rh.RETURN_ID ;
```

-- Cost: 7,657.24


![image](https://github.com/user-attachments/assets/5b26a288-8446-4e69-960f-6cd33c104359)

