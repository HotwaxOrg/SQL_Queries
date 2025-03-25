# Problem Statement: Returns and Appeasements: The retailer needs the total amount of items, were returned as well as how many appeasements were issued.

## Attributes
- **TOTAL_RETURNS**
- **RETURN_TOTAL**
- **TOTAL_APPEASEMENTS**
- **APPEASEMENTS_TOTAL**

```
-- Fetching the columns
select
	count(ri.return_item_seq_id) as total_returns,
	sum(ri.return_quantity * ri.return_price) as return_total,
	count(ra.return_adjustment_id) as total_appeasements,
	sum(ra.amount) as appeasement_total
from
	return_header rh
left join return_item ri
    on
	rh.return_id = ri.RETURN_ID
left join return_adjustment ra
    on
	rh.return_id = ra.return_id
where
	ra.return_adjustment_type_id = "APPEASEMENT";
```

-- Cost: 694.38

![image](https://github.com/user-attachments/assets/78854f7a-a098-471f-ab14-b7725467ace7)

