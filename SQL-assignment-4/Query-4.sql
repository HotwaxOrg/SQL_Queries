-- Fetching the attributes
select
	oisgir.ORDER_ID,
	ii.DATETIME_RECEIVED BROKERED_DATE,
	ii.FACILITY_ID BROKERED_FACILITY_ID,
	DATEDIFF(CURDATE(), ii.DATETIME_RECEIVED) as TIME_SINCE_BROKERING
from
	order_item_ship_grp_inv_res oisgir
	-- Getting the facility details
join inventory_item ii on
	ii.INVENTORY_ITEM_ID = oisgir.INVENTORY_ITEM_ID
	-- Getting the unshipped orders
join order_shipment os on
	os.ORDER_ID = oisgir.ORDER_ID
join shipment ss on
	ss.SHIPMENT_ID = os.SHIPMENT_ID
where
	ss.STATUS_ID != 'SHIPMENT_SHIPPED';