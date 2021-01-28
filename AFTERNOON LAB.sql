Use sakila;
drop view if exists rented;
create view rented as
select i.film_id,if(max(r.rental_date)  like '%2006-02-14%','yes','no') as rented
from inventory as i
left join rental as r using (inventory_id) 
group by i.film_id
order by i.film_id;


select f.film_id, f.rental_duration, f.rental_rate,f.rating,release_year,fc.category_id,
count(r.rental_ID) as times_rented, r2.rented
from film as f
join film_category as fc using(film_id)
join inventory as i using (film_id)
join rental as r using (inventory_id)
join rented as r2 using (film_id)
group by f.film_id
order by f.film_id;







film_category= category_id, film_id  a
film= film_id, title, rental_rate, release_year,duration,rating, inventory_id  b
inventory= inventory_id, film_id  c
rental= rental_date, count(rental_id), inventory_id d
