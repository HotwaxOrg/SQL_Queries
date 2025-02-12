select
	iiv.INVENTORY_ITEM_ID ,
	iiv.VARIANCE_REASON_ID ,
	iiv.CREATED_TX_STAMP ,
	ii.PRODUCT_ID ,
	ii.FACILITY_ID ,
	ii.EXPIRE_DATE, 
	(ii.QUANTITY_ON_HAND_TOTAL + iiv.QUANTITY_ON_HAND_VAR) as Quantity_LOST_or_DAMAGED
from
	inventory_item_variance iiv
join inventory_item ii on
	ii.INVENTORY_ITEM_ID = iiv.INVENTORY_ITEM_ID;



