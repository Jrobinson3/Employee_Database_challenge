--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

--3. Create a new table using the INTO clause.4. Join both tables on the primary key.
--5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
--Then, order by the employee number.
SELECT t.emp_no, e.first_name, e.last_name, e.birth_date, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM titles AS t
JOIN employees AS e 
ON t.emp_no=e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY t.emp_no asc, from_date desc;

select *
from retirement_titles;

--6. Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--used export button
--7. Before you export your table, confirm that it looks like this image:
--verified exported information
--9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
Select emp_no, first_name, last_name, title
FROM retirement_titles;

-- 10.Use Dictinct with Orderby to remove duplicate rows
--11. Create a Unique Titles table using the INTO clause.
--12. Sort the Unique Titles table in ascending order by the employee number and descending order by the most recent title.
SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name,
title,
from_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, from_date DESC;

select *
from unique_titles;

--13.Export the Unique Titles table as unique_titles.csv 
--done through import/export tool

--15. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--16. First, retrieve the number of titles from the Unique Titles table.
--17. Then, create a Retiring Titles table to hold the required information.
--18. Group the table by title, then sort the count column in descending order.
Select title, count(title) as "count"
into retiring_titles
from unique_titles
GROUP BY title
ORDER BY "count" DESC, title Desc;

select *
from retiring_titles;

--19. Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--done this using import/export tool
