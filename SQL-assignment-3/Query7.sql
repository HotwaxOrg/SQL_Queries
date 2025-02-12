-- Fetching the columns
select
	oisg.FACILITY_ID ,
	f.FACILITY_NAME ,
	count(oisg.ORDER_ID) TotalOneDayShipOrder ,
	CONCAT(
        MIN(DATE(oisg.ESTIMATED_SHIP_DATE)), ' to ', MAX(DATE(oisg.ESTIMATED_SHIP_DATE))
    ) as ReportingPeriod
from
	order_item_ship_group oisg
	-- Fetching the shipment status and details
join order_shipment os on
	os.ORDER_ID = oisg.ORDER_ID
join shipment s on
	s.SHIPMENT_ID = os.SHIPMENT_ID
	-- Fetching the facility information
join facility f on
	f.FACILITY_ID = oisg.FACILITY_ID
	-- Filtering out the orders that were shipped in one day
where
	oisg.SHIPMENT_METHOD_TYPE_ID = 'NEXT_DAY'
	and s.STATUS_ID = 'SHIPMENT_SHIPPED'
group by
	oisg.FACILITY_ID
order by
	TotalOneDayShipOrder desc;