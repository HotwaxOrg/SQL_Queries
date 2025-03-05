-- Problem Statement: Orders Without Picklist

select
	os.order_id,
	oh.order_date,
	oh.status_id as order_status,
	s.origin_facility_id as facility_id,
	ofc.change_datetime as duration
from
	order_shipment os
left join picklist_bin pb
on
	pb.primary_order_id = os.ORDER_ID
join order_header oh 
on
	oh.order_id = os.order_id
join shipment s 
    on
	os.shipment_id = s.shipment_id
left join order_facility_change ofc 
    on
	ofc.order_id = os.order_id
where
	pb.picklist_id is null
order by
	os.order_id;

-- Cost: 119,347.13
