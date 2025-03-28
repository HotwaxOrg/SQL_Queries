# Problem Statement: Merchants need to track only physical items (requiring shipping and fulfillment) for logistics and shipping-cost analysis.

## Attributes
- **ORDER_ID**  
- **ORDER_ITEM_SEQ_ID**  
- **PRODUCT_ID**  
- **PRODUCT_TYPE_ID**  
- **SALES_CHANNEL_ENUM_ID**  
- **ORDER_DATE**  
- **ENTRY_DATE**  
- **STATUS_ID**  
- **STATUS_DATETIME**  
- **ORDER_TYPE_ID**  
- **PRODUCT_STORE_ID**

```
-- Fetching the columns 
select
	oi.ORDER_ID ,
	oi.ORDER_ITEM_SEQ_ID ,
	oi.PRODUCT_ID ,
	p.PRODUCT_TYPE_ID,
	oh.SALES_CHANNEL_ENUM_ID ,
	oh.ORDER_DATE ,
	oh.ENTRY_DATE ,
	oh.STATUS_ID ,
	os.STATUS_DATETIME,
	oh.ORDER_TYPE_ID ,
	oh.PRODUCT_STORE_ID
from
	order_item oi
	-- Getting the order type, sales channel , order and entry date , status id and product store id
join order_header oh on
	oh.ORDER_ID = oi.ORDER_ID
	-- Getting the product type id 
join product p on
	p.PRODUCT_ID = oi.PRODUCT_ID
	-- To check whether the product is physical or digital
join product_type pt on
	pt.PRODUCT_TYPE_ID = p.PRODUCT_TYPE_ID
	-- Getting the status date time
join order_status os on
	os.ORDER_ID = oi.ORDER_ID
	and os.STATUS_ID = oh.STATUS_ID
	-- Filtering out as per our requirement
where
	pt.IS_PHYSICAL = 'y'
	and oh.ORDER_TYPE_ID = 'SALES_ORDER'
	and oh.STATUS_ID = 'ORDER_COMPLETED';
```

-- Cost: 112,104.67

![image](https://github.com/user-attachments/assets/bec29158-67c8-4431-884e-0470c717943c)

