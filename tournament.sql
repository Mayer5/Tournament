-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


--Drop Exist Database
DROP DATABASE IF EXISTS tournament;

--Create Database
CREATE DATABASE tournament;

--Connect to the Database
\c tournament;

--Create Table for Players
CREATE TABLE players (id serial primary key, name text);

--Create Table for Matches
CREATE TABLE matches (match_id serial primary key,
winner integer references players(id),
loser integer references players(id),
draw boolean);

--Create View for Standings
--Winner get 1 point, loser get 0 point in a non-draw game.
--When it's a draw game, each player get 0.5 point.
CREATE VIEW standings AS
SELECT players.id,
players.name,
SUM(CASE WHEN matches.draw = 'false' AND matches.winner = players.id THEN 1 
	WHEN matches.draw = 'true' AND (matches.winner = players.id OR matches.loser = players.id) THEN 0.5
	ELSE 0 END) AS total_wins,
COUNT(matches.match_id) AS total_matches
FROM players LEFT JOIN matches
ON players.id = matches.winner OR players.id = matches.loser
GROUP BY players.id