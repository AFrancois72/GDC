
-- 1. Age distribution in table users

 
SELECT 
age, count(id) as cardinal_age
FROM
    users
    group by age
    order by age asc;
    
SELECT 
avg(age) as average_age
FROM
    users;
    
SELECT 
case 
when age<=20 then 'under 20'
when  age<30 then 'in 20s'
when  age<40 then 'in 30s'
when  age<50 then 'in 40s'
when  age<60 then 'in 50s'
when  age<70 then 'in 60s'
when  age<80 then 'in 70s'
when  age>=80 then 'above 80'
end as age_range,count(id) as cardinal_age_range
FROM
    users
    group by age_range
    order by age_range asc;
    

-- 2. Gender analysis in table users

     
    SELECT 
sex, count(id) as repartition
FROM
    users
    group by sex
    order by repartition asc;

-- 3. User location stats table users

SELECT 
city,
    count(id) as users_in_city
FROM
    users
    group by city
    order by users_in_city DESC
    LIMIT 5;
    

-- 4. Devices used in table users (+ python user_agents)

SELECT user_agent FROM users;

-- 5. UTM analysis table users 

SELECT 
    utm_source, COUNT(*)
FROM
    users
GROUP BY utm_source
;

SELECT 
    utm_medium, COUNT(*)
FROM
    users
GROUP BY utm_medium
;

SELECT 
    utm_campaign, COUNT(*)
FROM
    users
GROUP BY utm_campaign
;

-- 6. Conversion / value creation in tables ads, ads_transactions & users

    SELECT 
    category,
count(*)
FROM
    ads
    group by category;
    
    SELECT 
CONCAT(firstname, " ",lastname) as name, round(sum(sold_price)) as sales,count(ad_id) as number_of_adds
FROM
    ads_transaction 
    join users on ad_owner_id=users.id
    group by ad_owner_id
    order by sales desc limit 10; 
    
    
        SELECT 
ads.city,category,round(sum(sold_price)) as sales
FROM
    ads_transaction 
    join ads on ad_id=ads.id
    group by ads.city
    order by sales desc limit 10; 
    

SELECT 
   category, sum(round(sold_price)) as category_turnover
FROM
    ads_transaction
        JOIN
    ads ON ad_id = ads.id
    group by ads.category
    order by category_turnover desc
; 

SELECT 
   category, avg(round(sold_price)) as category_turnover
FROM
    ads_transaction
        JOIN
    ads ON ad_id = ads.id
    group by ads.category
    order by category_turnover desc
; 

SELECT 
   category,count(ad_id),
   case when round(price)<round(sold_price) and sold_price>10 then 'above_price'
   else 'on_price_or_below_price' end as price_diff
FROM
    ads_transaction
        JOIN
    ads ON ad_id = ads.id
    group by price_diff,category
; 