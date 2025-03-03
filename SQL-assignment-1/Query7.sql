select
	oh.ORDER_ID ,
	oh.STATUS_ID,
	opp.STATUS_ID ,
	s.STATUS_ID
from
	order_header oh
join order_payment_preference opp on
	opp.ORDER_ID = oh.ORDER_ID
join shipment s on
	s.PRIMARY_ORDER_ID = oh.ORDER_ID
where
	opp.STATUS_ID = 'PAYMENT_SETTLED';
