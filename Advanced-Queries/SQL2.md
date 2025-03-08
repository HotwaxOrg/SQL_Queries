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
# Cost - 3,851.21
# Explanation - 
The problem statement required to fetch the order items that were not pos sold but not required to ship which meant its shipment method may be store pickup. It selects the order ID, item sequence ID, a single item attribute, and the total item price for each order. The order_header (oh) table is joined with the order_item (oi) table to link orders with their corresponding items. Additionally, the order_item_ship_group (oisg) table is joined to filter orders that were shipped using the store pickup method. A subquery is used to fetch a single attribute name (ATTR_NAME) from the order_item_attribute (oia) table.
![image](https://github.com/user-attachments/assets/5a0cbf0d-d4e2-4df4-864b-acf052616a9d)
