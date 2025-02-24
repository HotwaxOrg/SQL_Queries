-- Fetching the attributes
select
	os.ORDER_ID,
	os.SHIPMENT_ID,
	oisg.FACILITY_ID,
	DATE(ss.STATUS_DATE),
	DATE(os2.STATUS_DATETIME)
from
	order_shipment os
	-- Getting the facility details
join order_item_ship_group oisg on
	oisg.ORDER_ID = os.ORDER_ID
	-- Status of the shipment
join shipment_status ss on
	ss.SHIPMENT_ID = os.SHIPMENT_ID
	-- Status of the order
join order_status os2 on
	os2.ORDER_ID = os.ORDER_ID
	-- Getting the facility details
join facility f on
	f.FACILITY_ID = oisg.FACILITY_ID
	-- Filtering out the records
where
	ss.STATUS_ID = 'SHIPMENT_SHIPPED'
	and os2.STATUS_ID = 'ORDER_COMPLETED'
	and f.FACILITY_TYPE_ID like '%WAREHOUSE';