USE [КВН]

 DROP TABLE result;
 DROP TABLE team;
 DROP TABLE game;
 DROP TABLE vuz;
 DROP TABLE city;

CREATE TABLE city (
	city_id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(20),
	);

CREATE TABLE vuz (	
	vuz_id INTEGER NOT NULL,
	CONSTRAINT pk_vuz PRIMARY KEY (vuz_id ASC),
	name VARCHAR(20),
	city_id INTEGER NOT NULL,
	);

ALTER TABLE vuz
	ADD CONSTRAINT fk_vuz FOREIGN KEY (city_id) REFERENCES city(city_id)

CREATE TABLE team (
	team_id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(20),
	vuz_id INTEGER NOT NULL,
	);
	
ALTER TABLE team
	ADD CONSTRAINT fk_team FOREIGN KEY (vuz_id) REFERENCES vuz(vuz_id)	
	
CREATE TABLE game (
	game_id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(20),
	leage VARCHAR(20),
	date DATETIME NOT NULL CONSTRAINT right_date CHECK (date > 1961-08-11),
	place VARCHAR(20)
);

CREATE TABLE result (
	team_id INTEGER NOT NULL
	  REFERENCES team(team_id)
	  ON DELETE CASCADE,
	game_id INTEGER NOT NULL
	  REFERENCES game(game_id)
	  ON DELETE CASCADE,
	rang DECIMAL (6, 2) NOT NULL CONSTRAINT positive_rang CHECK (rang > 0),
	bals DECIMAL (6, 2) NOT NULL CONSTRAINT positive_bals CHECK (bals > 0),
	exit_flag INTEGER NOT NULL CONSTRAINT right_exit_flag CHECK (exit_flag IN(0, 1)),
    CONSTRAINT pk_result PRIMARY KEY (team_id, game_id),
); 

 delete from result;
 delete from team;
 delete from game;
 delete from vuz;
 delete from city;

 INSERT INTO city VALUES (1, 'долгопрудный')
 INSERT INTO city VALUES (2, 'бишкек')
 INSERT INTO city VALUES (3, 'тюмень')
 INSERT INTO city VALUES (4, 'саратов')
 INSERT INTO city VALUES (5, 'москва')
 INSERT INTO city VALUES (6, 'рязань')
 INSERT INTO city VALUES (7, 'урал')
 INSERT INTO city VALUES (8, 'ижевск')
 INSERT INTO city VALUES (9, 'лужки')


 INSERT INTO vuz VALUES (1, 'мфти', 1)
 INSERT INTO vuz VALUES (2, 'кгу', 2)
 INSERT INTO vuz VALUES (3, 'нгу', 3)
 INSERT INTO vuz VALUES (4, 'сгу', 4)
 INSERT INTO vuz VALUES (5, 'мосап', 5)
 INSERT INTO vuz VALUES (6, 'вшэ', 5)
 INSERT INTO vuz VALUES (7, 'рудн', 5)
 INSERT INTO vuz VALUES (8, 'ргрту', 6)
 INSERT INTO vuz VALUES (9, 'мнтгу', 7)
 INSERT INTO vuz VALUES (10, 'хогварц', 8)
 INSERT INTO vuz VALUES (11, 'лгу', 9)
 INSERT INTO vuz VALUES (12, 'нвк', 5)

 INSERT INTO team VALUES (1, 'физтех', 1)
 INSERT INTO team VALUES (2, 'aзия микс', 2)
 INSERT INTO team VALUES (3, 'союз', 3)
 INSERT INTO team VALUES (4, 'саратов', 4)
 INSERT INTO team VALUES (5, 'горизонт', 5)
 INSERT INTO team VALUES (6, 'вышка', 6)
 INSERT INTO team VALUES (7, 'дружба', 7)
 INSERT INTO team VALUES (8, 'привет', 8)
 INSERT INTO team VALUES (9, 'уральские пельмени', 9)
 INSERT INTO team VALUES (10, 'сега мега драйв', 10)
 INSERT INTO team VALUES (11, 'победитель', 11)
 INSERT INTO team VALUES (12, 'не везет', 12)

 INSERT INTO game VALUES(1, '1-ый четверть финал', 'высшая', '01/04/2015', 'москва')
 INSERT INTO game VALUES(2, '2-ой четверть финал', 'высшая', '02/02/2011', 'сочи')
 INSERT INTO game VALUES(3, 'полуфинал', 'первая', '02/03/2012', 'москва')
 INSERT INTO game VALUES(4, 'финал', 'первая', '07/05/2011', 'санкт-петербург')
 INSERT INTO game VALUES(5, 'кубок мэра москвы', 'кубок', '01/10/2010', 'москва')
 INSERT INTO game VALUES(6, 'четверть финал', 'высшая', '13/12/2014', 'москва')
 INSERT INTO game VALUES(7, 'летний кубок', 'кубок', '01/06/2013', 'москва')
 INSERT INTO game VALUES(8, 'летний кубок', 'кубок', '01/06/2013', 'москва')
 INSERT INTO game VALUES(9, 'летний кубок', 'кубок', '01/06/2013', 'москва')
 INSERT INTO game VALUES(10, 'зимний кубок', 'кубок', '31/01/2004', 'долгопрудный')

 INSERT INTO result VALUES(1, 1, 1, 13.5, 1)
 INSERT INTO result VALUES(1, 6, 1, 19.5, 1)
 INSERT INTO result VALUES(2, 1, 1, 13.5, 1)
 INSERT INTO result VALUES(1, 3, 2, 11.0, 1)
 INSERT INTO result VALUES(5, 2, 4, 9.4, 0)
 INSERT INTO result VALUES(2, 3, 1, 15.8, 0)
 INSERT INTO result VALUES(6, 3, 2, 14.4, 1)
 INSERT INTO result VALUES(7, 3, 3, 13.2, 1)
 INSERT INTO result VALUES(6, 4, 5, 10.1, 0)
 INSERT INTO result VALUES(8, 5, 2, 10.2, 0)

 INSERT INTO result VALUES(1, 7, 3, 16.2, 1)
 INSERT INTO result VALUES(2, 7, 2, 17.0, 1)
 INSERT INTO result VALUES(3, 7, 4, 15.4, 0)
 INSERT INTO result VALUES(4, 7, 1, 20.8, 1)
 INSERT INTO result VALUES(5, 7, 7, 11.4, 1)
 INSERT INTO result VALUES(6, 7, 5, 13.2, 1)
 INSERT INTO result VALUES(7, 7, 6, 12.1, 0)
 INSERT INTO result VALUES(1, 8, 4, 20.8, 0)
 INSERT INTO result VALUES(2, 8, 5, 11.4, 0)
 INSERT INTO result VALUES(4, 8, 1, 23.2, 1)
 INSERT INTO result VALUES(5, 8, 2, 22.2, 1)
 INSERT INTO result VALUES(6, 8, 3, 22.1, 1)
 INSERT INTO result VALUES(4, 9, 2, 22.6, 0)
 INSERT INTO result VALUES(5, 9, 7, 23.2, 1)
 INSERT INTO result VALUES(6, 9, 3, 22.1, 0)

 INSERT INTO result VALUES(7, 1, 1, 14.1, 1)
 INSERT INTO result VALUES(1, 10, 2, 13.8, 1)
 INSERT INTO result VALUES(2, 9, 3, 10.4, 1)
 INSERT INTO result VALUES(4, 10, 7, 3.2, 0)
 INSERT INTO result VALUES(5, 10, 8, 2.2, 0)
 INSERT INTO result VALUES(9, 7, 4, 22.1, 0)
 INSERT INTO result VALUES(9, 1, 2, 22.6, 1)
 INSERT INTO result VALUES(9, 5, 5, 23.2, 0)
 INSERT INTO result VALUES(9, 6, 4, 26.1, 0)
 INSERT INTO result VALUES(10, 4, 5, 17.2, 0)
 INSERT INTO result VALUES(10, 5, 3, 19.1, 0)

 INSERT INTO result VALUES(3, 10, 1, 10.1, 1)
 INSERT INTO result VALUES(2, 10, 2, 10.1, 1)
 
 INSERT INTO result VALUES(11, 1, 1, 12.3, 1)
 INSERT INTO result VALUES(11, 6, 1, 14.5, 1)

 INSERT INTO result VALUES(12, 1, 10, 8.2, 0)
 INSERT INTO result VALUES(12, 6, 11, 6.1, 0)
 INSERT INTO result VALUES(12, 3, 12, 7.2, 0)
 INSERT INTO result VALUES(12, 5, 11, 5.1, 0)

 
 --ЛАБОРАТОРНАЯ 4 ВЫБОРКИ

