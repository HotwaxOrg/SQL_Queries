-- Getting the attributes
select
	ra.RETURN_ADJUSTMENT_ID ,
	ri.RETURN_PRICE ,
	rh.FROM_PARTY_ID ,
	ri.ORDER_ID,
	ri.RETURN_REASON_ID,
	DATE(rs.STATUS_DATETIME) REFUND_DATE
from
	return_header rh
	-- Adjustment ID
join return_adjustment ra on
	ra.RETURN_ID = rh.RETURN_ID
	-- Return price and order details
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
	-- Return status and date
join return_status rs on
	rs.RETURN_ID = rh.RETURN_ID
where
	rs.STATUS_ID = 'RETURN_COMPLETED'
	and rs.STATUS_DATETIME between '2025-01-01' and '2025-01-31';