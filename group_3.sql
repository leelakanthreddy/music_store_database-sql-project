 -- Find how much amount spent by each customer on artists? 
 -- Writea query to return customer name, artist name and total spent

	
   
   select concat(c.first_name,' ',c.last_name) costumer_name , art.name 'artist name' , sum(inv.total) total
    from  customer c
    join invoice inv on inv.customer_id = c.customer_id
    join invoice_line invl on inv.invoice_id = invl.invoice_id
    join track t on t.track_id = invl.track_id
   join album2 a on a.album_id = t.album_id
   join artist art on art.artist_id = a.artist_id
   group by costumer_name  , art.name
   order by total desc; 
   
   
-- Write a query that determines the customer that has spent the most on music for each country.
-- Write a query that returns the country along with the top customer and how much they spent.
-- For countries where the top amount spent is shared, provide all customers who spent this amount

SELECT  customer.country as cc, max(k.total) 
FROM customer
join 
(SELECT customer.first_name as fn, customer.last_name as ln,customer.country as c,invoice.customer_id as id, sum(invoice.total) as total
FROM practice.invoice
join customer on customer.customer_id = invoice.customer_id
group by customer.first_name , customer.last_name, invoice.customer_id,customer.country) 
as k on k.id = customer.customer_id
group by   customer.country 
order by country
;

-- We want to find out the most popular music Genre for each country.	
-- We determine the most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top Genre. 
-- For countries where the maximum number of purchases is shared return all Genres

select c.country country , g.name gener , count(*) count
from customer c
join invoice inv on c.customer_id = inv.customer_id
join invoice_line invl on inv.invoice_id = invl.invoice_id
join track t on t.track_id = invl.track_id
join genre g on g.genre_id = t.genre_id
group by country , gener
order by count desc; 


   
   
 