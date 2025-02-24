-- Fetching the columns
select
	os.SHIPMENT_ID ,
	os.ORDER_ID,
	oisg.FACILITY_ID,
	ss.STATUS_DATE
from
	order_shipment os
	-- Fetching facility id from oisg
join order_item_ship_group oisg on
	oisg.ORDER_ID = os.ORDER_ID
	and oisg.SHIP_GROUP_SEQ_ID = os.SHIP_GROUP_SEQ_ID
	-- Getting the shipment status from shipment_status entity 
join shipment_status ss on
	ss.SHIPMENT_ID = os.SHIPMENT_ID
	-- Filtering out the results
where
	ss.STATUS_ID = 'SHIPMENT_SHIPPED'
	and ss.STATUS_DATE between '2022-01-01' and '2022-01-31';
