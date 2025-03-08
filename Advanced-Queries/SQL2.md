# Query2 - Digital Order Items
Fetch a list of completed order items that were not POS Completed sales but also did not need to be shipped to the customer.

Fields to include in results:

Order Id
Item Seq Id
Item Attr (select any)
Item total

```
select
	oh.order_id,
	oi.order_item_seq_id item_seq_id,
	(
	select
		oia.ATTR_NAME
	from
		order_item_attribute oia
	limit 1) item_attribute,
	sum(oi.QUANTITY * oi.UNIT_PRICE) item_total
from
	order_header oh
join order_item oi on
	oi.ORDER_ID = oh.ORDER_ID
join order_item_ship_group oisg on
	oisg.ORDER_ID = oi.ORDER_ID
where
	oh.SALES_CHANNEL_ENUM_ID != 'POS_SALES_CHANNEL'
	and oisg.SHIPMENT_METHOD_TYPE_ID = 'STOREPICKUP'
group by
	oh.ORDER_ID;
```
![image](https://github.com/user-attachments/assets/5a0cbf0d-d4e2-4df4-864b-acf052616a9d)
