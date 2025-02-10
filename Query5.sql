-- Fetching the columns 
select oh.ORDER_ID, oh.ORDER_ITEM_SEQ_ID , oh.ORDER_HISTORY_ID , oh.SHIP_GROUP_SEQ_ID ,
oh2.EXTERNAL_ID , oh2.ORIGIN_FACILITY_ID, f.PRODUCT_STORE_ID  , f.FACILITY_TYPE_ID , 
oi.QUANTITY, p.PRODUCT_ID , p.PRODUCT_TYPE_ID , p.INTERNAL_NAME  
-- It contains order, order item seq, order history and ship group seq id
from order_history oh 
-- joining order_header with order_history to get the status, external and facility id
join order_header oh2 on oh2.ORDER_ID = oh.ORDER_ID 
-- joining the facility to get the product store id
join facility f on f.FACILITY_ID = oh2.ORIGIN_FACILITY_ID
-- joining the order item to get the quantity
join order_item oi on oi.ORDER_ITEM_SEQ_ID = oh.ORDER_ITEM_SEQ_ID 
-- joining product to get product id, product type id, internal name
join product p on p.product_id = oi.PRODUCT_ID 
-- Filtering out records based on our requirement
where oh2.STATUS_ID = 'ORDER_COMPLETED' and oh2.ORDER_DATE between '2023-08-01' and '2023-08-31'; 