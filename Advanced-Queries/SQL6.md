# Query6 - Net Transfers

At the end of every month, a retailer wants to see effectivley how much inventory was moved between facilities. Compute the net amount of transfers between all facilities. 
If two facilities transfered a product back and forth with quantity 3 and 2 respectively, the net transfer is 1.

```
select
	s.ORIGIN_FACILITY_ID FACILITY_1,
	s.DESTINATION_FACILITY_ID FACILITY_2,
	p.INTERNAL_NAME PRODUCT_INTERNAL_NAME,
	AVG(oi.QUANTITY) NET_TRANSFERED_QUANTITY
from
	order_header oh
join order_item oi on
	oi.ORDER_ID = oh.ORDER_ID
join order_shipment os on
	os.ORDER_ID = oi.ORDER_ID
	and os.ORDER_ITEM_SEQ_ID = oi.ORDER_ITEM_SEQ_ID
join shipment s on
	s.PRIMARY_ORDER_ID = oh.ORDER_ID
join product p on
	p.PRODUCT_ID = oi.PRODUCT_ID
where 
	oh.ORDER_TYPE_ID = 'TRANSFER_ORDER'
group by
	product_internal_name ;
```

# Cost - 5.3
# Explanation - 
The problem statement required us to fetch the net amount of quantity of a product transferred from one facility to another.
The query starts by joining the order_header table (oh) with order_item (oi) to link orders with their respective items.
It then joins the order_shipment (os) table to get shipment details for each item, followed by the shipment (s) table to determine the originating and destination facilities. 
The product (p) table is joined to fetch the internal product name. 
The query filters records to include only orders of type 'TRANSFER_ORDER', ensuring that only transfer-related movements are considered.

![image](https://github.com/user-attachments/assets/a26a120e-88c9-4d1e-b3d3-873b019facb4)

