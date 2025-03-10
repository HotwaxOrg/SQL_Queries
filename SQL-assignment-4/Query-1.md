# 1 Total Shipments in January 2022
Business Problem:
Logistics managers want to see how many shipments went out at the start of 2022. This helps assess shipping volumes and plan for post-holiday periods.

## Fields to Retrieve

- **SHIPMENT_ID**  
- **SHIPMENT_DATE**  
- **FACILITY_ID**  
- **ORDER_ID**

```
select
	s.SHIPMENT_ID,
	s.ORIGIN_FACILITY_ID,
	ss.STATUS_DATE SHIPMENT_DATE,
	s.PRIMARY_ORDER_ID
from
	shipment s
join shipment_status ss on
	ss.SHIPMENT_ID = s.SHIPMENT_ID
where
	s.STATUS_ID = 'SHIPMENT_SHIPPED'
	and ss.STATUS_DATE between '2022-01-01' and '2022-01-31'
;
```

# Explanation:
The problem statement required us to find all the orders that were shipped at the start of Jan 2022.
It selects the shipment ID, origin facility ID, shipment date, and primary order ID. 
The data is pulled from the shipment table and joined with the shipment_status table using the SHIPMENT_ID as the common key. 
The query filters records where the shipment status is marked as "SHIPMENT_SHIPPED" and
ensures that the shipment status update date (STATUS_DATE) falls within the given date range.

# Cost: 30,460.93

![image](https://github.com/user-attachments/assets/c4aa2057-ea4a-4c99-ac26-3c27da4963d5)
