select
	extract(month from ss.STATUS_DATE) as month,
	count(s.SHIPMENT_ID) / count(distinct s.ORIGIN_FACILITY_ID) AVERAGE_SHIPMENTS
from
	shipment s
join shipment_status ss on
	ss.SHIPMENT_ID = s.SHIPMENT_ID
where
	ss.STATUS_ID = 'SHIPMENT_SHIPPED'
	and ss.status_date between '2022-01-01' and '2022-03-31'
group by
	extract(month from ss.status_date);