# Question 2: Rejected Orders with Variance
### When a store rejects an order, they can specify whether it is rejected with "variance" or "no variance." Rejections with variance indicate that the item(s) should be marked as out of stock.
### Write an SQL query to:
- **Identify all subsequent orders containing the rejected item(s) that need to be flagged for rejection.**
- **Return a list of affected orders.**

### Fields:
- **Rejected Order ID**
- **Rejected Product ID**
- **Affected Order IDs**

```
-- Fetching the attributes
select
	oisg.ORDER_ID as Rejected_Order_ID,
	oi.PRODUCT_ID as Rejected_Product_ID,
	GROUP_CONCAT(distinct oi2.ORDER_ID order by oi2.ORDER_ID) as Affected_Orders
from
	-- Fetching the facility details of the brokered order
	order_item_ship_group oisg
join order_item oi 
    on
	-- Getting the product id and item_status of the order
	oi.ORDER_ID = oisg.ORDER_ID
	and oi.SHIP_GROUP_SEQ_ID = oisg.SHIP_GROUP_SEQ_ID
join order_item oi2 
    on
	-- Fetching the affected orders
	oi2.PRODUCT_ID = oi.PRODUCT_ID
	and oi2.ORDER_ID <> oi.ORDER_ID
	-- Exclude the rejected order itself
join order_item_ship_group oisg2 on
	oi2.ORDER_ID = oisg2.ORDER_ID
	-- Making sure that the order items are brokered on the same facility
	and oi2.SHIP_GROUP_SEQ_ID = oisg2.SHIP_GROUP_SEQ_ID
	and oisg.FACILITY_ID = oisg2.FACILITY_ID
where
	-- Item should be rejected by the facility after approval
	oisg.FACILITY_ID = 'REJECTED_ITM_PARKING'
	and oi.STATUS_ID = 'ITEM_CANCELLED'
group by
	oisg.ORDER_ID,
	oi.PRODUCT_ID;
```

### Query Cost - 29,900.84

![image](https://github.com/user-attachments/assets/d75b18bc-2e32-40cb-8153-b9d3d150d43a)
