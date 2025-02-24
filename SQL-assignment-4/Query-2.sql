-- Fetching the columns
select
	os.ORDER_ID ,
	os.SHIPMENT_ID ,
	oisg.TRACKING_NUMBER,
	oisg.CARRIER_PARTY_ID,
	ss.STATUS_DATE ,
	ss.STATUS_ID
from
	order_shipment os
	-- Getting the tracking number, carrier party id
join order_item_ship_group oisg on
	oisg.ORDER_ID = os.ORDER_ID
	-- Getting the status of the shipment and date
join shipment_status ss on
	ss.SHIPMENT_ID = os.SHIPMENT_ID ;