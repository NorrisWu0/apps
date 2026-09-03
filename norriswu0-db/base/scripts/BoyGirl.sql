-- 
-- The BoyGirl Example for lectures
-- http://www-staff.it.uts.edu.au/~raymond/db/boygirl.txt

DROP table Boy CASCADE;
DROP table Girl CASCADE;


Create table Girl
(
      girlNo        integer,
      girlName      char(10),
      girlMobile    char(10),

      CONSTRAINT girlNoPK PRIMARY KEY (girlNo)
);


Create table Boy
(
      boyNo            integer,
      boyName          char(10),
      girlNo           integer,
      boyMobile        char(10),

   CONSTRAINT boyNoPK  PRIMARY KEY (boyNo),
   CONSTRAINT girlNoFK FOREIGN KEY (girlNo) REFERENCES Girl ON DELETE RESTRICT
);



INSERT INTO Girl VALUES(1, 'Alice',   '0414 1234');
INSERT INTO Girl VALUES(2, 'Bonnie',  '0414 1235');


Insert into Boy VALUES( 1,'Adam',    1,    '0414 1236');
Insert into Boy VALUES( 2,'Bob',     2,    '0414 1237');
Insert into Boy VALUES( 3,'Charlie', 2,    '0414 1238');
Insert into Boy VALUES( 4,'Dennis',  null,  null);


-- raymond=> select * from Boy;
--
--  boyno |  boyname   | girlno | boyMobile
-- -------+------------+--------+------------
--      1 | Adam       |      1 | 0414 1236
--      2 | Bob        |      2 | 0414 1237
--      3 | Charlie    |      2 | 0414 1238
--      4 | Dennis     |        |
-- (4 rows)
--
-- 
-- raymond=> select * from Girl;
--
--  girlno |  girlname  | girlMobile
-- --------+------------+------------
--       1 | Alice      | 0414 1234
--       2 | Bonnie     | 0414 1235
-- (2 rows)
