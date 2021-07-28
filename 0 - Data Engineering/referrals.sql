-- Creating Table Schema

CREATE TABLE referrals (
    id INT PRIMARY KEY,
    referrer_user_id INT,
    referree_user_id INT,
    created_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (referrer_user_id)
        REFERENCES users (id),
    FOREIGN KEY (referree_user_id)
        REFERENCES users (id)
);

-- Loading data from CSV

LOAD  DATA INFILE 'GDC/referrals.csv'
INTO TABLE referrals
FIELDS TERMINATED BY ','
optionally ENCLOSED by '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
( 
    id,
    referrer_user_id,
    referree_user_id,
    created_at,
    @deleted_at)
SET deleted_at = NULLIF(  @deleted_at,'');

-- Sanity check queries

SELECT 
    *
FROM
    referrals;
    
SELECT 
    referrer_user_id, COUNT(referree_user_id) AS num_referrees
FROM
    referrals
GROUP BY referrer_user_id
ORDER BY num_referrees DESC
LIMIT 10;

SELECT 
    referrer_user_id, COUNT(referree_user_id) AS num_referrees
FROM
    referrals
GROUP BY referrer_user_id
ORDER BY num_referrees asc
LIMIT 10;

SELECT 
    referrer_user_id, avg(referree_user_id)
FROM
    referrals
GROUP BY referrer_user_id
;
