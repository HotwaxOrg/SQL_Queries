## Problem Statement: Single-Return Orders (Last Month) - The mechandising team needs a list of orders that only have one return.

# Attributes
- **PARTY_ID**
- **FIRST_NAME**

```
-- Fetching the columns
select
	rh.from_party_id PARTY_ID ,
	p2.FIRST_NAME
from
	return_header rh
	-- Getting the party details 
	-- Getting the order details
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
join party p on
	p.PARTY_ID = rh.FROM_PARTY_ID
join person p2 on
	p2.PARTY_ID = rh.FROM_PARTY_ID
	-- Filtering out party with single return count
group by
	ri.ORDER_ID
having
	count(rh.RETURN_ID) = 1;
```

-- Cost: 13,258.56

![image](https://github.com/user-attachments/assets/fe2828d4-5247-4e37-83f6-6be7d87c7798)
