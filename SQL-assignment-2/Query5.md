# Question: Lost and Damaged Inventory -Warehouse managers need to track “shrinkage” such as lost or damaged inventory to reconcile physical vs. system counts.

## Attributes
- **INVENTORY_ITEM_ID**  
- **PRODUCT_ID**  
- **FACILITY_ID**  
- **QUANTITY_LOST_OR_DAMAGED**  
- **REASON_CODE** (Lost, Damaged, Expired, etc.)  
- **TRANSACTION_DATE**  

```
-- Fetching the attributes
-- Fetching the attributes
select
	iiv.INVENTORY_ITEM_ID ,
	ii.PRODUCT_ID ,
	ii.FACILITY_ID ,
	iiv.QUANTITY_ON_HAND_VAR as Quantity_LOST_or_DAMAGED,
	iiv.VARIANCE_REASON_ID REASON_CODE,
	iiv.CREATED_TX_STAMP TRANSACTION_DATE
from
	inventory_item_variance iiv
join inventory_item ii on
	(ii.INVENTORY_ITEM_ID = iiv.INVENTORY_ITEM_ID) and (iiv.VARIANCE_REASON_ID = 'VAR_LOST'
	or iiv.VARIANCE_REASON_ID = 'DAMAGED')
;
```


-- Query Cost: 446,760.92

![image](https://github.com/user-attachments/assets/2c15321d-2741-441f-96e3-a1282cdc2e25)

