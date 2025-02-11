select  oh.ORDER_ID , oh.STATUS_ID , ii.FACILITY_ID , f.FACILITY_NAME , f.FACILITY_TYPE_ID 
from order_header oh 
join inventory_item_detail iid on iid.ORDER_ID = oh.ORDER_ID 
join inventory_item ii on ii.INVENTORY_ITEM_ID = iid.INVENTORY_ITEM_ID 
join facility f on f.FACILITY_ID = ii.FACILITY_ID 
where oh.STATUS_ID = 'ORDER_APPROVED';
