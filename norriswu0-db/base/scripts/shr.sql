--
-- The 'shr' table.
--
-- This is an example used in lectures.  Its from Watson 5e, where its
-- introduced on page 66.
--


DROP table shr;


CREATE TABLE shr (
	 shrcode	CHAR(3),
	 shrfirm	VARCHAR(20)NOT NULL,
	 shrprice	DECIMAL(6,2),
	 shrqty		DECIMAL(8),
	 shrdiv		DECIMAL(5,2),
	 shrpe		DECIMAL(2),

	PRIMARY KEY(shrcode)
);


INSERT INTO shr VALUES('FC', 'Freedonia Copper', 27.50, 10529, 1.84, 16);
INSERT INTO shr VALUES('PT', 'Patagonian Tea', 55.25, 12635, 2.50, 10);
INSERT INTO shr VALUES('AR', 'Abyssinian Ruby', 31.82, 22010, 1.32, 13);
INSERT INTO shr VALUES('SLG', 'Sri Lankan Gold', 50.37, 32868, 2.68, 16);
INSERT INTO shr VALUES('ILZ', 'Indian Lead & Zinc', 37.75, 6390, 3.00, 12);
INSERT INTO shr VALUES('BE', 'Burmese Elephant', 0.07, 154713, 0.01, 3);
INSERT INTO shr VALUES('BS', 'Bolivian Sheep', 12.75, 231678, 1.78, 11);
INSERT INTO shr VALUES('NG', 'Nigerian Geese', 35.00, 12323, 1.68, 10);
INSERT INTO shr VALUES('CS', 'Canadian Sugar', 52.78, 4716, 2.50, 15);
INSERT INTO shr VALUES('ROF', 'Royal Ostrich Farms', 33.75, 1234923, 3.00, 6);
