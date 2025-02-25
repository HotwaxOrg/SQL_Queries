create view FindPartyView as
select
	p.party_id,
	p.status_id,
	pr.role_type_id,
	p2.first_name,
	p2.last_name,
	pg.group_name,
	pc.party_classification_group_id,
	cm.info_string,
	pcmp.contact_mech_purpose_type_id,
	tn.contact_number,
	tn.country_code,
	tn.area_code,
	pa.address1,
	pa.address2,
	pa.city,
	pa.postal_code,
	pa.state_province_geo_id,
	pa.country_geo_id
from
	party p
join party_role pr on
	pr.party_id = p.party_id
left join person p2 on
	p2.party_id = p.party_id
left join party_group pg on
	pg.party_id = p.party_id
join party_classification pc on
	pc.party_id = p.party_id
join party_contact_mech_purpose pcmp on
	pcmp.party_id = p.party_id
	and pcmp.contact_mech_purpose_type_id in ('PRIMARY_EMAIL', 'PRIMARY_LOCATION', 'PRIMARY_PHONE')
left join telecom_number tn on
	tn.contact_mech_id = pcmp.contact_mech_id
left join postal_address pa on
	pa.contact_mech_id = pcmp.contact_mech_id
join contact_mech cm on
	cm.contact_mech_id = pcmp.contact_mech_id;
