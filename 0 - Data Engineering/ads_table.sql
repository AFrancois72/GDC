
-- Creating Table Schema

CREATE TABLE ads (
    owner_id INT,
    FOREIGN KEY (owner_id)
        REFERENCES users (id),
    title VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(12 , 2 ),
    city VARCHAR(50),
    created_at TIMESTAMP,
    deleted_at TIMESTAMP,
    id INT PRIMARY KEY
);

-- Loading data from CSV

LOAD  DATA INFILE 'GDC/ads.csv'
INTO TABLE ads
FIELDS TERMINATED BY ','
optionally ENCLOSED by '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
( 
@line,
owner_id,
    title,
    category,
    price,
    city,
    created_at,
    @deleted_at,
    id)
    SET deleted_at = NULLIF(  @deleted_at,'');


-- Sanity check queries
SELECT 
   *
FROM
    ads;
    
    SELECT 
    count(*)
FROM
    ads;
      