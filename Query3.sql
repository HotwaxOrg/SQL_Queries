-- Selecting the attributes
SELECT p.PRODUCT_ID , p.INTERNAL_NAME , p.PRODUCT_TYPE_ID, gi.ID_VALUE  
FROM product p
-- Applying joins on our entities on product id
JOIN good_identification gi 
ON gi.product_id = p.PRODUCT_ID 
-- Filtering our erp id that are null
where  gi.good_identification_type_id = 'ERP_ID'
and gi.ID_VALUE IS NULL;
