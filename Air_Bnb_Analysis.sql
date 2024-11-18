use pqr;

-- 1. Import Data from both the .CSV files to create tables, Listing and Booking Details. 
select * from sql_airbnb_project16875986150 sap;

create table air1 select * from sql_airbnb_project16875986150;

select * from air1;

create table air2 select * from sql_airbnb_project16875986151;

select * from air2;

-- 2. Q2 Write a query to show names from Listings table.
select name from air2;

-- 3. Write a query to fetch total listings from the listings table.
select count(listing_id) from air1;

-- 4. Write a query to fetch total listing_id from the booking_details table. 
select count(id) from air2;

-- 5. Write a query to fetch host ids from listings table.
select host_id from air2;

-- 6. Write a query to fetch all unique host name from listings table.
select distinct(host_name) from air2;

-- 7. Write a query to show all unique neighbourhood_group from listings table.
select distinct(neighbourhood_group) from air2;

-- 8. Write a query to show all unique neighbourhood from listings table. 
select distinct(neighbourhood) from air2;

-- 9. Write a query to fetch unique room_type from listings tables.
select distinct(room_type) from air2;

-- 10. Write a query to show all values of Brooklyn & Manhattan from listings tables. 
select * from air2 where neighbourhood_group in ('Brooklyn', 'Manhattan');


-- 11. Write a query to show maximum price from booking_details table.
select max(price) from air1;

-- 12. Write a query to show minimum price fron booking_details table.
select min(price) from air1;

-- 13. Write a query to show average price from booking_details table.
select avg(price) from air1;

-- 14. Write a query to show minimum value of minimum_nights from booking_details table.
select min(minimum_nights) from air1;

-- 15. Write a query to show maximum value of minimum_nights from booking_details table.
select max(minimum_nights) from air1;

-- 16. Write a query to show average availability_365
select avg(availability_365)  from air1;

-- 17. Write a query to show id , availability_365 and all availability_365 values greater than 300.
select listing_id, availability_365 from air1
where availability_365 > 300;

-- 18. Write a query to show count of id where price is in between 300 to 400.
select count(listing_id) from air1
where price between 300 and 400;

-- 19. Write a query to show count of id where minimum_nights spend is less than 5.
select count(listing_id) from air1
where minimum_nights < 5;

-- 20. Write a query to show count where minimum_nights spend is greater than 100.
select count(listing_id) from air1
where minimum_nights > 100;

-- 21. Write a query to show all data of listings & booking_details.
#query 1
select * from air1
left join air2
on air1.listing_id = air2.id;

#query 2
select * from air2;
select * from air1;

select air2.*, air1.*
from air2 left join air 
on air1.id=air2.listing_Id 

union

select air2.*, air1.*
from air2 right join air1 
on air2.id=air1.listing_id;

-- 22. Write a query to show host name and price.
select a2.host_name, a1.price 
from air2 a2
join air1 a1 on a2.id=a1.listing_id;

-- 23. Write a query to show room_type and price.
select a2.room_type, a1.price  
from air2 a2
join air1 a1 on a2.id=a1.listing_id;

-- 24. Write a query to show neighbourhood_group & minimum_nights spend.
select a2.neighbourhood_group, a1.minimum_nights 
from air2 a2
join air1 a1 on a2.id=a1.listing_id;

-- 25. Write a query to show neighbourhood & availability_365.
select a2.neighbourhood, a1.availability_365 
from air2 a2
join air1 a1 on a2.id=a1.listing_id;

-- 26. Write a query to show total price by neighbourhood_group.
select a2.neighbourhood_group, 
sum(a1.price) as total_price
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.neighbourhood_group;

-- 27. Write a query to show maximum price by neighbourhood_group.
select a2.neighbourhood_group, 
max(a1.price) as max_price
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.neighbourhood_group;

-- 28. Write a query to show maximum night spend by neighbourhood_group.
select a2.neighbourhood_group, 
max(a1.minimum_nights) as min_nights_spend
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.neighbourhood_group;

-- 29. Write a query to show maximum reviews_per_month spend by neighbourhood.
select a2.neighbourhood, 
max(a1.reviews_per_month) as max_review_per_month
from air2 a2
left join air1 a1 on a2.id=a1.listing_id
group by a2.neighbourhood;

-- 30. Write a query to show maximum price by room type.
select a2.room_type, 
max(a1.price) as max_price
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.room_type;

