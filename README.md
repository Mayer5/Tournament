# Tournament
Udacity-FSND Project2  
This is a submission for Udacity Full Stack Web Developer Nanodegree --- Project 2.

##Overview
This project includes:  
1. A database schema for storing data required to run a Swiss Pairing Tournament.  
2. A python module for connecting to database, register/delete/count players, report/delete matches, rank players and create a next swiss pairings.  (Which supports **draw game**).   
3. A test for checking the python module and database schema.  

##Requirements
You should have installed PostgreSQL and Python 2.7 to use these codes.

##Installation

###1. Setup database
Type the following command in terminal to setup the database schema:
(Which will delete the exist "tournament" database)

>_psql -f tournament.sql_

###2. Run the test for checking
Type the following command in terminal
>_python tournament_test.py_

**If all tests passe, you will see below result:**

1 Old matches can be deleted.  
2 Player records can be deleted.  
3 After deleting, countPlayers() returns zero.  
4 After registering a player, countPlayers() returns 1.  
5 Players can be registered and deleted.  
6 Newly registered players appear in the standings with no matches.  
7-1 After a non-draw match, players have updated standings.  
7-2 After a all-draw match, players have updated standings.  
7-3 After a mixed-draw match, players have updated standings.  
8 After one match, players with one win are paired.  
Success!  All tests pass!


