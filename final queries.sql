use latino_royal;
#MANAGERS

#Q1
select staff.*,ship.s_name
from staff,ship
where staff_salery=(select min(staff_salery) from staff where staff_role ='CAPITAN')
and ship.s_ID=staff.s_id;

#Q2
select round(avg(st.staff_salery),2) as Avarage_Salary
from ship sh, staff st
where sh.s_ID=st.s_id
and sh.s_value=(select max(s_value) from ship)
group by sh.s_ID
having avg(st.staff_salery);

#Q3
select distinct actual_cruise.ac_id 
from actual_route, actual_cruise,route
where actual_cruise.ac_id=actual_route.ac_id and
route.c_ID=actual_cruise.c_id and
route.h_ID=actual_route.h_ID
and datediff(actual_route.departure_date,actual_route.arraival_date)!=route.num_of_days
;

#Q4
select ship.s_ID,ship.s_name,count(distinct ac_r.h_id) as numOfHarbors
from actual_cruise ac_c, actual_route ac_r, ship
where ac_c.ac_id = ac_r.ac_id
and ship.s_ID=ac_c.s_id
group by ac_c.s_id
having count(distinct ac_r.h_id)
order by count(distinct ac_r.h_id) desc
;

#Q5
select ship.s_ID,ship.s_name, round((count(staff.staff_ID)/ship.max_staff)*100,2) 
as Precentage_Employment
from staff,ship
where ship.s_ID=staff.s_id
group by ship.s_id
having count(staff.staff_ID)
order by round((count(staff.staff_ID)/ship.max_staff)*100,2)
;

#---workers---

#Q6

select attraction.*, harbor.h_country,harbor.h_city
from staff_in_att sIa, attraction,harbor
where attraction.at_ID=sIa.at_ID
and harbor.h_ID=attraction.h_ID
group by sIa.at_ID
having count(sIa.staff_ID)=attraction.max_group_size
;

#Q7
select s1.staff_firstname, s1.staff_lastname ,s1.staff_salery as salary, sh.s_name as Ship_Name
from staff s1 ,ship sh
where   sh.s_ID = s1.s_id and
s1.staff_salery>(select staff_salery from staff where staff_firstname='JACK' and staff_lastname='SPARO')
and s1.staff_role = 'CAPITAN'
;

#Q8
select staff.staff_firstname,staff.staff_lastname,attraction.at_name
from staff_in_att ,staff, attraction
where staff_in_att.staff_ID=staff.staff_ID and
 staff_in_att.at_ID= attraction.at_ID and staff_in_att.isMainGuide= 1 and staff_in_att.at_ID in
(select staff_in_att.at_ID
from staff_in_att ,staff
where staff_in_att.staff_ID=staff.staff_ID  and
 staff.staff_firstname='SHAGI' and staff.staff_lastname='YOMT'
)

;

#Q9
select staff.staff_ID,staff.staff_firstname,staff.staff_lastname,ship.s_name as
 shipName,luxury_ship.num_mishellen_rest
from luxury_ship,staff,ship
where luxury_ship.s_ID=ship.s_ID and staff.s_id=ship.s_ID and staff.s_id=luxury_ship.s_ID
and staff_role='CAPITAN'

;

#Q10
select  attraction.at_name,attraction.tripadvisor_rank,harbor.h_city,harbor.h_country
from attraction,harbor
where  attraction.h_ID=harbor.h_ID and
attraction.tripadvisor_rank=(select max(attraction.tripadvisor_rank) from attraction)

;


#add salary to shagi
update staff
set staff_salery=23.4
where staff_ID=11;
;

#add employee and replace other
insert into staff values(32,111,"DOLEV","HAZIZA","CHEF");
update staff
set s_id=111
where staff_ID=18;

update staff_in_att
set isMainGuide=0
where staff_ID=20;
update staff_in_att
set isMainGuide=1
where staff_ID=21;

update staff
set staff_lastname='AFEK'
where staff_ID=17;

