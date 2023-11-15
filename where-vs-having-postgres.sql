
select
		f.reconciled_movement_id,
		string_agg(f.stakeholder_number,
		'|'
order by
		f.stakeholder_number)
from
					RECONCILED_MOVEMENT_STAKEHOLDER f
group by
	f.reconciled_movement_id
having count(*) > 1 -- "WHERE" is used before grouping (filtering before), "HAVING" is used after grouping (filtering after)