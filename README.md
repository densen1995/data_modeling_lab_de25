# data_modeling_lab_de25
- Designing a database for YrkesCo using CDM, LGM and PDM. Implementation using SQL scripts  and running some subqueries using PostgreSQL and docker compose.

**Business Requirements**
- Core Requirements
- Store students with first name, last name, personal number, and email
- Store educators, who can be:Permanent employees or Consultants
- Store educational leaders and their personal details
- An educational leader is responsible for exactly 3 classes
- Store courses with details
- A program that consists of multiple courses
- Each program is approved in three rounds, meaning it has 3 classes
- Store consultants with company info
- YrkesCo has two facilities (Stockholm and Gothenburg), with possible future expansion
- Sensitive personal data must be stored in separate entities for access control

**Bonus Requirements (Included)**
- Standalone courses (not tied to a program)
- Employment type separation (permanent vs consultant)
- Possiblefacility expansion (multiple cities)


**Setup for Postgres Using Docker**

**Postgres using Docker compose setup**
- Install docker desktop to run the engine and enable docker commands in the terminal.
- Install docker compose 

**Verify Installation**
- docker --version 
- docker compose version 

**Docker Compose Configuration**
- The database runs inside a PostgresSQL container with persistent storage using Docker volumes.

- PostgreSQL 17
- Persistent data via Docker volume 
- SQL scripts mounted in the container
- Health check 

**Starting the Database(In the terminal in VS code)**
- Note: Make sure docker desktop engine is running in the computer to enable commands in the terminal
- Using bash in the terminal: 
- cd into the container folder created that will be in use 
- docker commpose up -d ( this will create a PostgreSQL container, database and start the database service)
- docker ps to check the status of the container and database

**Connect to PostgreSQL**
- docker exec -it (container name) bash(if it is the command line  in the terminal) to connect to PostgreSQL
- it also opens up the root in which you can ls and cd to SQL folder path already created and stored in the volume in .yml
- Inside the SQL folder path in the terminal; type cat spacebar and  (any of the sql files, query or table or fail table files) 
- Use psql -U yh_user -d yh_db to run the SQL files or queries

**Initialize the Database**
- Run the scripts in this order:
- \i /sql/ (schema/table/insertion file): this shows all the tables created with schema, insertions made into the table in the terminal
- \i /sql/ (queries file): shows and runs the queries and shows the result of the queries in tables in the terminal
- \i /sql/ (fail inserts file ): runs the fail insertion operations and gives the error message in the terminal

- \q and exit to exit docker and cd .. to go back to main project repo folder incase of making commits to github

- NOTE:To fully restart the database and delete data incase of persistent or errors ,type:docker compose down -v

 


