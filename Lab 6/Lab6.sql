/*1) Display the name and city of customers who live in any city that makes the most different kinds of
     products. (There are two cities that make the most different products. Return the name and city of
     customers from either one of those.)
*/     
select c.name, c.city
from customers c
join products p
on c.city = p.city;
/*2) Display the names of products whose priceUSD is strictly above the average priceUSD, in reversealphabetical
     order.
*/
select name
from products
where priceUSD > (
		select AVG(priceUSD)
		from products)
order by name desc;
--3) Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low.
select  c.name, o.pid, SUM(o.qty) as total
from orders o
join customers c
on o.cid = c.cid
group by o.pid, c.cid
order by total desc;

/*4) Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use
     coalesce to avoid showing NULLs.
*/
select c.name, SUM(coalesce(o.qty, 2))
from orders o
join customers c
on o.cid = c.cid
group by c.cid;
/*5) Display the names of all customers who bought products from agents based in Tokyo along with the
     names of the products they ordered, and the names of the agents who sold it to them.
*/
select c.name
from orders o
join customers c
on o.cid = c.cid;
/*6) Write a query to check the accuracy of the dollars column in the Orders table. This means calculating
     Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD.
     Display all rows in Orders where Orders.totalUSD is incorrect, if any.
*/
Select *
From (Select o.*, o.qty*p.priceusd*(1-(discount/100)) as truedollars
      from orders o
      inner join products p on o.pid = p.pid
      inner join customers c on o.cid = c.cid) as tmptable
Where dollars != truedollars;