-- Question:  Payment Captured but Not Shipped

-- Fetching the attributes
select
	oh.ORDER_ID ,
	oh.STATUS_ID,
	opp.STATUS_ID ,
	s.STATUS_ID
from
	order_header oh
	-- Getting the payment details
join order_payment_preference opp on
	opp.ORDER_ID = oh.ORDER_ID
	-- Getting the shipment details
join shipment s on
	s.PRIMARY_ORDER_ID = oh.ORDER_ID
	-- Filtering out records as per our requirements
where
	opp.STATUS_ID = 'PAYMENT_SETTLED';


-- Query Cost: 44,194.11
