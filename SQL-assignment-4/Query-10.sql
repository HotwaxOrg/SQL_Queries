select
	rh.RETURN_ID,
	rh.FROM_PARTY_ID,
	rh.ENTRY_DATE RETURN_DATE ,
	ri.ORDER_ID,
	rr.DESCRIPTION
from
	return_header rh
join return_item ri on
	ri.RETURN_ID = rh.RETURN_ID
join return_reason rr on
	rr.RETURN_REASON_ID = ri.RETURN_REASON_ID
where
	rh.DESTINATION_FACILITY_ID is null;