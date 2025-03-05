-- Problem Statement:  Orders with Multiple Returns

-- Fetching the columns
select
	rh.RETURN_ID ,
	rh.RETURN_DATE ,
	ri.ORDER_ID ,
	ri.RETURN_REASON_ID ,
	ri.RETURN_QUANTITY
from
	return_header rh
	-- Fetching the order id, return reason id and quantity
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
where
	ri.RETURN_QUANTITY > 1;

-- Cost: 1,121.71
