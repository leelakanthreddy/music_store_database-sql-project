
-- Who_is the senior most employee based_on job title?-----


select concat(first_name , " " , last_name) as name , title as 'position' 
from employee 
order by levels desc 
limit 1;

-- Which countries have the most Invoices?-----

select * from invoice;
select billing_country , count(*) as 'count' from invoice 
group by billing_country 
limit 1;

 -- ----What are top 3 values_of total invoice?-----------

 select total as 'top 3 total' 
 from invoice
 order by total desc 
 limit 3;
 
 --  Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
-- Write a query that returns one city that has the highest sum of invoice totals.
 -- Return both the city name & sum of all invoice totals------------

select customer.country country, sum(invoice.total) total
from customer
join invoice on customer.customer_id = invoice.customer_id  
group by country 
order by total desc;

-- ------Who is the best customer? The customer who has spent the most money will be declared the best customer.
-- Write a query that returns the person who has spent the most money-----------


select concat(customer.first_name ,customer.last_name) full_name, sum(invoice.total) as total
from customer 
inner join invoice on customer.customer_id = invoice.customer_id 
group by full_name
order by total desc 
limit 1;










 
 
 
 
 
 
