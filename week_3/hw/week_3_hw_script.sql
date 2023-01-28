select * from doctors limit 5;
select * from hospitals limit 5;
-- tables can be joined on doctor's name (not sure how accurate that would be)

-- check doctors by gender
select gender, count(1) as count from doctors group by gender order by count desc limit 5;

-- check doctors by gender and license
select gender, license, count(1) as count from doctors group by gender, license order by count desc limit 5;

-- check doctors with insurance
select insurance, count(1) as count from doctors group by insurance order by count desc limit 5;

-- check doctors speciality
select speciality_one, count(1) as count from doctors group by speciality_one order by count desc limit 5;

-- -- check doctors 2nd speciality
select speciality_two, count(1) as count from doctors group by speciality_two order by count desc limit 5;

-- -- check doctors 2nd speciality
select speciality_one, speciality_two, speciality_three, count(1) as count from doctors
group by 1, 2, 3 order by count desc limit 5;

-- check hospital data
select state, city, count(1) as count from hospitals group by 1,2 order by count desc limit 5;

-- join data
select d.name, d.gender, d.license, h.state, h.city
from doctors d left join hospitals h on lower(d.name) = lower(h.doctor) limit 5;

-- see if any doctors not in hospitals table
select d.name, d.gender, d.license, h.state, h.city
from doctors d left join hospitals h on lower(d.name) = lower(h.doctor)  where  h.state is null limit 5;
