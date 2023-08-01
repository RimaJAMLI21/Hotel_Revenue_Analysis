/*Build one Big Table */

select * from dbo.[Data2018]
union
select * from dbo.[Data2019]
union
select * from dbo.[Data2020]

/* Temporary table */
with Hotels as (
			select * from dbo.[Data2018]
			union
			select * from dbo.[Data2019]
			union
			select * from dbo.[Data2020])
select hotel,
	   arrival_date_year,
	   Round(sum ((stays_in_week_nights + stays_in_weekend_nights)*adr),3) as revenue
from Hotels
group by arrival_date_year, hotel ;


/* Join All Tables */

with Hotels as (
			select * from dbo.[Data2018]
			union
			select * from dbo.[Data2019]
			union
			select * from dbo.[Data2020])
select*
from Hotels h
left join dbo.market_segment ms on h.market_segment = ms.market_segment
left join dbo.meal_cost mc on h.meal = mc.meal;

/*      */