DROP TABLE IF EXISTS advertisement;

CREATE TABLE advertisement (
  `Listed Age` text, `Title` text, `Pictures` text, `PicCode` text,
  `Phone` text, `Location` text, `Date` text, `Main` text, `area` text,
  `City` text
);

CREATE INDEX Phone ON advertisement (Phone);
CREATE INDEX City ON advertisement (City);

ATTACH DATABASE 'minneapolis.db'  AS 'minneapolis';
ALTER TABLE minneapolis.swdata ADD COLUMN "City" text DEFAULT 'minneapolis';
INSERT INTO advertisement SELECT * FROM minneapolis.swdata;
DETACH DATABASE 'minneapolis';

ATTACH DATABASE 'dc.db'           AS 'dc';
ALTER TABLE dc.swdata ADD COLUMN "City" text DEFAULT 'dc';
INSERT INTO advertisement SELECT * FROM dc.swdata;
DETACH DATABASE 'dc';

ATTACH DATABASE 'philidelphia.db' AS 'philidelphia';
ALTER TABLE philidelphia.swdata ADD COLUMN "City" text DEFAULT 'philidelphia';
INSERT INTO advertisement SELECT * FROM philidelphia.swdata;
DETACH DATABASE 'philidelphia';

ATTACH DATABASE 'losangeles.db'   AS 'losangeles';
ALTER TABLE losangeles.swdata ADD COLUMN "City" text DEFAULT 'losangeles';
INSERT INTO advertisement SELECT * FROM losangeles.swdata;
DETACH DATABASE 'losangeles';

ATTACH DATABASE 'denver.db'       AS 'denver';
ALTER TABLE denver.swdata ADD COLUMN "City" text DEFAULT 'denver';
INSERT INTO advertisement SELECT * FROM denver.swdata;
DETACH DATABASE 'denver';

ATTACH DATABASE 'seattle.db'      AS 'seattle';
ALTER TABLE seattle.swdata ADD COLUMN "City" text DEFAULT 'seattle';
INSERT INTO advertisement SELECT * FROM seattle.swdata;
DETACH DATABASE 'seattle';

ATTACH DATABASE 'portland.db'     AS 'portland';
ALTER TABLE portland.swdata ADD COLUMN "City" text DEFAULT 'portland';
INSERT INTO advertisement SELECT * FROM portland.swdata;
DETACH DATABASE 'portland';

ATTACH DATABASE 'newyork.db'      AS 'newyork';
ALTER TABLE newyork.swdata ADD COLUMN "City" text DEFAULT 'newyork';
INSERT INTO advertisement SELECT * FROM newyork.swdata;
DETACH DATABASE 'newyork';

ATTACH DATABASE 'miami.db'        AS 'miami';
ALTER TABLE miami.swdata ADD COLUMN "City" text DEFAULT 'miami';
INSERT INTO advertisement SELECT * FROM miami.swdata;
DETACH DATABASE 'miami';

ATTACH DATABASE 'newjersey.db'    AS 'newjersey';
ALTER TABLE newjersey.swdata ADD COLUMN "City" text DEFAULT 'newjersey';
INSERT INTO advertisement SELECT * FROM newjersey.swdata;
DETACH DATABASE 'newjersey';

ATTACH DATABASE 'chicago.db'      AS 'chicago';
ALTER TABLE chicago.swdata ADD COLUMN "City" text DEFAULT 'chicago';
INSERT INTO advertisement SELECT * FROM chicago.swdata;
DETACH DATABASE 'chicago';
