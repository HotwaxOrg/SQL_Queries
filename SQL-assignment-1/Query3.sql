-- Selecting the attributes 
SELECT 
    p.PRODUCT_ID, 
    p.INTERNAL_NAME, 
    p.PRODUCT_TYPE_ID, 
    gi.ID_VALUE AS NETSUITE_ID
FROM 
    PRODUCT p
    -- Applying joins on our entities on product id
LEFT JOIN 
    GOOD_IDENTIFICATION gi ON p.PRODUCT_ID = gi.PRODUCT_ID
    AND gi.GOOD_IDENTIFICATION_TYPE_ID = 'ERP_ID'
    -- Filtering our erp id that are null
WHERE 
    gi.ID_VALUE IS NULL ;
