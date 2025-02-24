-- Getting the attributes
select
	os.ORDER_ID ,
	os.SHIP_GROUP_SEQ_ID ,
	count(os.SHIP_GROUP_SEQ_ID) TOTAL_ITEMS_IN_ORDER,
	os.SHIPMENT_ID,
	oisg.FACILITY_ID,
	ss.STATUS_DATE
from
	order_shipment os
	-- Getting the facility details
join order_item_ship_group oisg on
	oisg.ORDER_ID = os.ORDER_ID
	-- Status of the shipment
join shipment_status ss on
	ss.SHIPMENT_ID = os.SHIPMENT_ID
where
	ss.STATUS_ID = 'SHIPMENT_SHIPPED'
group by
	os.order_id,
	os.SHIP_GROUP_SEQ_ID ,
	os.SHIPMENT_ID,
	oisg.FACILITY_ID,
	ss.STATUS_DATE ;