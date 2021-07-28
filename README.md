# Technical stack

1. Langages & Libraries: SQL, Python(Pandas, Matplotlib, user_agents, Pymysql)
2. IDE: MySQL Workbench, PyCharm

SQL is used to store the 'raw' data from CSV and then for complex queries. Python & Pandas are used for data exploration. Pymysql makes it possible to query the MySQL Database from python and thus allows us to benefit both from complex queries & joins and to use python libraries to plot and further analyse the data. For instance user_agents is a python library specialized in parsing user agent strings.

# Data Engineering & Databases import

1. Here, we mainly did a 'raw' import of the data in MySQL databases as we concentrated on data analysis. After exploratory analysis the data was judged clean enough to gather early insights. 
2. The script is **production-ready** in the sense that it allows for basic insights production. A more thorough and complete approach for production would be to do a complete cleaning of the data (for instance the different category spellings for real_estate), we could also create store procedures for reccuring analysis. In the event that this database should become the production database directly attached to GDC website, Triggers, checks and securities should be added. Datatypes (ie decimals) could aslo be improved to take less space.
3. As Data Analysis was the main concern of the exercise, I chose MySQL because I'm more familiar with MySQL Workbench IDE
4. The SQL scripts are organised as follow:
    -  In the Data Engineering fodler: 
        - 1 script to initilize the database
        - 1 script for each table to create the table, do some sanity check and some exploratory analysis scripts 
    -  In the Data Analysis folder: 1 script consolidating all queries for analysis (including some check queries). 

# Data Analysis

As suggested we carried out a fast analysis of the data. We hence chose to investigate classic Google Analytics categories: Audience, Acquisition and conversion. 

Python scripts are available along the SQL script for analysis in the Data Analysis folder.
