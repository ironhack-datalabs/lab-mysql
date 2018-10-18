# Project MYSQL
## Step 1 - Generation of a new database
I have chosen **University** database from an existing reposotory<br>
Main reasons are that is a manageble database and do not have many rows<br>
To obtain the database I execute sql script *project.sql*<br>
![ERD](ERD.png)
<br>
**Relations** Between attributes and Entities are shown in the next image:<br>
![ATTRIBUTES](attributes.png)
*Source: https://www.cs.sfu.ca/~oschulte/jbn/dataset.html*
<br>
## Step 2 - Appending new registers to 3 tables
[new_data](project_insert_data.sql)
Running *data_insert.sql* I add some new data to the following entities:<br>
*   course: 2 new registers
*   prof: 5 new registers
*   student: 20 new registers
To achive this goal we use the following statement:
```
INSERT INTO [ENTITY_NAME] (ATRIBUTE_1,ATRIBUTE_2,...) VALUES (VALUE_ATRB_1,VALUE_ATRB_2,...);
```
## Step 3 - QUERIES
[queries](project_queries.sql)
### 3.1 BASIC INFO
Here I count the number of registers of each ENTITY<br>
*   Student: 58
*   Prof: 11
*   RA: 25
*   Course: 12
*   Registration: 92
<br>
### 3.2 Students with more than 2 of Intelligence
It is ordered by ranking in ascending mode.<br>
Here I use **WHERE** and **ORDER BY** Statements to filter and sort
<br>
### 3.3 Teachers study
Here I am going to analyse the **COOLNESS** Impact of each teacher<br>
To acomplish this task I use a TEMPORARY TABLE Statement and a CASE <br>
Statement to obtain the new Attribute
<br>
### 3.4 RA and Prof Relations
Using the temporary table of section 3.3 I do an analysis based on their<br>
salary and teaching ability<br>
For this porpouse I use a **INNER JOIN** and a **TEMPORARY TABLE**
<br>
### 3.5 Creation of Temporary Tables
I have created 2 **Temporary Tables** for relations between students, <br>
grades and courses. I have also used **RIGHT and LEFT JOINS**<br>
### 3.6 QUERY OF STUDENTS
How many students did not give their opinions? 20 <br>
### 3.7 QUERY OF DIFFICULTY
AVG grade, AVG difficulty, number of votes for each course<br>
sorted by avg difficulty.<br>
<br>
Thank you very much in advance for your Feedback<br>