-- 31. Write a query to show average number_of_reviews by room_type.
select a2.room_type, 
avg(a1.number_of_reviews) as avg_number_of_reviews
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.room_type;

-- 32. Write a query to show average price by room type.
select a2.room_type, 
avg(a1.price) as avg_price
from air2 a2
left join air1 a1 on a2.id=a1.listing_id
group by a2.room_type;

-- 33. Write a query to show average night spend by room type.
select a2.room_type, 
avg(a1.minimum_nights) as avg_min_night
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.room_type;

-- 34. Write a query to show average price by room type but average price is less than 100.
select a2.room_type, 
avg(a1.price) as avg_price
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.room_type
having avg_price < 100;


-- 35. Write a query to show average night by neighbourhood and average_nights is greater than 5.
select a2.neighbourhood, 
avg(a1.minimum_nights) as avg_nights
from air2 a2
join air1 a1 on a2.id=a1.listing_id
group by a2.neighbourhood
having avg_nights > 5;

-- 36. Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from air1
where price > (
      select max(price)
      from air1
      where price < 200
);

-- 37. Write a query to show all values from booking_details table where host id is 314941 using sub-query. 
select * from air2
where host_id in (
      select host_id
      from air2
      where host_id = 314941
);

-- 38. Find all pairs of id having the same host id, each pair coming once only. 
select * from air2
select * from air1

select a.id as id1, b.id as id2, b.host_id
from air2 a
join air2 b on a.host_id=b.host_id and a.id<b.id;

-- 39. Write an sql query to show fetch all records that have the term cozy in name.
select * from air2
where name like "%Cozy%";

-- 40. Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group.
select a1.price,
       a2.host_id,
       a2.neighbourhood_group
from air2 a2
join air1 a1 on a2.id=a1.listing_id
where a2.neighbourhood_group = 'Manhattan';

-- 41. Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100.
select a2.id, 
       a2.host_name,
       a2.neighbourhood,
       a1.price
from air2 a2
join air1 a1 on a2.id = a1.listing_id
where (neighbourhood = "Upper West Side" 
or neighbourhood = "Williamsburg")
and price > 100;

-- 42. Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant.
select a2.id, 
       a2.host_name,
       a2.neighbourhood,
       a1.price
from air2 a2
join air1 a1 on a2.id = a1.listing_id
where neighbourhood = "Bedford-Stuyvesant" 
and host_name = "Elise";

-- 43. Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights.
select a2.host_name, 
       a1.availability_365,
       a1.minimum_nights
from air2 a2
join air1 a1 on a2.id = a1.listing_id
where availability_365 >= 100
and minimum_nights >= 100;

-- 44. Write a query to show to fetch id, host_name, number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+.
select a2.id,
       a2.host_name, 
       a1.number_of_reviews,
       a1.reviews_per_month
from air2 a2
join air1 a1 on a2.id = a1.listing_id
where number_of_reviews >= 500
and reviews_per_month >= 5;

-- 45. Write a query to show neighbourhood_group which have most total number of review.
select a2.neighbourhood_group,
count(a1.number_of_reviews)as total_number_of_reviews
from air2 a2
join air1 a1 on a2.id = a1.listing_id
group by neighbourhood_group
order by total_number_of_reviews desc;

-- 46. Write a query to show host name which have most cheaper total price.
select a2.host_name,
count(a1.price)as total_price
from air2 a2
join air1 a1 on a2.id = a1.listing_id
group by host_name
order by total_price;

-- 47. Write a query to show host name which have most costly total price.
select a2.host_name,
count(a1.price)as total_price
from air2 a2
join air1 a1 on a2.id = a1.listing_id
group by host_name
order by total_price desc;

-- 48. Write a query to show host name which have max price using sub-query.
select a2.host_name, a1.price
from air2 a2
inner join air1 a1 on a2.id=a1.listing_id
where a1.price = (select max(price) from air2 a2);

-- 49. Write a query to show neighbourhood_group where price is less than 100.
select a2.neighbourhood_group,
       a1.price
from air2 a2
join air1 a1 on a2.id = a1.listing_id
where price < 100;

-- 50. Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price. 
select a2.room_type,
       a1.price,
       a1.availability_365
from air2 a2
join air1 a1 on a2.id = a1.listing_id
order by price;























