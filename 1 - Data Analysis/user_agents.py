from user_agents import parse
import pandas as pd
import pymysql

# Establishing connection with database on local hard drive (dummy password)
connection = pymysql.connect(user='root', password='password', database='GDC', host='localhost')

# Retrieving and storing query result in a pandas dataframe
query = "SELECT user_agent FROM users;"

result = pd.read_sql(query, connection)

# Creating dataframe to store parsed user agent strings
parsed_agents = pd.DataFrame(columns=['browser_family','browser_version','os_family','os_version','device_family','device_brand','device_model'])

# Parsing user agent strings
for string in result['user_agent']:
    parsed_agent=parse(string)
    parsed_agents=parsed_agents.append({'browser_family': parsed_agent.browser.family,
                                        'browser_version': parsed_agent.browser.version_string,
                                        'os_family': parsed_agent.os.family,
                                        'os_version': parsed_agent.os.version_string,
                                        'device_family':parsed_agent.device.family,
                                        'device_brand':parsed_agent.device.brand,
                                        'device_model':parsed_agent.device.model
                                        },
                                        ignore_index=True)

# Printing results
print(parsed_agents['browser_family'].value_counts())
print(parsed_agents['browser_version'].value_counts())
print(parsed_agents['os_family'].value_counts())
print(parsed_agents['os_version'].value_counts())
print(parsed_agents['device_family'].value_counts())
print(parsed_agents['device_brand'].value_counts())
print(parsed_agents['device_model'].value_counts())
