-- Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A
 
 select customer.customer_id , customer.first_name as firstname, customer.last_name as lastname ,customer.email as email , track.genre_id  , count(*) as count
 from customer 
 join invoice on customer.customer_id = invoice.customer_id
 join invoice_line on invoice.invoice_id = invoice_line.invoice_id
 join track on invoice.invoice_id = track.track_id	
 where track.genre_id = 1  and customer.email like 'a%'
 group by customer.customer_id , customer.first_name , customer.last_name ,customer.email
 order by customer_id;
 
 -- Let's invite the artists who have written the most rock music in our dataset.
 -- Write a query that returns the Artist name and total track count of the top 10 rock bands
 

select artist.artist_id  id, artist.name as 'artist name' , count(*) 'total_track_counts'from artist
join album2 on artist.artist_id = album2.artist_id
join track on album2.album_id = track.album_id
where track.genre_id = 1
group by artist.artist_id ,artist.name
order by total_track_counts desc
limit 10; 




-- Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. 
-- Order by the song length with the longest songs listed first

select name ,milliseconds  
from track
having milliseconds > (select avg(milliseconds) from track ) 
order by milliseconds desc;









 
 
 
 
 



