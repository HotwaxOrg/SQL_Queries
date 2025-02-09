-- Selecting required attributes
select p.product_id, p.PRODUCT_TYPE_ID, p.INTERNAL_NAME   
from product p
-- Joining product type and product entity to find physical product
join product_type pt on pt.PRODUCT_TYPE_ID = p.PRODUCT_TYPE_ID 
where p.IS_VARIANT = 'y' and pt.IS_PHYSICAL = 'Y';
