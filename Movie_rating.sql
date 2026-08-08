with first as (select 
u.name 
as results
from Users as u
join MovieRating as mr
on u.user_id=mr.user_id
group by u.name
order by count(u.name) desc ,u.name
limit 1),
second as( select 
m.title as results 
from Movies as m
join MovieRating as mr
on m.movie_id=mr.movie_id
where mr.created_at like '%2020-02%'
group by m.movie_id
order by (avg(mr.rating)) desc, m.title
limit 1
) 
select * from first 
union all 
select * from second;
