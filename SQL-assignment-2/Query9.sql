select oi.ORDER_ID, oi.ORDER_ITEM_GROUP_SEQ_ID , oi.STATUS_ID CurrentStatusID, 
oi.LAST_UPDATED_STAMP StatusChangeDateTime, oi.CHANGE_BY_USER_LOGIN_ID ChangedBy
from order_item oi ;