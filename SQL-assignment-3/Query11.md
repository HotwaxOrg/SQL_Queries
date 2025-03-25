# Problem Statement: Transfer Orders Without Inventory Reservation When transferring stock between facilities, the system should reserve inventory. If it isn’t reserved, the transfer may fail or oversell.

## Attributes
- **TRANSFER_ORDER_ID**  
- **FROM_FACILITY_ID**  
- **TO_FACILITY_ID**  
- **PRODUCT_ID**  
- **REQUESTED_QUANTITY**  
- **RESERVED_QUANTITY**  
- **TRANSFER_DATE**  
- **STATUS**

```
select
	it.ORDER_ID TRANSFER_ORDER_ID,
	it.FACILITY_ID FROM_FACILITY_ID,
	it.FACILITY_ID_TO TO_FACILITY_ID,
	it.PRODUCT_ID ,
	it.QUANTITY REQUESTED_QUANTITY,
	it.SEND_DATE TRANSFER_DATE,
	it.STATUS_ID STATUS
from
	inventory_transfer it ;
```

-- Cost: 0.35
![image](https://github.com/user-attachments/assets/2a7f3a34-fd0c-46c9-b7b6-8581dd88b53f)
