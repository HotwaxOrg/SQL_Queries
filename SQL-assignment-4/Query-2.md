# 2 Shipments by Tracking Number
Business Problem:
Customer Service often needs to look up shipments by tracking number to answer delivery queries quickly.

## Fields to Retrieve:

- **SHIPMENT_ID**
- **ORDER_ID**
- **TRACKING_NUMBER**
- **SHIPMENT_DATE**
- **CARRIER_PARTY_ID**
- **SHIPMENT_STATUS**

```
select
	s.SHIPMENT_ID, 
	s.PRIMARY_ORDER_ID ORDER_ID,
	srs.TRACKING_ID_NUMBER TRACKING_NUMBER,
	ss.STATUS_DATE SHIPMENT_DATE,
	srs.CARRIER_PARTY_ID,
	s.STATUS_ID SHIPMENT_STATUS
from
	shipment s
join shipment_status ss on
	ss.SHIPMENT_ID = s.SHIPMENT_ID and ss.STATUS_ID  = s.STATUS_ID
join shipment_route_segment srs on
	srs.SHIPMENT_ID = s.SHIPMENT_ID
where
	srs.TRACKING_ID_NUMBER = '${trackingNumber}';
```

# Explanation:
The problem statement required us to fetch the tracking number of different shipments with their date and status.
It selects the shipment ID, order ID, tracking number, shipment date, carrier party ID, and shipment status. 
The query pulls data from the shipment table and joins it with the shipment_status table using SHIPMENT_ID, ensuring that the status ID matches in both tables. 
Additionally, it joins the shipment_route_segment table using the SHIPMENT_ID to fetch tracking-related details. 
The WHERE clause filters the results to include only the shipment that matches the provided tracking number (${trackingNumber}).

# Cost: 13,547.03

![image](https://github.com/user-attachments/assets/cc43681b-6b48-48c1-bdfa-415c915f8bda)
