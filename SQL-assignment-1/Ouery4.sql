-- Selecting the attributes 
SELECT 
    gi.PRODUCT_ID, 
    gi.GOOD_IDENTIFICATION_TYPE_ID, 
    gi.ID_VALUE  
FROM good_identification gi   
-- Filtering out records based on required conditions
WHERE gi.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID' or gi.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_ID'4
or gi.GOOD_IDENTIFICATION_TYPE_ID = 'SHOPIFY_PROD_SKU';
