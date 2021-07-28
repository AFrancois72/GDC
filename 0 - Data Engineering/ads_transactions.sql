-- Creating Table Schema

CREATE TABLE ads_transaction (
    id INT PRIMARY KEY,
    ad_owner_id INT,
    buyer_user_id INT,
    ad_id INT,
    sold_price DECIMAL(20 , 10 ),
    created_at TIMESTAMP,
    FOREIGN KEY (ad_owner_id)
        REFERENCES users (id),
    FOREIGN KEY (buyer_user_id)
        REFERENCES users (id),
    FOREIGN KEY (ad_id)
        REFERENCES ads (id)
);

-- Loading data from CSV

LOAD  DATA INFILE 'GDC/ads_transaction.csv'
INTO TABLE ads_transaction
FIELDS TERMINATED BY ','
optionally ENCLOSED by '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
( 
    id,
    ad_owner_id,
    buyer_user_id,
    ad_id,
    sold_price,
    created_at)
;

-- Sanity check queries

SELECT 
    count(*)
FROM
    ads_transaction;
    
    
SELECT 
    max(sold_price)
FROM
    ads_transaction;
    
    
    