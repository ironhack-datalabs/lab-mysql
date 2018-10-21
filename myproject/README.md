# End-to-End MySQL Database Creation and Analysis

## Downloading a database from relational.fit.cvut.cz

Several issues were faced while trying to download a database from the website "relational.fit.cvut.cz". Such problems seemed to be produce by an incompatibility between the mysqldump.exe files in the database and the laptop used for its download. The incompatibility can be omitted if running the following code in the console from the directory where you want the sql file to be saved:

``` $ mysqldump --column-statistics=0 -u guest -p -h relational.fit.cvut.cz imdb_ijs > imdb_ijs.sql```

As shown above, the chosen database is "imdb_ijs" which is composed of 7 tables with a fair amount of attributes. Enough to deliver the current exercise.



## Running the SQL Script in MySQL Workbench

A new schema should be manually created in our local connection in order to host the downloaded database. This schema has been named "imdb_ijs" to maintain a consistent naming convention and has been created using the following clause:

``` CREATE DATABASE imdb_ijs```

Once imdb_ijs.sql (the file donwloaded from the internet) is available, it can be run from MySQL Workbench going to File<Run MySQL Script. After selecting the file from the browser, we should make sure to set the default schema name to the one that we just created with the name "imdb_ijs"

Once the script is completed the database will live in our schema.


## Reverse engineer the database to create a diagram

In MySQL Workbench, from the Database menu, the option revese engineer is selected. Such functionality will allow MySQL Workbench to draw the entity relationship diagram of the database from the existing data and its relationships.

The Reverse Engineer dialog is very straight forward, just worth mentioning that the local connection has been selected along with the imdb_ijs database when asked. Once the process is completed, Workbench will show the resulting diagram that can be exported in several formats.

### The first deliverable of the project is produced at this point "imdb_ijs_EntityRelationshipsDiagram.png" showing below:

![ERD](ERD.png)


## Developing code in MySQL

In Workbench, several clauses have been created querying and actioning on data as requested. These clauses contain examples of:

* Append queries
* Update queries
* Delete queries
* Make Table queries
* Inner, right and left joins
* Subqueries
* Temporary tables
* Unions

Such queries have been exported into an .sql file via the save menu of the script editor in workbench.

### The second deliverable has been produced here and named "Queries.sql"


## Exporting data from MySQL Workbench

Once queries had been completed, the project came to an end and the only remaining actions in the MySQL Workbench environment was to export the database. With that in mind, the "Data Export" option within the Management menu was selected. The dialog requires the user to select the schema/s and tables/s to be exported, in our case the schema "imdb_ijs" was selected along with all its tables. When selecting the tables, the option "Dump structure only" was chosen due to heaviness of the database and the issue that this caused when uploading to GitHub where the file size limit is set to 100Mb. Dump structure only preserves the tables, their attributes and their relationships but drops the data within the tables, making the export very light.

Options within objects to export were ledt blanl and export options were set to "Export to Self-Contained File" (in order to produce just a unique file);"Create Dump in a single transaction (self-contained file only) and "Include Create Schema" were checked.

Once export settings were set, the process is launch producing a .sql file:

### The third deliverable is produced at this point containing the structure of the modified database and named "imd_ijs_AfterQueries_JustDumpStructure"


## Using git and GitHub to communicate changes

The repository ironhack-datalabs/lab-mysql was forked at the beggining of the exercise. Once forked, my own repository was ready to be cloned from Github into my machine where the project was developed.

Git was used to commit and push changes from the local repository to the remote repository once the project was finished. The current readme file was finalized in GitHub which created the need to do a git pull from my local repository to match contents with the remote one.

Once all information was final, a pull request has been started from the original "ironhack-datalabs/lab-mysql" repository with the name "MAD DATA1018 Alberto Castellanos_labMySQL"


