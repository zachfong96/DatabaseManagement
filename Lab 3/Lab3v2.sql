-- 1 --
select ordno, dollars
from orders;

--2--
select name, city
from agents
where name in ('Smith');

--3--
select pid,name, priceUSD
from products
where quantity > 208000;

--4--
select name, city
from customers
where city = 'Dallas';

--5--
select *
from agents
where city NOT IN ('Tokyo', 'New York');

--6--
select *
from products
where city NOT IN ('Dallas', 'New York') and priceUSD >= 1;

--7--
select *
from orders
where mon in ('jan', 'mar');

--8--
select *
from orders
where mon in ('feb') and dollars < 500;

--9--
select *
from orders
where cid = 'c005';