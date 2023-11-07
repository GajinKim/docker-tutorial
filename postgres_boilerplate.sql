CREATE TABLE employees (
    employee_id numeric(5) PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    manager_id numeric(5)
);

INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES
    (1, 'John', 'Doe', NULL),
    (2, 'Jane', 'Smith', 1),
    (3, 'Bob', 'Johnson', 1),
    (4, 'Alice', 'Williams', 2),
    (5, 'David', 'Brown', 2),
    (6, 'Sarah', 'Miller', 3),
    (7, 'Michael', 'Jones', 3),
    (8, 'Emily', 'Davis', 4),
    (9, 'William', 'Moore', 4),
    (10, 'Olivia', 'Wilson', 5),
    (11, 'James', 'Taylor', 5);

--- recursive hierarchical query in postgres

with recursive cte as (
-- first select refers to the root level
select
	employee_id,
	first_name,
	last_name,
	manager_id,
	1 as level
from
	employees
where
	manager_id is null -- start with
union all
-- second select refers to the rest of the hierarchy
select
	e.employee_id,
	e.first_name,
	e.last_name,
	e.manager_id,
	c.level + 1
from
	cte c -- selecting from itself
	
-- join is equivalent to connect by prior clause
join employees e on
	e.manager_id = c.employee_id                                                                                  
)                                                                                                                                                                                     
select
	*
from
	cte
order by cte.level, cte.first_name;