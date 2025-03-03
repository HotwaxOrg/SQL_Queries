select
	f.FACILITY_ID ,
	f.FACILITY_TYPE_ID ,
	count(oi.ORDER_ID) Total_Orders,
	sum(oi.UNIT_PRICE) Total_Revenue
,
	CONCAT(
        MIN(DATE(oh.ORDER_DATE)), ' to ', MAX(DATE(oh.ORDER_DATE))
    ) as Date_Range
from
	order_item oi
join order_header oh on
	oh.ORDER_ID = oi.ORDER_ID
join order_shipment os on
	os.order_id = oi.order_id
join shipment s on
	s.SHIPMENT_ID = os.SHIPMENT_ID
join facility f on
	f.FACILITY_ID = s.ORIGIN_FACILITY_ID
group by
	f.FACILITY_ID
order by
	total_orders desc;
