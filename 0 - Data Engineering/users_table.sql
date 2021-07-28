-- Creating Table Schema

CREATE TABLE users (
    id INT PRIMARY KEY,
    age INT,
    birthdate DATETIME,
    city VARCHAR(100),
    created_at TIMESTAMP,
    sex VARCHAR(15),
    latitude DECIMAL(20 , 18 ),
    longitude DECIMAL(20 , 18 ),
    password VARCHAR(50),
    utm_source VARCHAR(50),
    utm_medium VARCHAR(50),
    utm_campaign VARCHAR(50),
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    user_agent TEXT,
    misc TEXT
);

-- Loading data from CSV

LOAD  DATA INFILE 'GDC/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
optionally ENCLOSED by '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
( 
@line,
    id,
    age,
    birthdate,
    city,
    created_at,
    sex,
    @latitude,
    @longitude,
    password,
    utm_source,
    utm_medium,
    utm_campaign,
    firstname,
    lastname,
    user_agent,
   Misc
   )
      SET latitude = NULLIF(  @latitude,''),longitude = NULLIF(  @longitude,'');

-- Sanity check queries

SELECT 
    count(*)
FROM
    users;
    
    
    SELECT 
    count(user_agent)
FROM
    users;
     
    
    SELECT 
    COUNT(id) AS number_of_users,
STRING_SPLIT(user_agent, "/") as browser_cat
FROM
    users
GROUP BY browser_cat;

SELECT 
user_agent,count(id) as number_of_users
FROM
    users
    group by user_agent
;

SELECT 
    CONCAT(firstname, " ",lastname),created_at
FROM
    users
    order by created_at
;
