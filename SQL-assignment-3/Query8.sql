-- Problem Statement: List of Warehouse Pickers

-- Fetching the columns
select
	p.PICKLIST_ID ,
	p.FACILITY_ID ,
	pr.PARTY_ID ,
	pr.ROLE_TYPE_ID ,
	p2.FIRST_NAME ,
	p2.LAST_NAME ,
	pty.STATUS_ID
from
	picklist p
	-- Fetching the party details
join picklist_role pr on
	pr.PICKLIST_ID = p.PICKLIST_ID
join person p2 on
	p2.PARTY_ID = pr.PARTY_ID
join party pty on
	pty.PARTY_ID = pr.PARTY_ID
join facility f on
	f.FACILITY_ID = p.FACILITY_ID
where
	f.FACILITY_TYPE_ID like '%WAREHOUSE';

-- Cost: 2,594.34
