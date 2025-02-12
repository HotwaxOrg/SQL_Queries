-- Fetching the columns
select
	rh.RETURN_ID ,
	rh.ENTRY_DATE ,
	rh.RETURN_DATE ,
	ri.ORDER_ID ,
	oh.ORDER_DATE ,
	oh.PRODUCT_STORE_ID ,
	ra.RETURN_ADJUSTMENT_TYPE_ID ,
	ra.AMOUNT ,
	ra.COMMENTS
from
	return_header rh
	-- Getting the order id
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
	-- Getting the order details
join order_header oh on
	oh.order_id = ri.ORDER_ID
	-- Getting the adjustment type, amount and comments
join return_adjustment ra on
	ra.RETURN_ID = rh.RETURN_ID ;