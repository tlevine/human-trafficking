-- The query of interest
SELECT
  `Listed Age`,
  `Title`,
  -- `Pictures`,
  -- `PicCode`,
  advertisement.`Phone`,
  `Location`,
  `Date`,
  `Main`,
  `area`,
  `City`
FROM kidphone INNER JOIN advertisement 
ON advertisement.phone = kidphone.phone 
WHERE advertisement.city != 'dc';

