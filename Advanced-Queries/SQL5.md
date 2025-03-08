# Query4 - Shipping Distance
Calculate the average distance transfer orders are being shipped when moving inventory between two facilities. 
Facilities should have a latitude and longitude configured.

## Expected Fields in the Result

- **Transfer Order Name**  
- **Transfer Order Origin Facility Id**  
- **Transfer Order Destination Facility Id**  
- **Distance in Kilometers**  
- **Tracking Code**  
- **Label Cost**  

```
select
	oh.ORDER_NAME TRANSFER_ORDER_NAME,
	s.ORIGIN_FACILITY_ID TRANSFER_ORDER_ORIGIN_FACILITY_ID,
	s.DESTINATION_FACILITY_ID TRANSFER_ORDER_DESTINATION_ID,
	acos(
	sin(opa.LATITUDE)* sin(dpa.LATITUDE)+ 
	cos(opa.LATITUDE)* cos(dpa.LATITUDE)* cos(dpa.LONGITUDE -opa.LONGITUDE ))* 6371 DISTANCE_IN_KM,
	oisg.TRACKING_NUMBER
from
	order_header oh
join order_item oi on
	oi.ORDER_ID = oh.ORDER_ID
join order_item_ship_group oisg on
	oisg.ORDER_ID = oi.ORDER_ID
join order_shipment os on
	os.ORDER_ID = oi.ORDER_ID
	and os.ORDER_ITEM_SEQ_ID = oi.ORDER_ITEM_SEQ_ID
join shipment s on
	s.SHIPMENT_ID = os.SHIPMENT_ID
join postal_address opa on
	opa.CONTACT_MECH_ID = s.ORIGIN_CONTACT_MECH_ID
join postal_address dpa on
	dpa.CONTACT_MECH_ID = s.DESTINATION_CONTACT_MECH_ID
where
	oh.ORDER_TYPE_ID = 'TRANSFER_ORDER'
	and opa.LATITUDE is not null
	and opa.LONGITUDE is not null
	and dpa.LATITUDE is not null
	and dpa.LONGITUDE is not null;
```

# Cost - 4.31
# Explanation -
This problem statement required to get distance between two facilities for a transfer order.
The query selects the order name (TRANSFER_ORDER_NAME) from the order_header table and joins multiple tables to gather necessary shipment and tracking details. 
It extracts the origin and destination facility IDs from the shipment table and computes the distance in kilometers between the two locations using the haversine formula (a mathematical formula to calculate distances based on latitude and longitude). 
The required latitude and longitude values are fetched from the postal_address table for both the origin and destination addresses. Additionally, the tracking number is obtained from the order_item_ship_group table. The query specifically filters records where the order type is a TRANSFER_ORDER and ensures
that valid latitude and longitude values exist for the calculation.
