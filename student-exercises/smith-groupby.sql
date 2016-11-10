/* GROUP BY */
-- Retrieve all the columns from the vteamRoster view for only the batting leaders.
-- To accomplish this, create a query that joins the batting table to the vteamRoster view
-- using the playerID column for the join.
SELECT vteamRoster.*, batting.* FROM vteamRoster INNER JOIN batting ON vteamRoster.playerID = batting.playerID;

-- Add weight AVG
SELECT vteamRoster.DivisionName, AVG(vteamRoster.Weight) FROM vteamRoster INNER JOIN batting ON vteamRoster.playerID = batting.playerID GROUP BY DivisionName;

-- 3
SELECT * FROM vteamRoster

--4
SELECT Position, COUNT(playerID) as positonCount FROM vteamRoster GROUP BY Position;

--HAVING
--Create three select statements that use the GROUP BY and HAVING clause.
--Use any table or view from any of the databases created to this point.
--Feel free to create your own database and tables with data, if you desire.

SELECT vteamRoster.DivisionName, AVG(vteamRoster.Weight) FROM vteamRoster INNER JOIN batting ON vteamRoster.playerID = batting.playerID GROUP BY DivisionName HAVING DivisionName = 'NL EAST';
SELECT COUNT(team.ID) as BattingLeaderCount, team.teamName FROM team INNER JOIN batting ON team.ID = batting.teamID GROUP BY team.teamName HAVING BattingLeaderCount > 1 ORDER BY BattingLeaderCount DESC;
SELECT vteamRoster.playerName, COUNT(batting.Hits) FROM vteamRoster INNER JOIN batting on vteamRoster.playerID = batting.playerID GROUP BY vteamRoster.playerName HAVING playerName = 'Chris Johnson';

--INSERT BY VALUES
INSERT INTO Individual (LastName,FirstName,BirthDate,DeceasedDate) VALUES ('Berninger','Matt','1971-02-13',NULL), ('Dessner','Aaron','1971-09-30',NULL), ('Dessner','Bryan','1971-09-30',NULL), ('Bazan','David','1968-03-20',NULL), ('Stevens','Sufjan','1973-05-01',NULL);
INSERT INTO Band (Name,YearFormed,IsTogether,Genre) VALUES ('The National','2001',1,'Alternative'), ('Pedro the Lion','1996',0,'Alternative'), ('Sufjan Stevens','2003',1,'Alternative');
INSERT INTO IndividualBand (BandID, IndividualID) VALUES (28, 49), (28, 50), (28, 51), (29, 52), (30, 53);

DELETE LastName, FirstName FROM Individual WHERE LastName IN ('Ramone');

SELECT CONCAT(playerName, ' ', Position, ', ', teamName) as FullPlayer FROM vteamRoster WHERE teamName = 'Boston Red Sox';
