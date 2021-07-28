import pandas as pd
import pymysql
import matplotlib.pyplot as plt

#Setting connection with database on local hard drive (dummy variables)
connection = pymysql.connect(user='root', password='password', database='GDC2', host='localhost')

#querying database
query = "SELECT age FROM users;"
result = pd.read_sql(query, connection)

#finding unique values for plot binning
card_ages=result['age'].nunique()

#production and displaying plot
fig, ax = plt.subplots()
plt.hist(result, bins=card_ages)
ax.set_xlabel("Age")
ax.set_ylabel("Card")
plt.show()

