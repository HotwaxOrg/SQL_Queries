SELECT HOUR(os.STATUS_DATETIME) AS Hour, COUNT(os.STATUS_ID) AS Total_Orders
FROM order_status os
WHERE os.STATUS_ID = 'ORDER_COMPLETED'
AND os.STATUS_DATETIME BETWEEN '2023-08-17 00:00:00' AND '2023-08-17 23:59:59'
GROUP BY HOUR(os.STATUS_DATETIME)
ORDER BY Hour;
