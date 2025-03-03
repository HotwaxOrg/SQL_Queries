-- Question:  Newly Created Sales Orders and Payment Methods

-- Retrieving the columns
select
	oh.ORDER_ID ,
	oh.GRAND_TOTAL ,
	oh.EXTERNAL_ID ,
	opp.PAYMENT_METHOD_TYPE_ID
from
	order_header oh
	-- Joining the order payment pref entity to get the payment mehthod type
join order_payment_preference opp on
	opp.ORDER_ID = oh.ORDER_ID
	-- Filtering our the recent orders
where
	oh.STATUS_ID = 'ORDER_CREATED';



-- Query Cost: 5,689.06