SELECT * FROM city
SELECT * FROM vuz
SELECT * FROM team
SELECT * FROM result
SELECT * FROM game;

--1
;WITH tab1 AS
(
	SELECT vuz_id 
	FROM vuz JOIN city ON vuz.city_id = city.city_id 
	WHERE city.name = 'москва'),
tab2 AS
(
	SELECT name, team_id
	FROM team JOIN tab1 ON team.vuz_id = tab1.vuz_id)
SELECT name
FROM tab2 JOIN result ON tab2.team_id = result.team_id
WHERE result.rang = (
	SELECT MIN(rang)
	FROM result JOIN tab2 ON tab2.team_id = result.team_id)

--2
;WITH tab1 AS
(
	SELECT game.name, result.team_id, (COUNT(game.game_id)/AVG(rang)) as res
	FROM result join game on result.game_id = game.game_id
	WHERE game.name = 'летний кубок'
	GROUP BY result.team_id, game.name
),
tab2 AS
(
	SELECT name, MAX(res) AS MaxRes
	FROM tab1
	GROUP BY name
)
SELECT tab1.team_id
FROM tab1 INNER JOIN tab2 ON (tab1.res = tab2.MaxRes)

--3
SELECT team.name
FROM team JOIN
( 
	SELECT result.team_id
	FROM result join game on result.game_id = game.game_id
	GROUP BY result.team_id
	HAVING MAX(YEAR(date)) < 2012) AS s ON s.team_id = team.team_id
