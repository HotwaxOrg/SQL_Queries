-- Problem Statement: Transfer Orders Without Inventory Reservation

select
	it.ORDER_ID ,
	it.FACILITY_ID ,
	it.FACILITY_ID_TO ,
	it.PRODUCT_ID ,
	it.QUANTITY ,
	it.SEND_DATE ,
	it.STATUS_ID
from
	inventory_transfer it ;

-- Cost: 0.35
