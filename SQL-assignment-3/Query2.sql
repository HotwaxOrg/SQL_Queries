-- Problem Statement: Customer service and finance often need insights into returned items to 
-- manage refunds, replacements, and inventory restocking.

-- Fetching the columns
select
	rh.RETURN_ID ,
	rh.FROM_PARTY_ID ,
	rh.ENTRY_DATE ,
	rh.RETURN_DATE ,
	rh.RETURN_CHANNEL_ENUM_ID ,
	ri.ORDER_ID ,
	rs.STATUS_DATETIME ,
	oh.PRODUCT_STORE_ID ,
	oh.ORDER_NAME
from
	return_header rh
	-- Getting the order id
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
	-- Getting the store id and order name
join order_header oh on
	oh.ORDER_ID = ri.ORDER_ID
	-- Getting the return status datetime
join return_status rs on
	rs.RETURN_ID = rh.RETURN_ID
where
	rh.STATUS_ID = 'RETURN_COMPLETED';

-- Cost: 15,830.44
