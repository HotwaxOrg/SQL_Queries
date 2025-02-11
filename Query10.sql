select count(os.STATUS_ID) Total_Orders, os.CHANGE_REASON from order_status os
where os.STATUS_ID = 'ORDER_CANCELLED';


desc inventory_item;