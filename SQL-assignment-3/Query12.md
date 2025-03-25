# Problem Statement: Orders Without Picklist - A picklist is necessary for warehouse staff to gather items. Orders missing a picklist might be delayed and need attention.

## Attributes
- **ORDER_ID**
- **ORDER_DATE**
- **ORDER_STATUS**
- **FACILITY_ID**
- **DURATION**

```
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
```

-- Cost: 119,347.13

![image](https://github.com/user-attachments/assets/4f0e5fa6-24a6-47bc-8ba0-dc29529772c8)


