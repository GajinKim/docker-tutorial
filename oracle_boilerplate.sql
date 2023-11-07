-- oracle hierarchical query

SELECT
	employee_id,
	first_name,
	last_name,
	manager_id,
	PRIOR CONCAT(CONCAT(first_name, ' '), last_name) AS manager_full_name
FROM
	EMPLOYEES e
START WITH e.manager_id IS null -- John Doe (root)
CONNECT BY
	PRIOR e.employee_id = e.manager_id
ORDER SIBLINGS BY e.first_name;