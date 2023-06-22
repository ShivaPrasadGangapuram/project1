
-- views based on universities data
create  view BIDatamart.vw_universities_count as 
    (
        select country,
                count(name) as number_of_universites 
        from BIDatamart.universities 
        group by country 
    )

create VIEW BIDatamart.vw_universities_count_statewise as 
    (
        select country,
                state_province,count(name) as number_of_universites
        from BIDatamart.universities 
        group by country,state_province
    )

-- views based on earthquake data
create view BIDatamart.vw_monthly_earthquake  as 
    (
        select  year(occur_time) as year,
                month(occur_time) as month,
                count(id) as number_of_earthquakes 
        from  BIDatamart.earthquake
        group by year,month
        order by year,month
    )
                                                                    
create view BIDatamart.vw_monthly_earthquake_avg as
    (
        select  year(occur_time) as year,
                month(occur_time) as month,
                count(id) as number_of_earthquakes,
                avg(mag) as avg_magnitude 
        from  BIDatamart.earthquake
        group by year,month
        order by year,month
    )