CREATE TABLE Artist (
  name VARCHAR(25),
  year_born INTEGER,
  year_dead INTEGER,
  PRIMARY KEY( name )
);

INSERT INTO Artist ( name, year_born, year_dead )
  VALUES
  ( 'Taylor Swift',    1989, null ),
  ( 'Billie Eilish',   2001, null ),
  ( 'Michael Jackson', 1958, 2009 )
;





CREATE TABLE Song (
  title  VARCHAR(25),
  plays  INTEGER,
  PRIMARY KEY( title )
);

INSERT INTO Song ( title, plays )
  VALUES
  ( 'Fifteen',             180000),
  ( 'Love Story',          212000),
  ( 'The Way I Loved You', 238000),
  ( 'Billie Jean',         298000),
  ( 'Thriller',            358000),
  ( 'Beat It',             258000),
  ( 'xanny',               453000),
  ( 'bad guy',             244000),
  ( 'goodbye',             156000)
;






CREATE TABLE Wrote (
  song   VARCHAR(25),
  artist VARCHAR(25),
  PRIMARY KEY( song )
);

INSERT INTO Wrote ( song, artist )
  VALUES
  ( 'Fifteen',             'Taylor Swift'),
  ( 'Love Story',          'Taylor Swift'),
  ( 'The Way I Loved You', 'Taylor Swift'),
  ( 'Billie Jean',         'Michael Jackson'),
  ( 'Thriller',            'Michael Jackson'),
  ( 'Beat It',             'Michael Jackson'),
  ( 'xanny',               'Billie Eilish'),
  ( 'bad guy',             'Billie Eilish'),
  ( 'goodbye',             'Billie Eilish')
;





CREATE TABLE Album (
  artist VARCHAR(7),
  title  VARCHAR(25),
  year_released INTEGER,
  PRIMARY KEY( title )
);

INSERT INTO Album ( artist, title, year_released )
  VALUES
  (  'Taylor Swift',    'Fearless', 2008 ),
  (  'Billie Eilish',   'WHEN WE ALL FALL ASLEEP WHERE DO WE GO', 2019 ),
  (  'Michael Jackson', 'Thriller', 1982 )
;





CREATE TABLE Contains (
  album VARCHAR(40),
  song  VARCHAR(25),
  PRIMARY KEY( song )
);

INSERT INTO Contains ( album, song )
  VALUES
  ('WHEN WE ALL FALL ASLEEP WHERE DO WE GO', 'xanny'              ),
  ('WHEN WE ALL FALL ASLEEP WHERE DO WE GO', 'bad guy'            ),
  ('WHEN WE ALL FALL ASLEEP WHERE DO WE GO', 'goodbye'            ),
  ('Fearless',                               'Fifteen'            ),
  ('Fearless',                               'Love Story'         ),
  ('Fearless',                               'The Way I Loved You'),
  ('Thriller',                               'Billie Jean'        ),
  ('Thriller',                               'Thriller'           ),
  ('Thriller',                               'Beat It'            )
;