use mavenmovies;
show tables;

'Question 1:
Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function.';
select* from rental;
select count(rental_id) as no_of_rentals from rental;

'Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.';
select * from rental;
select* from payment;
select* from film;

select avg(rental_duration) as average_rental_duration from film;

'Question 3:
Display the first name and last name of customers in uppercase.
Hint: Use the UPPER () function.';
select * from customer;

select upper(first_name), upper(last_name) from customer;
select upper(concat(first_name," ",last_name))as full_name from customer;


'Question 4:
Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function.';
select * from rental;
select rental_id, month(rental_date) from rental;

'Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY.';
select* from customer;
select * from rental;

select customer_id, count(rental_id) from rental group by customer_id;

'Question 6:
Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY.';
select* from store;
select*from staff;
select *from payment;

select sum(amount) from payment group by staff_id;

'Display the title of the movie, customer s first name, and last name who rented it.
Hint: Use JOIN between the film, inventory, rental, and customer tables.';
select* from customer;
select* from film;
select* from inventory;
select* from rental;

select title, concat(first_name,' ', last_name) as full_name from customer inner join rental on customer.customer_id = rental.customer_id  inner join inventory on rental.inventory_id = inventory.inventory_id inner join film on inventory.film_id= film.film_id;

'Question 8:
Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.';

select* from actor;
select * from film;
select * from film_actor;

select first_name, last_name from actor inner join film_actor on actor.actor_id= film_actor.actor_id inner join film on film_actor.film_id= film.film_id where film.title = 'Gone with the wind';

'Question 1:
Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.';

select * from film;
select * from film_category;
select* from rental;

select category_id, count(rental_id) from film_category inner join film on film_category.film_id= film.film_id inner join rental on film 



'Question 2:
Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY.';

select * from film;
select* from language;

select avg(rental_rate), name from film inner join language on film.language_id= language.language_id group by language.language_id;

"Question 3:
Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.";

select* from customer;
select* from rental;
select* from payment;

select concat(first_name,' ', last_name), sum(amount) from payment inner join customer on payment.customer_id= customer.customer_id inner join rental on customer.customer_id= rental.customer_id group by payment.customer_id;


'Question 4:
List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.';

select* from customer;
select* from address;
select* from city;
select* from rental;
select * from inventory;
select* from film;

select title, concat(first_name,' ', last_name) as full_name, city, address from film inner join inventory on film.film_id = inventory.film_id inner join rental on inventory.inventory_id= rental.inventory_id inner join customer on rental.customer_id= customer.customer_id inner join address on customer.address_id= address.address_id inner join city on address.city_id = city.city_id;

"Question 5:
Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use cOUNT() and GROUP BY, and limit the results.";

select* from rental;
select* from film;
select* from inventory;

select title, count(rental_id) from film inner join inventory on film.film_id= inventory.film_id inner join rental on inventory.inventory_id = rental.inventory_id group by film.film_id limit 5 ; 

"Question 6:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.";

select* from rental;
select* from inventory;
select* from customer;

select concat(first_name,' ', last_name) from customer inner join inventory on customer.store_id= inventory.store_id inner join rental on inventory.inventory_id= rental.inventory_id; 