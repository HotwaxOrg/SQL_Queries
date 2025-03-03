-- Fetching the columns
select
	rh.from_party_id ,
	p2.FIRST_NAME
from
	return_header rh
	-- Getting teh party details 
	-- Getting the order details
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
join party p on
	p.PARTY_ID = rh.FROM_PARTY_ID
join person p2 on
	p2.PARTY_ID = rh.FROM_PARTY_ID
	-- Filtering out party with single return count
group by
	ri.ORDER_ID
having
	count(rh.RETURN_ID) = 1;
