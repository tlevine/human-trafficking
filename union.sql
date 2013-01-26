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
ALTER TABLE minneapolis.swdata ADD COLUMN "City" text DEFAULT 'minneapolis.db';
INSERT INTO advertisement SELECT * FROM minneapolis.swdata;
DETATCH DATABASE 'minneapolis.db'

ATTACH DATABASE 'dc.db'           AS dc;
ALTER TABLE dc.swdata ADD COLUMN "City" text DEFAULT 'dc.db';
INSERT INTO advertisement SELECT * FROM dc.swdata;
DETATCH DATABASE 'dc.db'

ATTACH DATABASE 'philidelphia.db' AS philidelphia;
ALTER TABLE philidelphia.swdata ADD COLUMN "City" text DEFAULT 'philidelphia.db';
INSERT INTO advertisement SELECT * FROM philidelphia.swdata;
DETATCH DATABASE 'philidelphia.db'

ATTACH DATABASE 'losangeles.db'   AS losangeles;
ALTER TABLE losangeles.swdata ADD COLUMN "City" text DEFAULT 'losangeles.db';
INSERT INTO advertisement SELECT * FROM losangeles.swdata;
DETATCH DATABASE 'losangeles.db'

ATTACH DATABASE 'denver.db'       AS denver;
ALTER TABLE denver.swdata ADD COLUMN "City" text DEFAULT 'denver.db';
INSERT INTO advertisement SELECT * FROM denver.swdata;
DETATCH DATABASE 'denver.db'

ATTACH DATABASE 'seattle.db'      AS seattle;
ALTER TABLE seattle.swdata ADD COLUMN "City" text DEFAULT 'seattle.db';
INSERT INTO advertisement SELECT * FROM seattle.swdata;
DETATCH DATABASE 'seattle.db'

ATTACH DATABASE 'portland.db'     AS portland;
ALTER TABLE portland.swdata ADD COLUMN "City" text DEFAULT 'portland.db';
INSERT INTO advertisement SELECT * FROM portland.swdata;
DETATCH DATABASE 'portland.db'

ATTACH DATABASE 'newyork.db'      AS newyork;
ALTER TABLE newyork.swdata ADD COLUMN "City" text DEFAULT 'newyork.db';
INSERT INTO advertisement SELECT * FROM newyork.swdata;
DETATCH DATABASE 'newyork.db'

ATTACH DATABASE 'miami.db'        AS miami;
ALTER TABLE miami.swdata ADD COLUMN "City" text DEFAULT 'miami.db';
INSERT INTO advertisement SELECT * FROM miami.swdata;
DETATCH DATABASE 'miami.db'

ATTACH DATABASE 'newjersey.db'    AS newjersey;
ALTER TABLE newjersey.swdata ADD COLUMN "City" text DEFAULT 'newjersey.db';
INSERT INTO advertisement SELECT * FROM newjersey.swdata;
DETATCH DATABASE 'newjersey.db'

ATTACH DATABASE 'chicago.db'      AS chicago;
ALTER TABLE chicago.swdata ADD COLUMN "City" text DEFAULT 'chicago.db';
INSERT INTO advertisement SELECT * FROM chicago.swdata;
DETATCH DATABASE 'chicago.db'

-- The query of interest
SELECT * FROM kidphone INNER JOIN advertisement 
ON advertisement.phone = kidphone.phone 
WHERE advertisement.city != 'dc';