GROUP BY team.name

--4
;WITH tab1 AS 
(
	SELECT result.team_id, AVG(bals) as res 
	FROM result JOIN game ON result.game_id = game.game_id
	WHERE YEAR(date) = 2014
	GROUP BY team_id
),
tab2 AS
(
	SELECT result.team_id, AVG(bals) as res 
	FROM result JOIN game ON result.game_id = game.game_id
	WHERE YEAR(date) = 2015
	GROUP BY team_id
)
SELECT tab1.team_id
FROM tab1 JOIN tab2 ON tab1.team_id = tab2.team_id
WHERE tab1.res > tab2.res


-- мои собственный запросы:

-- 1) В каком году есть команды, которые набрали одинаковое количество очков на одной и той же игру, выдать год и название кубка 
;WITH tab1 AS
( SELECT bals, result.game_id, date, result.team_id, game.name
  FROM result JOIN game ON game.game_id = result.game_id
),
tab2 AS
(
  SELECT bals, result.game_id, date, result.team_id, game.name
  FROM result JOIN game on game.game_id = result.game_id
) 
SELECT DISTINCT YEAR(tab1.date) as year, tab1.name
FROM tab1 JOIN tab2 ON tab1.game_id = tab1.game_id
WHERE tab1.game_id = tab2.game_id AND tab1.bals = tab2.bals AND tab1.date = tab2.date AND tab1.team_id <> tab2.team_id


-- 2) Команды, которые входили в 3-ку больше всего раз, за последние 2 года. Выдать название.

;WITH tab2 AS 
(  SELECT result.team_id, result.rang as highPLace
   FROM result JOIN game ON game.game_id = result.game_id
   WHERE YEAR(date) IN (2014, 2015) AND (result.rang <= 3)
), tab3 AS
(  SELECT team.team_id, COUNT(highPlace) as MaxCountEntered, team.name
   FROM team JOIN tab2 ON team.team_id = tab2.team_id
   GROUP BY team.team_id, team.name
)   
SELECT DISTINCT tab3.name
FROM tab2 JOIN tab3 ON tab2.team_id = tab3.team_id
WHERE tab3.MaxCountEntered = (SELECT MAX(MaxCountEntered) FROM tab3)


-- 3) Команды, которые ни разу не выходили в следующий этап кубков.

SELECT DISTINCT team.name
FROM team JOIN result ON team.team_id = result.team_id
GROUP BY team.name
HAVING SUM(result.exit_flag) = 0

--запросы на удаление данных из таблиц и измение таблиц, которые не сработают из-за ограничения целостности

DELETE FROM vuz WHERE city_id = 5 

UPDATE result SET exit_flag = 3 WHERE team_id = 5 

UPDATE game SET date = 1934-02-13 WHERE place = 'москва'
