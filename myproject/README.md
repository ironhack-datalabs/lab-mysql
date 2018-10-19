# End-to-End MySQL Database Creation and Analysis

## Downloading a database from relational.fit.cvut.cz

Several issues wer face while trying to download a database from the website "relational.fit.cvut.cz". Such problems seemed to be produced by an incompatibility between the mysqldump.exe files. Such incompatibility can be omitted if running the following code in the console from the directory where you want the sql file to be saved:

``` $ mysqldump --column-statistics=0 -u guest -p -h relational.fit.cvut.cz imdb_ijs > imdb_ijs.sql```

As shown above, the chosen database is "imdb_ijs" which is composed of 7 tables with a fair amount of attributes. Enough to deliver the current exercise.

### The first deliverable is produced in here, which is basically the original SQL script that will will import into Workbench


## Running the SQL Script in MySQL Workbench

A new schema should be created in our local connection to host the downloaded database. This schema has been named "imdb_ijs" to maintain a consistent naming convention.

Once imdb_ijs.sql is available, it can be run from MySQL Workbench going to Fle<Run MySQL Script. After selecting the file from the browser, the default schema name should be one that we just created name "imdb_ijs"

Once the script is completed the database will live in our schema.


## Reverse engineer the database to create a diagram

In MySQL Workbench, from the Database menu, the option revese engineer is selected. Such functionality will allow MySQL Workbench to draw the entity relationship diagram of the database from the existing data and its relationships.

The Reverse Engineer dialog is very straight forward, just worth mentioning that the local connection has been selected along with the imdb_ijs database. Once the process is completed, Workbench will show the resulting diagram that can be exported in several formats.

### The second deliverable of the project is produced at this point "imdb_ijs_EntityRelationshipsDiagram.png" showing below:

![imdb_ijs_EntityRelationshipsDiagram](imdb_ijs_EntityRelationshipsDiagram.png)


## Developing code in MySQL

In Workbench, several clauses have been created querying and actioning on data as requested. 

### The second deliverable has