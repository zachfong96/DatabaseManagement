--1) Get the cities of agents booking an order for a customer whiose cid is 'c002'--

select city
from agents
where aid in ( select aid
		from orders
		where cid = 'c002');

--2) Get the ids of products ordered through any agent who takes at least one order from a customer in Dallas, 
--   sorted by pid from highest to lowest.

select pid 
from orders
where aid in (select aid
		from orders
		where cid in (select cid
				from customers
				where city = 'Dallas'))
order by pid desc;
--3) Get the ids and names of customers who did not place an order through agent a01

select cid, name
from customers
where cid not in (select cid
	      from orders
	      where aid = ('a01'));

--4) Get the ids of customers who ordered both product p01 and p07

select cid
from customers
where cid in (select cid 
		from orders
		where pid = 'p01' and cid in ( select cid
						from orders
						where pid = 'p07'));
						
--5) Get the ids of products not ordered by any customers who placed any order through 
--   agent a07 in pid order from highest to lowest

select pid
from orders
where cid in ( select cid
		from orders
		where aid != 'a07')
order by pid desc;

--6) Get the name, discounts and city for all customers who place orders through agents in London or New York.
select name, discount, city
from customers
where cid in (select cid
		from orders
		where aid in ( select aid
				from agents 
				where city in ('London','New York')));
-- you missed a semicolon in this query

				
--7) Get all customers who have the same discount as that of any customers in Dallas or London
 select *
 from customers
 where cid not in ( select cid
		    from customers
		    where city in ('Dallas', 'London')) and discount in ( select discount
									  from customers
									  where city in ('Dallas', 'London'));

--  8) Tell me about check constraints: What are they? What are they good for? What is the advantage of
--     putting that sort of thing inside the database? Make up some examples of good uses of check constraints
--     and some examples of bad uses of check constraints. Explain the differences in your examples and argue
--     your case.
--
--     
--     Essay
--
--     
--     A check constraint is used to limit the value range that can be placed in a column.  
--     If a user puts a check contraint on a specific column it will only allow for certain values in the column,
--     however if it is defined in a table it will limit the values of certain columns based on the values of other 
--     columns in the row. One advantage of check contraints is that it reduces the workload of the server by 
--     restricting the number of values that appear after the sql statement.  The downside is that executing the 
--     sql statement would take longer dpeending on how large the database is. A bad example of a check contraint is in 
--     a company database where the check contraint would be CHECK Salary > 0 this would just return the entire list of 
--     employess as everyone has a salary of at least 0 a better check contraint would be to replace the 0 with 150000
--     to see who is earning that much.  Another good example would be CHECK time > 8 this would restrict the number of employess 
--     shown to ones who work longer than 8 hours.
