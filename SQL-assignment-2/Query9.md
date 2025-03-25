# Question: Order Item Current Status Changed Date-Time - Operations teams need to audit when an order item’s status (e.g., from “Pending” to “Shipped”) was last changed, for shipment tracking or dispute resolution.

## Attributes
- **ORDER_ID**
- **ORDER_ITEM_GROUP_SEQ_ID**
- **CURRENT_STATUS_ID**
- **STATUS_CHANGE_DATE_TIME**
- **CHANGED_BY**

```
select
	oi.ORDER_ID,
	oi.ORDER_ITEM_GROUP_SEQ_ID ,
	os.STATUS_ID CURRENT_STATUS_ID,
	os.STATUS_DATETIME  STATUS_CHANGE_DATE_TIME,
	oi.CHANGE_BY_USER_LOGIN_ID CHANGED_BY
from
	order_item oi
join order_status os on
	os.ORDER_ID = oi.ORDER_ID
	and os.ORDER_ITEM_SEQ_ID = oi.ORDER_ITEM_SEQ_ID ;
```


-- Query Cost: 540,077.25


![image](https://github.com/user-attachments/assets/7ba76ace-5146-4cb4-b640-bac4577e084e)
