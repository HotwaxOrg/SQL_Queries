-- Selecting attributes from the
select
	p.party_id,
	per.first_name,
	per.last_name,
	cm.INFO_STRING Email,
	tn.CONTACT_NUMBER Phone,
	p.CREATED_DATE Entry_Date
from
	party p
	-- Fetching records of customer
join party_role pr on
	pr.PARTY_ID = p.PARTY_ID
	and pr.ROLE_TYPE_ID = 'CUSTOMER'
	-- Fetching first name and last name of customer
join person per on
	per.party_id = p.party_id
	-- Fetching contact mechanism of parties
join party_contact_mech pcm on
	pcm.PARTY_ID = p.PARTY_ID
	-- Fetching mail id or parties and thier role type as telecom number
join contact_mech cm on
	cm.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
	and cm.CONTACT_MECH_TYPE_ID != 'POSTAL_ADDRESS'
	-- Contact number of parties and left join cause we want to fetch contact details if exist 
left join telecom_number tn on
	tn.CONTACT_MECH_ID = pcm.CONTACT_MECH_ID
where
	p.CREATED_DATE between '2023-06-01' and '2023-06-30';
