-- Problem 4 : Combine Two Tables	(https://leetcode.com/problems/combine-two-tables/)

select firstName, lastName, city, state
from person p
left join address a 
on p.personId = a.personId