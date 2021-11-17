# sql-challenge

  This SQL database uses a series of large CSV's to track the employment records of a large company, including employee names, ID numbers, promotions, positions and time at the company. The disparate CSV's are connected via primary keys, such as employee ID's, in a scheme known as an Entity Relationship Diagram (ERD). By assembling these together, the large dataset can be efficiently queried to add richness of information to each employee's records. 

For this challenge, one of the greatest difficulties was correctly creating the ERD, finding all columns with duplicates and reordering tables based on key equivalencies. I created and tested quite a few ERD's before finally landing on one that didn't create problems when importing to SQL. 

However, once that framework was in place, I found creating the data queries was much easier than I had anticipated. To avoid messing with or deleting values from primary keys, I chose to construct views for each step, with some steps being completed with where statements in the final SELECT. 
g
![image](https://user-images.githubusercontent.com/79113826/142298994-36a23487-3e63-49d0-a349-95964acb6734.png)

The ERD I ended up using was built with an online tool, at https://dbdiagram.io/d 
