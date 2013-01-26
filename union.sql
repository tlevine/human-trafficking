CREATE TABLE advertisement (
  `Listed Age` text, `Title` text, `Pictures` text, `PicCode` text,
  `Phone` text, `Location` text, `Date` text, `Main` text, `area` text,
  `City` text
);

CREATE TABLE kidphone (
  `Phone` text,
  UNIQUE(`Phone`)
);

CREATE INDEX Phone ON advertisement (Phone);
CREATE INDEX City ON advertisement (City);

ATTACH DATABASE 'minneapolis.db'  AS minneapolis;
ATTACH DATABASE 'dc.db'           AS dc;
ATTACH DATABASE 'philidelphia.db' AS philidelphia;
ATTACH DATABASE 'losangeles.db'   AS losangeles;
ATTACH DATABASE 'denver.db'       AS denver;
ATTACH DATABASE 'seattle.db'      AS seattle;
ATTACH DATABASE 'portland.db'     AS portland;
ATTACH DATABASE 'newyork.db'      AS newyork;
ATTACH DATABASE 'miami.db'        AS miami;
ATTACH DATABASE 'newjersey.db'    AS newjersey;
ATTACH DATABASE 'chicago.db'      AS chicago;

ALTER TABLE minneapolis.swdata ADD COLUMN "City" text DEFAULT 'minneapolis.db';
ALTER TABLE dc.swdata ADD COLUMN "City" text DEFAULT 'dc.db';
ALTER TABLE philidelphia.swdata ADD COLUMN "City" text DEFAULT 'philidelphia.db';
ALTER TABLE losangeles.swdata ADD COLUMN "City" text DEFAULT 'losangeles.db';
ALTER TABLE denver.swdata ADD COLUMN "City" text DEFAULT 'denver.db';
ALTER TABLE seattle.swdata ADD COLUMN "City" text DEFAULT 'seattle.db';
ALTER TABLE portland.swdata ADD COLUMN "City" text DEFAULT 'portland.db';
ALTER TABLE newyork.swdata ADD COLUMN "City" text DEFAULT 'newyork.db';
ALTER TABLE miami.swdata ADD COLUMN "City" text DEFAULT 'miami.db';
ALTER TABLE newjersey.swdata ADD COLUMN "City" text DEFAULT 'newjersey.db';
ALTER TABLE chicago.swdata ADD COLUMN "City" text DEFAULT 'chicago.db';

INSERT INTO advertisement SELECT * FROM minneapolis.swdata;
INSERT INTO advertisement SELECT * FROM dc.swdata;
INSERT INTO advertisement SELECT * FROM philidelphia.swdata;
INSERT INTO advertisement SELECT * FROM losangeles.swdata;
INSERT INTO advertisement SELECT * FROM denver.swdata;
INSERT INTO advertisement SELECT * FROM seattle.swdata;
INSERT INTO advertisement SELECT * FROM portland.swdata;
INSERT INTO advertisement SELECT * FROM newyork.swdata;
INSERT INTO advertisement SELECT * FROM miami.swdata;
INSERT INTO advertisement SELECT * FROM newjersey.swdata;
INSERT INTO advertisement SELECT * FROM chicago.swdata;

-- The query of interest
SELECT * FROM kidphone INNER JOIN advertisement 
ON advertisement.phone = kidphone.phone 
WHERE advertisement.city != 'dc';
