# Architecture 


# Tech stack 
* DBT 
* Docker
* Github actions 
* SQL
* Python 

# Project overview 
The main goal of this project is to create a datawarehosue with the star schema on Postgresql based on a csv file that will facilate analytics and dashboarding. For this, we used Python to ingest raw data to the data warehouse into specific schema on Postgres and then use DBT to transform data and build all the dimension tables and the fact table but in a Dev schema. Then 