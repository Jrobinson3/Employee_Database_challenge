--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--2. Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date, to_date
FROM dept_emp;

--3. Retrieve the title column from the Titles table.
SELECT title
FROM titles;

--4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--6. Join the Employees and the Department Employee tables on the primary key.
--7. Join the Employees and the Titles tables on the primary key.
--8. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
--9. Order the table by the employee number.
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
JOIN titles as t
ON ((e.emp_no=t.emp_no))
WHERE ((e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') and (de.to_date='9999-01-01'))
ORDER BY e.emp_no ASC;

select *
from mentorship_eligibility;

--10. Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- done through import/export tool
