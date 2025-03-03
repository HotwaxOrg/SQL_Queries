select
	count(ri.return_item_seq_id) as total_returns,
	sum(ri.return_quantity * ri.return_price) as return_total,
	count(ra.return_adjustment_id) as total_appeasements,
	sum(ra.amount) as appeasement_total
from
	return_header rh
left join return_item ri
    on
	rh.return_id = ri.RETURN_ID
left join return_adjustment ra
    on
	rh.return_id = ra.return_id
where
	ra.return_adjustment_type_id = "APPEASEMENT";