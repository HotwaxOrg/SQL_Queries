-- Selecting the attributes 
SELECT 
    product.PRODUCT_ID, 
    gi.GOOD_IDENTIFICATION_TYPE_ID, 
    gi.ID_VALUE  
FROM product  
-- Applying join on the entities
JOIN good_identification gi ON gi.PRODUCT_ID = product.PRODUCT_ID  
-- Filtering out records based on required conditions
WHERE gi.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID' or gi.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_ID';
