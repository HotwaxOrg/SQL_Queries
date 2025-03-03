-- Question: Lost and Damaged Inventory

-- Fetching the attributes
select
	iiv.INVENTORY_ITEM_ID ,
	iiv.VARIANCE_REASON_ID ,
	iiv.CREATED_TX_STAMP TRANSACTION_DATE,
	ii.PRODUCT_ID ,
	ii.FACILITY_ID ,
	(ii.QUANTITY_ON_HAND_TOTAL + iiv.QUANTITY_ON_HAND_VAR) as Quantity_LOST_or_DAMAGED
from
	inventory_item_variance iiv
join inventory_item ii on
	ii.INVENTORY_ITEM_ID = iiv.INVENTORY_ITEM_ID;



-- Query Cost: 2,591,657.19
