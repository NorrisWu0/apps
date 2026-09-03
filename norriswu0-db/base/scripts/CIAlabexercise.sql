-- 
-- The SQL for the CIA World Fact Book Database
-- 
-- The database was designed by Raymond Lister
-- 
-- The data was inserted in Autumn 2011, as a 31061/32606 Lab Exercise.
--

DROP table CIA_Language  CASCADE;
DROP table CIA_Religion  CASCADE;
DROP table CIA_Ethnic    CASCADE;
DROP table CIA_Neighbour CASCADE;
DROP table CountryOcean  CASCADE;
DROP table CIA_Country   CASCADE;
DROP table CIA_Ocean     CASCADE;



-- 
-- Table creation
--



Create table CIA_Country
(
  Country       TEXT,             -- Name of the Country
  Location      TEXT,             -- Geographic location
  Land          DOUBLE PRECISION, -- Land area, in square kilometers
  HighestName   TEXT,             -- Name of the highest point. null if no name.
  Highest       INTEGER,          -- Highest point in metres
  LowestName    TEXT,             -- Name of the lowest point. null if no name.
  Lowest        INTEGER,          -- Lowest point in metres. <0 below sea level
  Arable        DOUBLE PRECISION, -- Arable land, as a percentage of land area
  Population    NUMERIC,          -- The total population of the nation
  SexRatio      DOUBLE PRECISION, -- Ratio of males to females
  Age14         DOUBLE PRECISION, -- Percent of population 14 years or younger
  Age65         DOUBLE PRECISION, -- Percent of population 65 years or older
  PopGrowth     DOUBLE PRECISION, -- Population growth rate, as percentage
  Migration     DOUBLE PRECISION, -- Migration rate, per thousand people
  InfantMort    DOUBLE PRECISION, -- Infant mortality, per thousand live births
  LifeExpectM   DOUBLE PRECISION, -- Male life expectancy at birth, in years
  LifeExpectF   DOUBLE PRECISION, -- Female life expectancy at birth, in years
  HIV           DOUBLE PRECISION, -- Adult prevalence rate, as a percentage
  Literacy      DOUBLE PRECISION, -- As a percentage of total population
  Government    TEXT,             -- Type of government 
  Capital       TEXT,             -- Capital city; legislative if multiple
  Independence  INTEGER,          -- Year gained independence; negative if BC
  Chief         TEXT,             -- Chief of State
  GDP           DOUBLE PRECISION, -- (purchasing power parity) in $USbillons
  Growth        DOUBLE PRECISION, -- GDP, real growth rate, as a percentage
  OilProd       DOUBLE PRECISION, -- barrels per day
  OilConsum     DOUBLE PRECISION, -- barrels per day
  OilExport     DOUBLE PRECISION, -- barrels per day
  CurrAccount   DOUBLE PRECISION, -- Current account balance; $USbillions/year
  Mobiles       DOUBLE PRECISION, -- Number of mobile phones, in millions
  Internet      NUMERIC,          -- The number of Internet users
  Paved         INTEGER,          -- Amount of paved road, in kilometers
  Unpaved       INTEGER,          -- Amount of unpaved road, in kilometers
  Military      DOUBLE PRECISION, -- Military expenditure as percentage of GDP

  CONSTRAINT CIA_CountryPK PRIMARY KEY (Country),

  CONSTRAINT CIA_Country_Country CHECK (Country IN (
     'Afghanistan', 'Akrotiri', 'Albania', 'Algeria', 'Andorra', 'Angola',
     'Antigua and Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia',
     'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados',
     'Belarus', 'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia',
     'Bosnia and Herzegorina', 'Botswana', 'Brazil', 'Brunei',
     'Bulgaria', 'Burkina Faso', 'Burma', 'Burundi', 'Cambodia', 'Cameroon',
     'Canada', 'Cape Verde', 'Central African Republic', 'Chad', 'Chile',
     'China', 'Colombia', 'Comoros',
     'Congo, Democratic Republic of the',
     'Congo, Republic of the',
     'Cook Islands',
     'Costa Rica', 'Cote d''Ivoire', 'Croatia','Cuba', 'Cyprus', 
     'Czech Republic', 'Denmark', 'Djibouti',
     'Dominica',
     'Dominican Republic',
     'Ecuador', 'Egypt',
     'El Salvador', 'Equatorial Guinea', 'Eritrea','Estonia','Ethiopia','Fiji',
     'Finland', 'France', 'French Guiana', 'Gabon', 'Gambia',
     'Gaza Strip', 'Georgia',
     'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea',
     'Guinea-Bissau', 'Guyana', 'Haiti', 'Holy See (Vatican City)',
     'Honduras', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq',
     'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan',
     'Kenya', 'Kiribati', 'Korea, North',
     'Korea, South', 'Kosovo','Kuwait','Kyrgyzstan','Laos','Latvia', 'Lebanon',
     'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg',
     'Macau', 'Macedonia', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives',
     'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius',
     'Mexico', 'Micronesia, Federated States of', 'Moldova', 'Monaco',
     'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Namibia', 'Nauru',
     'Nepal', 'Netherlands', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria',
     'Niue', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Panama',
     'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland',
     'Portugal', 'Puerto Rico', 'Qatar', 'Romania', 'Russia', 'Rwanda',
     'Saint Kitts and Nevis', 'Saint Lucia',
     'Saint Vincent and the Grenadines','Samoa', 'San Marino',
     'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles',
     'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands',
     'Somalia', 'South Africa', 'South Sudan', 'Spain', 'Sri Lanka', 'Sudan',
     'Suriname', 'Swaziland', 'Sweden', 'Switzerland', 'Syria',
     'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Timor-Leste',
     'Togo', 'Tokelau', 'Tonga', 'Trinidad & Tobago', 'Tunisia', 'Turkey',
     'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates',
     'United Kingdom', 'United States of America', 'Uruguay', 'Uzbekistan',
     'Vanuatu', 'Venezuela', 'Vietnam', 'West Bank', 'Western Sahara',
     'Yemen', 'Zambia', 'Zimbabwe'
  )),


  CONSTRAINT CIA_Country_Land CHECK ((Land > 0) AND (Land < 18000000)),
  
  CONSTRAINT CIA_Country_Highest CHECK ((Highest > 0) AND (Highest < 8900)),
  
  CONSTRAINT CIA_Country_Lowest CHECK (Lowest > -499),

  CONSTRAINT CIA_Country_HighestLowest CHECK (Highest > Lowest),

  CONSTRAINT CIA_Country_Arable CHECK ((Arable >= 0) AND (Arable <= 100)),

  CONSTRAINT CIA_Country_Population CHECK ((Population > 0) AND Population < 1900000000),

  CONSTRAINT CIA_Country_Age14 CHECK ((Age14 >= 0) AND (Age14 <= 100)),

  CONSTRAINT CIA_Country_Age65 CHECK ((Age65 >= 0) AND (Age65 <= 100)),

  CONSTRAINT CIA_Country_Age14and65 CHECK (Age14+Age65 < 100),

  CONSTRAINT CIA_Country_PopGrowth CHECK ((PopGrowth >= -10) AND
                                          (PopGrowth <=  10)),

  CONSTRAINT CIA_Country_Migration CHECK ((Migration > -99) AND
                                          (Migration <  20)),

  CONSTRAINT CIA_Country_InfantMort CHECK ((InfantMort >= 1) AND
                                           (InfantMort <= 400)),

  CONSTRAINT CIA_Country_LifeExpectM CHECK ((LifeExpectM > 0) AND
                                            (LifeExpectM < 100)),

  CONSTRAINT CIA_Country_LifeExpectF CHECK ((LifeExpectF > 0) AND
                                            (LifeExpectF < 100)),

  CONSTRAINT CIA_Country_HIV CHECK ((HIV >= 0) AND (HIV <= 100)),

  CONSTRAINT CIA_Country_Literacy CHECK ((Literacy >= 0) AND
                                         (Literacy <= 100)),

  CONSTRAINT CIA_Country_Independence CHECK (Independence < 2013),

  CONSTRAINT CIA_Country_OilProd CHECK ((OilProd>=0) AND (OilProd < 19000000)),

  CONSTRAINT CIA_Country_OilConsum CHECK ((OilConsum>=0) AND (OilConsum < 29000000)),

  CONSTRAINT CIA_Country_OilExport CHECK ((OilExport >= 0) AND (OilExport<10000000)),

  CONSTRAINT CIA_Country_Mobiles CHECK ((Mobiles >= 0) AND (Mobiles < 999000000)),

  CONSTRAINT CIA_Country_Internet CHECK ((Internet >= 0) AND (Internet < 499000000)),

  CONSTRAINT CIA_Country_Paved CHECK ((Paved >= 0) AND (Paved < 9000000)),

  CONSTRAINT CIA_Country_Unpaved CHECK ((Unpaved >= 0) AND (Unpaved < 9000000)),

  CONSTRAINT CIA_Country_Military CHECK ((Military >= 0) AND (Military <= 19))
);


Create table CIA_Ocean
(
  Ocean           TEXT,           -- Name of the ocean
  Area            NUMERIC,        -- in millions of square kilometers
  DeepestName     TEXT,           -- Name of the deepest point. null if no name.
  Deepest         INTEGER,        -- Deepest point in metres

  CONSTRAINT CIA_OceanPK PRIMARY KEY (Ocean)
);


Create table CountryOcean
(
  Country         TEXT,           -- Name of the country
  Ocean           TEXT,           -- Name of the ocean

  CONSTRAINT CountryOceanPK PRIMARY KEY (Country,Ocean),

  CONSTRAINT CountryOceanFK_Invalid_Country FOREIGN KEY (Country)
                                            REFERENCES CIA_Country
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  CONSTRAINT CountryOceanFK_Invalid_Ocean FOREIGN KEY (Ocean)
                                          REFERENCES CIA_Ocean
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


Create table CIA_Neighbour
(
  CountryA        TEXT,              -- Name of one neighbour country
  CountryB        TEXT,              -- Name of the other neighbour country
  Length          DOUBLE PRECISION,  -- Length of the border between neighbours

  CONSTRAINT CIA_NeighbourPK PRIMARY KEY (CountryA,CountryB),

  CONSTRAINT CIA_NeighbourFK_Invalid_CountryA FOREIGN KEY (CountryA)
                                              REFERENCES CIA_Country (Country)
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  CONSTRAINT CIA_NeighbourFK_Invalid_CountryB FOREIGN KEY (CountryB)
                                              REFERENCES CIA_Country (Country)
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  CONSTRAINT CIA_Neighbour_Same_Country CHECK (CountryA <> CountryB),

  CONSTRAINT CIA_Neighbour_Alphabetical CHECK (CountryA < CountryB),

  CONSTRAINT CIA_Neighbour_Length CHECK (Length > 0)
);


Create table CIA_Language
(
  Country             TEXT,
  Language             TEXT, 
  Percentage       DOUBLE PRECISION,

  CONSTRAINT CIA_LanguagePK PRIMARY KEY (Country,Language),

  CONSTRAINT CIA_LanguageFK FOREIGN KEY (Country) REFERENCES CIA_Country
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  CONSTRAINT CIA_Language_Percentage CHECK 
         (((Percentage > 0) AND (Percentage <= 100))  OR  (Percentage IS NULL))
);


Create table CIA_Religion
(
  Country             TEXT,
  Religion             TEXT,
  Percentage       DOUBLE PRECISION,

  CONSTRAINT CIA_ReligionPK PRIMARY KEY (Country,Religion),

  CONSTRAINT CIA_ReligionFK FOREIGN KEY (Country) REFERENCES CIA_Country
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  CONSTRAINT CIA_Religion_Percentage CHECK 
         (((Percentage > 0) AND (Percentage <= 100))  OR  (Percentage IS NULL))
);


Create table CIA_Ethnic
(
  Country             TEXT,
  Ethnic             TEXT,
  Percentage       DOUBLE PRECISION,

  CONSTRAINT CIA_EthnicPK PRIMARY KEY (Country,Ethnic),

  CONSTRAINT CIA_EthnicFK FOREIGN KEY (Country) REFERENCES CIA_Country
  ON DELETE CASCADE
  ON UPDATE CASCADE,

  CONSTRAINT CIA_Ethnic_Percentage CHECK
         (((Percentage > 0) AND (Percentage <= 100))  OR  (Percentage IS NULL))
);



-- 
-- CIA_Ocean insertion
--


INSERT INTO CIA_Ocean VALUES 
(
  'Pacific',            --      Ocean
  179.7,                --      Area in millions of square kilometers
  'Mariana Trench',     --      DeepestName
  10911                 --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Atlantic',           --      Ocean
  106.4,                --      Area in millions of square kilometers
  'Puerto Rico Trench', --      DeepestName
  8605                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Indian',             --      Ocean
  73.556,               --      Area in millions of square kilometers
  'Java Trench',        --      DeepestName 
  7450                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Southern',           --      Ocean
  20.327,               --      Area in millions of square kilometers
  'South Sandwich Trench', --   DeepestName
  7235                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Arctic',             --      Ocean
  14.056,               --      Area in millions of square kilometers
  'Eurasian Basin',     --      DeepestName
  5450                  --      Deepest point in metres
);



INSERT INTO CIA_Ocean VALUES 
(
  'Baltic Sea',         --      Ocean
  0.377000,             --      Area in millions of square kilometers
  null,                 --      DeepestName
  459                   --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Aral Sea',           --      Ocean
  0.1716,               --      Area in millions of square kilometers
  null,                 --      DeepestName
  null                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Caspian Sea',        --      Ocean
  0.371,                --      Area in millions of square kilometers
  null,                 --      DeepestName
  1025                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Dead Sea',           --      Ocean
  0.00081,              --      Area in millions of square kilometers
  null,                 --      DeepestName
  330                   --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Mediterranean Sea',  --      Ocean
  2.5,                  --      Area in millions of square kilometers
  'Calypso Deep',       --      DeepestName
  5267                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Black Sea',          --      Ocean
  0.4364,               --      Area in millions of square kilometers
  null,                 --      DeepestName
  2200                  --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Red Sea',            --      Ocean
  0.174,                --      Area in millions of square kilometers
  null,                 --      DeepestName
  500                   --      Deepest point in metres
);

INSERT INTO CIA_Ocean VALUES 
(
  'Persian Gulf',       --      Ocean
  0.233,                --      Area in millions of square kilometers
  null,                 --      DeepestName
  90                    --      Deepest point in metres
);



-- 
-- CIA_Country insertion
--



INSERT INTO CIA_Country VALUES ('Afghanistan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Akrotiri',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Albania',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Algeria',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Andorra',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Angola',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Antigua and Barbuda',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Argentina',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Armenia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Aruba',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Austria',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Azerbaijan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bahamas',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bahrain',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bangladesh',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Barbados',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Belarus',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Belgium',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Belize',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Benin',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bhutan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bolivia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bosnia and Herzegorina',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Botswana',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Brazil',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Bulgaria',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Burkina Faso',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Burma',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Burundi',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Cambodia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Cameroon',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Cape Verde',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Central African Republic',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Chad',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Colombia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Comoros',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Congo, Democratic Republic of the',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Congo, Republic of the',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Cook Islands',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Costa Rica',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Cote d''Ivoire',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Croatia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Cuba',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Cyprus',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Czech Republic',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Denmark',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Djibouti',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Dominica',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Dominican Republic',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Ecuador',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Egypt',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('El Salvador',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Equatorial Guinea',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Eritrea',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Estonia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Ethiopia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Finland',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('France',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('French Guiana',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Gabon',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Gambia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Gaza Strip',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Georgia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Germany',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Ghana',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Greece',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Grenada',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Guatemala',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Guinea',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Guinea-Bissau',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Guyana',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Haiti',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Holy See (Vatican City)',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Honduras',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Hungary',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Iceland',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('India',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Iran',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Iraq',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Ireland',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Israel',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Italy',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Jamaica',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Jordan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Kazakhstan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Kenya',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Kiribati',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Korea, North',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Kosovo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Kuwait',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Kyrgyzstan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Laos',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Latvia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Lebanon',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Lesotho',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Liberia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Libya',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Liechtenstein',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Lithuania',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Luxembourg',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Macau',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Macedonia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Madagascar',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Malawi',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Maldives',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Mali',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Malta',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Marshall Islands',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Mauritania',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Mauritius',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Micronesia, Federated States of',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Moldova',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Monaco',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Mongolia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Montenegro',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Morocco',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Mozambique',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Namibia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Nauru',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Nepal',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Netherlands',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Nicaragua',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Niger',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Nigeria',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Niue',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Norway',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Oman',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Pakistan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Palau',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Panama',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Paraguay',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Poland',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Portugal',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Puerto Rico',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Qatar',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Romania',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Rwanda',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Saint Kitts and Nevis',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Saint Lucia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Saint Vincent and the Grenadines',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Samoa',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('San Marino',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Sao Tome and Principe',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Saudi Arabia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Senegal',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Serbia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Seychelles',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Sierra Leone',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Slovakia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Slovenia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Solomon Islands',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Somalia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('South Africa',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('South Sudan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Spain',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Sri Lanka',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Sudan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null); 
INSERT INTO CIA_Country VALUES ('Suriname',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Swaziland',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Sweden',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Switzerland',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Syria',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Taiwan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Tajikistan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Tanzania',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Timor-Leste',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Togo',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Tokelau',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Tonga',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Trinidad & Tobago',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Tunisia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Turkey',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Turkmenistan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Tuvalu',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Uganda',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Ukraine',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('United Arab Emirates',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('United Kingdom',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Uruguay',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Uzbekistan',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Vanuatu',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Venezuela',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('West Bank',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Western Sahara',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Yemen',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Zambia',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
INSERT INTO CIA_Country VALUES ('Zimbabwe',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);


-- 
-- Australia
--


INSERT INTO CIA_Country VALUES (
  'Australia',		--	Country
  'Oceania',		--	Location
  7617930,		--	Land
  'Mount Kosciuszko',	--	HighestName
  2229,			--	Highest
  'Lake Eyre' ,		--	LowestName
  -15,			--	Lowest
  6.15,			--	Arable
  21766711,		--	Population
  1.0,			--	SexRatio
  18.3,			--	Age14
  14.0,			--	Age65
  1.148,		--	PopGrowth
  6.03,			--	Migration
  4.61,			--	InfantMort
  79.4,			--	LifeExpectM
  84.3,			--	LifeExpectF
  0.1,			--	HIV
  99,			--	Literacy
  'Democratic',		--	Government
  'Canberra',		--	Capital
  1901,			--	Independence
  'Elizabeth II',	--	Chief
  889.6,		--	GDP
  3.3,			--	Growth
  589200,		--	OilProd
  946300,		--	OilConsum
  311900,		--	OilExport
  -35.23,		--	CurrAccount
  24.22,		--	Mobiles
  15810000,		--	Internet
  341448,		--	Paved
  471524,		--	Unpaved
  3			--	Military
);


INSERT INTO CountryOcean VALUES ('Australia', 'Pacific');
INSERT INTO CountryOcean VALUES ('Australia', 'Indian');
INSERT INTO CountryOcean VALUES ('Australia', 'Southern');

INSERT INTO CIA_Language VALUES ('Australia', 'English',     79.1);
INSERT INTO CIA_Language VALUES ('Australia', 'Chinese',     2.1);
INSERT INTO CIA_Language VALUES ('Australia', 'Italian',     1.9);
INSERT INTO CIA_Language VALUES ('Australia', 'Unspecified', 5.8);

INSERT INTO CIA_Religion VALUES ('Australia', 'Catholic',       26.4);
INSERT INTO CIA_Religion VALUES ('Australia', 'Anglican',       20.5);
INSERT INTO CIA_Religion VALUES ('Australia', 'ChristianOther', 20.5);
INSERT INTO CIA_Religion VALUES ('Australia', 'Buddhist',       1.9 );
INSERT INTO CIA_Religion VALUES ('Australia', 'Muslim',         1.5 );
INSERT INTO CIA_Religion VALUES ('Australia', 'Other',          1.2 );
INSERT INTO CIA_Religion VALUES ('Australia', 'Unspecified',    12.7);

INSERT INTO CIA_Ethnic VALUES ('Australia', 'Caucasian',  92);
INSERT INTO CIA_Ethnic VALUES ('Australia', 'Asian',       7);
INSERT INTO CIA_Ethnic VALUES ('Australia', 'Aboriginal',  1);


-- 
-- Brunei
--


INSERT INTO CIA_Country VALUES (
  'Brunei',		-- Country
  'Southeastern Asia',	-- Location
  5770,			-- Land
  'Bukit Pagon',	-- HighestName
  1850,			-- Highest
  'South China',	-- LowestName
  0,			-- Lowest
  2.08,			-- Arable
  374577,		-- Population
  1.02,			-- SexRatio
  27.8,			-- Age14
  3.2,			-- Age65
  1.81,			-- PopGrowth
  2.79,			-- Migration
  13.12,		-- InfantMort
  73.12,		-- LifeExpectM
  77.59,		-- LifeExpectF
  0.1,			-- HIV
  93.9,			-- Literacy
  'constitutional sultanate',	-- Government
  'Bandar Seri Begawan',	-- Capital
  1984,				-- Independence
  'Sultan and Prime Minister Sir HASSANAL Bolkiah',	-- Chief
  9.53,			-- GDP
  0.4,			-- Growth
  219300,		-- OilProd
  14900,		-- OilConsum
  205600,		-- OilExport
  null,			-- CurrAccount
  205900,		-- Mobiles
  56000,		-- Internet
  2819,			-- Paved
  831,			-- Unpaved
  4.5			-- Military
);

INSERT INTO CountryOcean VALUES ('Brunei','Pacific');

INSERT INTO CIA_Language VALUES ('Brunei','Malay',null);
INSERT INTO CIA_Language VALUES ('Brunei','English',null);
INSERT INTO CIA_Language VALUES ('Brunei','Chinese',null);

INSERT INTO CIA_Religion VALUES ('Brunei','Muslim',67);
INSERT INTO CIA_Religion VALUES ('Brunei','Buddhist',13);
INSERT INTO CIA_Religion VALUES ('Brunei','Christian',10);
INSERT INTO CIA_Religion VALUES ('Brunei','other',10);

INSERT INTO CIA_Ethnic VALUES ('Brunei','Malay',67);
INSERT INTO CIA_Ethnic VALUES ('Brunei','Chinese',15);
INSERT INTO CIA_Ethnic VALUES ('Brunei','indigenous',6);
INSERT INTO CIA_Ethnic VALUES ('Brunei','other',12);


-- 
-- Canada
--

INSERT INTO CIA_Country VALUES (
  'Canada',	 		 -- Country
  'Northern North America',	 -- Location
  9093507,	 		 -- Land
  'Mount Logan',	 	 -- HighestName
  5959,	 			 -- Highest
  'Atlantic Ocean',	 	 -- LowestName
  0,	 			 -- Lowest
  4.57,	 			 -- Arable
  33098932,	 		 -- Population
  0.98,	 			 -- SexRatio
  17.6,	 			 -- Age14
  13.3,	 			 -- Age65
  0.88,	 			 -- PopGrowth
  5.85,	 			 -- Migration
  4.69,	 			 -- InfantMort
  76.86,	 		 -- LifeExpectM
  83.74,	 		 -- LifeExpectF
  0.3,	 			 -- HIV
  99,	 			 -- Literacy
  'Constitutional Monarchy that is also a Parliamentary democracy', -- Government
  'Ottawa',	 		 -- Capital
  1867,	 			 -- Independence
  'Michaele Jean', 		 -- Chief
  1165,	 			 -- GDP
  2.8,	 			 -- Growth
  3.135,	 		 -- OilProd
  2294000,	 		 -- OilConsum
  1.6,	 			 -- OilExport
  20.56,	 		 -- CurrAccount
  16.6,	 			 -- Mobiles
  3.934,	 		 -- Internet
  415600,	 		 -- Paved
  626700,	 		 -- Unpaved
  1.1	 			 -- Military
);

INSERT INTO CountryOcean VALUES ('Canada','Atlantic');
INSERT INTO CountryOcean VALUES ('Canada','Arctic');
INSERT INTO CountryOcean VALUES ('Canada','Pacific');

INSERT INTO CIA_Language VALUES ('Canada','English',59.3);
INSERT INTO CIA_Language VALUES ('Canada','French',23.2);
INSERT INTO CIA_Language VALUES ('Canada','Other',17.5);

INSERT INTO CIA_Religion VALUES ('Canada','Roman Catholic',42.6);
INSERT INTO CIA_Religion VALUES ('Canada','Protestant',23.3);
INSERT INTO CIA_Religion VALUES ('Canada','other christian',4.4);
INSERT INTO CIA_Religion VALUES ('Canada','Muslim',1.9);
INSERT INTO CIA_Religion VALUES ('Canada','other and unspecified',11.8);
INSERT INTO CIA_Religion VALUES ('Canada','None',16);

INSERT INTO CIA_Ethnic VALUES ('Canada','British Isles origin',28);
INSERT INTO CIA_Ethnic VALUES ('Canada','French origin',23);
INSERT INTO CIA_Ethnic VALUES ('Canada','other European',15);
INSERT INTO CIA_Ethnic VALUES ('Canada','Amerindian',2);
INSERT INTO CIA_Ethnic VALUES ('Canada','Asian,African,Arab',6);
INSERT INTO CIA_Ethnic VALUES ('Canada','Mix background',26);


-- 
-- Chile
--

INSERT INTO CIA_Country VALUES (
  'Chile',			--	Country
  'Southern South America',	--	Location
  748800,			--	Land
  'Nevado Ojos del Salado',	--	HighestName
  6880,				--	Highest
  'Pacific Ocean',		--	LowestName
  0,				--	Lowest
  2.62,				--	Arable
  16134219,			--	Population
  0.98,				--	SexRatio
  24.7,				--	Age14
  8.2,				--	Age65
  0.94,				--	PopGrowth
  0,				--	Migration
  8.58,				--	InfantMort
  73.49,			--	LifeExpectM
  80.21,			--	LifeExpectF
  0.3,				--	HIV
  96.2,				--	Literacy
  'Republic',			--	Government
  'Santiago',			--	Capital
  1810,				--	Independence
  'Bachelet',			--	Chief
  203,				--	GDP
  4.2,				--	Growth
  15100,			--	OilProd
  238000,			--	OilConsum
  0,				--	OilExport
  5063,				--	CurrAccount
  10.57,			--	Mobiles
  6700000,			--	Internet
  16080,			--	Paved
  63525,			--	Unpaved
  2.7				--	Military
);


INSERT INTO CountryOcean VALUES ('Chile','Pacific');

INSERT INTO CIA_Language VALUES ('Chile','Spanish',100.0);

INSERT INTO CIA_Religion VALUES ('Chile','Roman Catholic',70);
INSERT INTO CIA_Religion VALUES ('Chile','Evangelical',15.1);
INSERT INTO CIA_Religion VALUES ('Chile','Jehovah''s Witness',1.1);
INSERT INTO CIA_Religion VALUES ('Chile','Other Christian',1);
INSERT INTO CIA_Religion VALUES ('Chile','Other',4.6);
INSERT INTO CIA_Religion VALUES ('Chile','None',8.3);

INSERT INTO CIA_Ethnic VALUES ('Chile','White',95);
INSERT INTO CIA_Ethnic VALUES ('Chile','Amerindian',3);
INSERT INTO CIA_Ethnic VALUES ('Chile','Other',2);



-- 
-- China
--

INSERT into CIA_Country VALUES (
  'China',		--	Country
  'Eastern Asia',	--	Location
  9236410,		--	Land
  'Mount Everest',	--	HighestName
  8850,			--	Highest
  'Turpan Pendi',	--	LowestName
  -154,			--	Lowest
  14.86,		--	Arable
  1321851888,		--	Population
  1.06,			--	SexRatio
  20.4,			--	Age14
  7.9,			--	Age65
  0.606,		--	PopGrowth
  -0.39,		--	Migration
  22.12,		--	InfantMort
  71.13,		--	LifeExpectM
  74.82,		--	LifeExpectF
  0.1,			--	HIV
  90.9,			--	Literacy
  'Communist State',	--	Government
  'Beijing',		--	Capital
  -221,			--	Independence
  'Hu Jintao',		--	Chief
  10000,		--	GDP
  10.5,			--	Growth
  3631000,		--	OilProd
  6534000,		--	OilConsum
  443300,		--	OilExport
  179.1,		--	CurrAccount
  437.48,		--	Mobiles
  123000000,		--	Internet
  1515797,		--	Paved
  354864,		--	Unpaved
  4.3			--	Military
);

INSERT INTO CIA_Language VALUES ('China','Chinese',null);
INSERT INTO CIA_Language VALUES ('China','Mandarin',null);
INSERT INTO CIA_Language VALUES ('China','Yue',null);
INSERT INTO CIA_Language VALUES ('China','Wu',null);
INSERT INTO CIA_Language VALUES ('China','Minbei',null);
INSERT INTO CIA_Language VALUES ('China','Minnan',null);
INSERT INTO CIA_Language VALUES ('China','Xiang',null);
INSERT INTO CIA_Language VALUES ('China','Gan',null);
INSERT INTO CIA_Language VALUES ('China','Hakka',null);

INSERT INTO CIA_Religion VALUES ('China','Daoist',null);
INSERT INTO CIA_Religion VALUES ('China','Buddhist',null);
INSERT INTO CIA_Religion VALUES ('China','Christian',4);
INSERT INTO CIA_Religion VALUES ('China','Muslim',2);

INSERT INTO CIA_Ethnic VALUES ('China','Han Chinese',91.9);
INSERT INTO CIA_Ethnic VALUES ('China','Zhuang',null);
INSERT INTO CIA_Ethnic VALUES ('China','Ugyar',null);
INSERT INTO CIA_Ethnic VALUES ('China','Hui',null);
INSERT INTO CIA_Ethnic VALUES ('China','Yi',null);
INSERT INTO CIA_Ethnic VALUES ('China','Tibetan',null);
INSERT INTO CIA_Ethnic VALUES ('China','Miao',null);
INSERT INTO CIA_Ethnic VALUES ('China','Manchu',null);
INSERT INTO CIA_Ethnic VALUES ('China','Mongol',null);
INSERT INTO CIA_Ethnic VALUES ('China','Buyi',null);
INSERT INTO CIA_Ethnic VALUES ('China','Korean',null);
INSERT INTO CIA_Ethnic VALUES ('China','Other',8.1);

INSERT INTO CountryOcean VALUES ('China','Pacific');

-- 
-- Indonesia
--

INSERT INTO CIA_Country VALUES (
  'Indonesia',		--	Country
  'Southeastern Asia',	--	Location
  1826440,		--	Land
  'Puncak Jaya',	--	HighestName
  5030,			--	Highest
  'Indian Ocean',	--	LowestName
  0,			--	Lowest
  11.03,		--	Arable
  234693997,		--	Population
  1.001,		--	SexRatio
  28.7,			--	Age14
  5.7,			--	Age65
  1.213,		--	PopGrowth
  -1.27,		--	Migration
  32.14,		--	InfantMort
  67.69,		--	LifeExpectM
  72.76,		--	LifeExpectF
  0.1,			--	HIV
  87.9,			--	Literacy
  'Republic',		--	Government
  'Jakarta',		--	Capital
  1945,			--	Independence
  'Yudhoyono',		--	Chief
  935,			--	GDP
  5.4,			--	Growth
  1.136,		--	OilProd
  1168000,		--	OilConsum
  474000,		--	OilExport
  1.636,		--	CurrAccount
  46.91,		--	Mobiles
  16000000,		--	Internet
  213649,		--	Paved
  154711,		--	Unpaved
  3.0			--	Military
);

INSERT INTO CIA_Language VALUES ('Indonesia','Bahasa Indonesia',null); 
INSERT INTO CIA_Language VALUES ('Indonesia','English',null);
INSERT INTO CIA_Language VALUES ('Indonesia','Dutch',null);
INSERT INTO CIA_Language VALUES ('Indonesia','local dialects',null);       

INSERT INTO CIA_Religion VALUES ('Indonesia','Muslim',88);
INSERT INTO CIA_Religion VALUES ('Indonesia','Protestant',5);
INSERT INTO CIA_Religion VALUES ('Indonesia','Roman catholic',3);
INSERT INTO CIA_Religion VALUES ('Indonesia','Hindu',2);
INSERT INTO CIA_Religion VALUES ('Indonesia','Buddhist',1);
INSERT INTO CIA_Religion VALUES ('Indonesia','other',1);

INSERT INTO CIA_Ethnic VALUES ('Indonesia','Javanese',45);
INSERT INTO CIA_Ethnic VALUES ('Indonesia','Sundanese',14);
INSERT INTO CIA_Ethnic VALUES ('Indonesia','Madurese',7.5);
INSERT INTO CIA_Ethnic VALUES ('Indonesia','coastal Malays',7.5);
INSERT INTO CIA_Ethnic VALUES ('Indonesia','other',26);

INSERT INTO CountryOcean VALUES ('Indonesia','Indian');
INSERT INTO CountryOcean VALUES ('Indonesia','Pacific');


-- 
-- Japan
--

INSERT INTO CIA_Country VALUES (
  'Japan',		--	Country
  'Eastern Asia',	--	Location
  377835,		--	Land
  'Mount Fuji',		--	HighestName
  3776,			--	Highest
  'Hachiro-gata',	--	LowestName
  -4,			--	Lowest
  11.64,		--	Arable
  127433494,		--	Population
  0.953,		--	SexRatio
  13.8,			--	Age14
  21,			--	Age65
  -0.088,		--	PopGrowth
  null,			--	Migration
  2.8,			--	InfantMort
  78.67,		--	LifeExpectM
  85.56,		--	LifeExpectF
  0.1,			--	HIV
  99,			--	Literacy
  'Constitutional Monarchy',	--	Government
  'Tokyo',		--	Capital
  660,			--	Independence
  'AKIHITO',		--	Chief
  4338,			--	GDP
  2.8,			--	Growth
  125000,		--	OilProd
  5578000,		--	OilConsum
  93360,		--	OilExport
  1744000000,		--	CurrAccount
  94745000,		--	Mobiles
  86300000,		--	Internet
  925000,		--	Paved
  258000,		--	Unpaved
  0.8			--	Military
);

INSERT INTO CIA_Language VALUES ('Japan','Japanese',100);

INSERT INTO CIA_Religion VALUES ('Japan','Shinto and Buddhist',84);
INSERT INTO CIA_Religion VALUES ('Japan','Christian',0.7);
INSERT INTO CIA_Religion VALUES ('Japan','Other',15.3);

INSERT INTO CIA_Ethnic VALUES ('Japan','Japanese',99);
INSERT INTO CIA_Ethnic VALUES ('Japan','Other',1);

INSERT INTO CountryOcean VALUES ('Japan','Pacific');


--
-- Korea, South
-- 

INSERT INTO CIA_Country VALUES (
  'Korea, South',	--	Country
  'Eastern Asia',	--	Location
  98190,		--	Land
  'Halla-san',		--	HighestName
  1950,			--	Highest
  'Sea of Japan',	--	LowestName
  0,			--	Lowest
  16.58,		--	Arable
  48846823,		--	Population
  1.01,			--	SexRatio
  1.14,			--	Age14
  0.68,			--	Age65
  0.42,			--	PopGrowth
  0,			--	Migration
  6.16,			--	InfantMort
  73.61,		--	LifeExpectM
  80.75,		--	LifeExpectF
  0.1,			--	HIV
  97.9,			--	Literacy
  'Republic',		--	Government
  'Seoul',		--	Capital
  1945,			--	Independence
  'Moo-hyun',		--	Chief
  1180,			--	GDP
  4.8,			--	Growth
  7378,			--	OilProd
  2149,			--	OilConsum
  645200,		--	OilExport
  2,			--	CurrAccount
  38.342,		--	Mobiles
  33900000,		--	Internet
  87032,		--	Paved
  13247,		--	Unpaved
  2.7			--	Military
);

INSERT INTO CIA_Language VALUES ('Korea, South','Korean',NULL);
INSERT INTO CIA_Language VALUES ('Korea, South','English',NULL);

INSERT INTO CIA_Religion VALUES ('Korea, South','Christian',26);
INSERT INTO CIA_Religion VALUES ('Korea, South','Buddhist',26);
INSERT INTO CIA_Religion VALUES ('Korea, South','Confucianist',1);
INSERT INTO CIA_Religion VALUES ('Korea, South','no affiliation',46);
INSERT INTO CIA_Religion VALUES ('Korea, South','other',1);

INSERT INTO CIA_Ethnic VALUES ('Korea, South','homogenous',100);

INSERT INTO CountryOcean VALUES ('Korea, South','Pacific');



-- 
-- Malaysia
--

INSERT INTO CIA_Country VALUES (
  'Malaysia',		--	Country
  'Southeastern Asia',	--	Location
  328550,		--	Land
  'Gunung Kinabalu',	--	HighestName
  4100,			--	Highest
  'Indian Ocean',	--	LowestName
  0,			--	Lowest
  5.46,			--	Arable
  24385858,		--	Population
  1.01,			--	SexRatio
  1.06,			--	Age14
  0.79,			--	Age65
  1.78,			--	PopGrowth
  0,			--	Migration
  17.16,		--	InfantMort
  69.8,			--	LifeExpectM
  75.38,		--	LifeExpectF
  0.4,			--	HIV
  88.7,			--	Literacy
  'Constitutional Monarchy',	--	Government
  'Kuala Lumpur',	--	Capital
  1957,			--	Independence
  'Sultan MIZAN Zainal Abidin',	--	Chief
  308.8,		--	GDP
  5.5,			--	Growth
  770000,		--	OilProd
  51500,		--	OilConsum
  230200,		--	OilExport
  17.86,		--	CurrAccount
  19.545,		--	Mobiles
  11016000,		--	Internet
  80280,		--	Paved
  18441,		--	Unpaved
  2.03			--	Military
);

INSERT INTO CIA_Language VALUES ('Malaysia','Malay',50.4);
INSERT INTO CIA_Language VALUES ('Malaysia','Chinese',23.7);
INSERT INTO CIA_Language VALUES ('Malaysia','Indigenous',11);
INSERT INTO CIA_Language VALUES ('Malaysia','Indian',7.1);
INSERT INTO CIA_Language VALUES ('Malaysia','Others',7.8);

INSERT INTO CIA_Religion VALUES ('Malaysia','Muslim',null);
INSERT INTO CIA_Religion VALUES ('Malaysia','Buddhist',null);
INSERT INTO CIA_Religion VALUES ('Malaysia','Daoist',null);
INSERT INTO CIA_Religion VALUES ('Malaysia','Hindu',null);
INSERT INTO CIA_Religion VALUES ('Malaysia','Christian',null);
INSERT INTO CIA_Religion VALUES ('Malaysia','Sikh',null);

INSERT INTO CIA_Ethnic VALUES ('Malaysia','Malay',50.4);
INSERT INTO CIA_Ethnic VALUES ('Malaysia','Chinese',23.7);
INSERT INTO CIA_Ethnic VALUES ('Malaysia','Indigenous',11);
INSERT INTO CIA_Ethnic VALUES ('Malaysia','Indian',7.1);
INSERT INTO CIA_Ethnic VALUES ('Malaysia','Others',7.8);

INSERT INTO CountryOcean VALUES ('Malaysia','Pacific');


-- 
-- Mexico
--

INSERT INTO CIA_Country VALUES (
  'Mexico',		--	Country
  'Middle America',	--	Location
  1972550,		--	Land
  'Volcan Pico de Orizaba',	--	HighestName
  5700,			--	Highest
  'Laguna Salada',	--	LowestName
  -10,			--	Lowest
  12.66,		--	Arable
  107449525,		--	Population
  0.96,			--	SexRatio
  30.6,			--	Age14
  5.8,			--	Age65
  1.16,			--	PopGrowth
  -4.32,		--	Migration
  20.26,		--	InfantMort
  72.63,		--	LifeExpectM
  78.33,		--	LifeExpectF
  0.3,			--	HIV
  92.2,			--	Literacy
  'Republic',		--	Government
  'Mexico',		--	Capital
  1810,			--	Independence
  'President Felipe de Jesus CALDERON Hinojosa',	--	Chief
  1134,			--	GDP
  4.5,			--	Growth
  3420000,		--	OilProd
  1970000,		--	OilConsum
  1863000,		--	OilExport
  -400.1,		--	CurrAccount
  47.462,		--	Mobiles
  18.622,		--	Internet
  116751,		--	Paved
  118919,		--	Unpaved
  0.5			--	Military
);

INSERT INTO CIA_Language VALUES ('Mexico','Spanish',null);

INSERT INTO CIA_Religion VALUES ('Mexico','Roman Catholic',89);
INSERT INTO CIA_Religion VALUES ('Mexico','Protestant',6);
INSERT INTO CIA_Religion VALUES ('Mexico','Other',5);

INSERT INTO CIA_Ethnic VALUES ('Mexico','Amerindian-Spanish',60);
INSERT INTO CIA_Ethnic VALUES ('Mexico','Amerindian',30);
INSERT INTO CIA_Ethnic VALUES ('Mexico','White',9);
INSERT INTO CIA_Ethnic VALUES ('Mexico','Other',1);

INSERT INTO CountryOcean VALUES ('Mexico','Pacific');


-- 
-- New Zealand
--

INSERT INTO CIA_Country VALUES (
  'New Zealand',	--	Country
  'Oceania',		--	Location
  268021,		--	Land
  'Aoraki-Mount Cook',	--	HighestName
  3754,			--	Highest
  'Pacific Ocean',	--	LowestName
  0,			--	Lowest
  5.54,			--	Arable
  4115771,		--	Population
  0.99,			--	SexRatio
  20.8,			--	Age14
  11.9,			--	Age65
  0.95,			--	PopGrowth
  3.43,			--	Migration
  5.67,			--	InfantMort
  75.97,		--	LifeExpectM
  82.08,		--	LifeExpectF
  0.1,			--	HIV
  99,			--	Literacy
  'parliamentary democracy',	--	Government
  'Wellington',		--	Capital
  1907,			--	Independence
  'Queen ELIZABETH II',	--	Chief
  106,			--	GDP
  1.9,			--	Growth
  27860,		--	OilProd
  150600,		--	OilConsum
  30220,		--	OilExport
  -7.94,		--	CurrAccount
  3.53,			--	Mobiles
  3.2,			--	Internet
  59783,		--	Paved
  33148,		--	Unpaved
  1			--	Military
);

INSERT INTO CIA_Language VALUES ('New Zealand','English',null);
INSERT INTO CIA_Language VALUES ('New Zealand','Maori',null);
INSERT INTO CIA_Language VALUES ('New Zealand','Sign Language',null);

INSERT INTO CIA_Religion VALUES ('New Zealand','Anglican',14.9);
INSERT INTO CIA_Religion VALUES ('New Zealand','Roman Catholic',12.4);
INSERT INTO CIA_Religion VALUES ('New Zealand','Presbyterian',10.9);
INSERT INTO CIA_Religion VALUES ('New Zealand','Methodist',2.9);
INSERT INTO CIA_Religion VALUES ('New Zealand','Pentecostal',1.7);
INSERT INTO CIA_Religion VALUES ('New Zealand','Baptist',1.3);
INSERT INTO CIA_Religion VALUES ('New Zealand','other Christian',9.4);
INSERT INTO CIA_Religion VALUES ('New Zealand','other',3.3);
INSERT INTO CIA_Religion VALUES ('New Zealand','unspecified',17.2);
INSERT INTO CIA_Religion VALUES ('New Zealand','none',26);

INSERT INTO CIA_Ethnic VALUES ('New Zealand','European',69.8);
INSERT INTO CIA_Ethnic VALUES ('New Zealand','Maori',7.9);
INSERT INTO CIA_Ethnic VALUES ('New Zealand','Asean',5.7);
INSERT INTO CIA_Ethnic VALUES ('New Zealand','Pacific islander',4.4);
INSERT INTO CIA_Ethnic VALUES ('New Zealand','mixed',0.5);
INSERT INTO CIA_Ethnic VALUES ('New Zealand','others',7.8);
INSERT INTO CIA_Ethnic VALUES ('New Zealand','unspecified',3.8);

INSERT INTO CountryOcean VALUES ('New Zealand','Pacific');


-- 
-- Philippines
--

INSERT INTO CIA_Country VALUES (
  'Philippines',	--	Country
  'Southeastern Asia',	--	Location
  300000,		--	Land
  'Mount Apo',		--	HighestName
  2954,			--	Highest
  'Philippine Sea',	--	LowestName
  0,			--	Lowest
  19,			--	Arable
  89468677,		--	Population
  1,			--	SexRatio
  35,			--	Age14
  4.1,			--	Age65
  1.8,			--	PopGrowth
  -1.48,		--	Migration
  22.81,		--	InfantMort
  67.32,		--	LifeExpectM
  73.24,		--	LifeExpectF
  0.1,			--	HIV
  92.6,			--	Literacy
  'Republic',		--	Government
  'Manila',		--	Capital
  1898,			--	Independence
  'President Gloria MACAPAGAL-ARROYO',		--	Chief
  443.1,		--	GDP
  5.4,			--	Growth
  25320,		--	OilProd
  342000,		--	OilConsum
  0,			--	OilExport
  4.9,			--	CurrAccount
  32.81,		--	Mobiles
  7.82,			--	Internet
  19804,		--	Paved
  180233,		--	Unpaved
  0.9			--	Military
);


INSERT INTO CIA_Language VALUES ('Philippines','Filipino',null);
INSERT INTO CIA_Language VALUES ('Philippines','English',null);

INSERT INTO CIA_Religion VALUES ('Philippines','Roman Catholic',80.9);
INSERT INTO CIA_Religion VALUES ('Philippines','Muslim',5);
INSERT INTO CIA_Religion VALUES ('Philippines','Evangelical',2.8);
INSERT INTO CIA_Religion VALUES ('Philippines','Iglesia ni Kristo',2.3);
INSERT INTO CIA_Religion VALUES ('Philippines','Aglipayan',2);
INSERT INTO CIA_Religion VALUES ('Philippines','Other Christian',4.5);
INSERT INTO CIA_Religion VALUES ('Philippines','Other',1.8);
INSERT INTO CIA_Religion VALUES ('Philippines','Unspecified',.6);
INSERT INTO CIA_Religion VALUES ('Philippines','none',.1);

INSERT INTO CIA_Ethnic VALUES ('Philippines','Tagalog',28.1);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Cebuani',13.1);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Ilocano',9);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Bisaya/Binisaya',7.6);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Hiligaynon Ilonggo',7.5);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Bikol',6);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Waray',3.4);
INSERT INTO CIA_Ethnic VALUES ('Philippines','Other',25.3);

INSERT INTO CountryOcean VALUES ('Philippines','Pacific');


--
-- Papua New Guinea
-- 

INSERT INTO CIA_Country VALUES (
  'Papua New Guinea',	--	Country
  'Oceania',		--	Location
  452860,		--	Land
  'Mount Wilhelm',	--	HighestName
  4509,			--	Highest
   'Pacific Ocean',	--	LowestName
  0,			--	Lowest
  0.49,			--	Arable
  5670544,		--	Population
  1.05,			--	SexRatio
  37.8,			--	Age14
  3.9,			--	Age65
  2.21,			--	PopGrowth
  0,			--	Migration
  49.96,		--	InfantMort
  63.08,		--	LifeExpectM
  67.58,		--	LifeExpectF
  0.6,			--	HIV
  64.6,			--	Literacy
   'Constitutional Parliamentary Democracy',	--	Government
  'Port Moresby',	--	Capital
  1975,			--	Independence
  'Queen ELIZABETH II',	--	Chief
  15.13,		--	GDP
   3.2,			--	Growth
  50000,		--	OilProd
  18000,		--	OilConsum
  null,			--	OilExport
  0.661,		--	CurrAccount
  0.026,		--	Mobiles
  170000,		--	Internet
  686,			--	Paved
  18914,		--	Unpaved
  1.4			--	Military
);

INSERT INTO CIA_Language VALUES ('Papua New Guinea','English',2);
INSERT INTO CIA_Language VALUES ('Papua New Guinea','Melanesian Pidgin',null);
INSERT INTO CIA_Language VALUES ('Papua New Guinea','Motu',null);

INSERT INTO CIA_Religion VALUES ('Papua New Guinea','Roman Catholic',22);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','Lutheran',16);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','Presbyterian/Methodist/London Missionary Society',8);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','Anglican',5);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','Evangelical Alliance',4);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','Seventh-Day Adventist',1);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','other Protestant',10);
INSERT INTO CIA_Religion VALUES ('Papua New Guinea','indigenous beliefs',34);

INSERT INTO CIA_Ethnic VALUES ('Papua New Guinea','Melanesian',null);
INSERT INTO CIA_Ethnic VALUES ('Papua New Guinea','Papuan',null);
INSERT INTO CIA_Ethnic VALUES ('Papua New Guinea','Negrito',null);
INSERT INTO CIA_Ethnic VALUES ('Papua New Guinea','Micronesian',null);
INSERT INTO CIA_Ethnic VALUES ('Papua New Guinea','Polynesian',null);

INSERT INTO CountryOcean VALUES ('Papua New Guinea','Pacific');


--
-- Peru
-- 

INSERT INTO CIA_Country VALUES (
  'Peru',			--	Country
  'Western South America',	--	Location
  1285220,			--	Land
  'Nevado Huaseraran',		--	HighestName
  6768,				--	Highest
  'Pacific Ocean',		--	LowestName
  0,				--	Lowest
  2.88,				--	Arable
  28302603,			--	Population
  1.01,				--	SexRatio
  30.9,				--	Age14
  5.3,				--	Age65
  1.32,				--	PopGrowth
  -1.09,			--	Migration
  30.94,			--	InfantMort
  68.05,			--	LifeExpectM
  71.71,			--	LifeExpectF
  0.5,				--	HIV
  87.7,				--	Literacy
  'Constitutional Republic',	--	Government
  'Lima',			--	Capital
  1821,				--	Independence
  'Alan Georcia Perez',		--	Chief
  181.8,			--	GDP
  6.5,				--	Growth
  120000,			--	OilProd
  156000,			--	OilConsum
  49000,			--	OilExport
  1.515,			--	CurrAccount
  5.583,			--	Mobiles
  4600000,			--	Internet
  11351,			--	Paved
  67478,			--	Unpaved
  1.5				--	Military
);

INSERT INTO CIA_Language VALUES ('Peru','Spanish',null);
INSERT INTO CIA_Language VALUES ('Peru','Quechua',null);
INSERT INTO CIA_Language VALUES ('Peru','Aymara',null);

INSERT INTO CIA_Religion VALUES ('Peru','Roman Catholic', 81);
INSERT INTO CIA_Religion VALUES ('Peru','Seventh Day Adventist', 1.4);
INSERT INTO CIA_Religion VALUES ('Peru','Other Christian', 0.7);
INSERT INTO CIA_Religion VALUES ('Peru','Other', 0.6);
INSERT INTO CIA_Religion VALUES ('Peru','None', 16.3);

INSERT INTO CIA_Ethnic VALUES ('Peru','Amerindian', 45);
INSERT INTO CIA_Ethnic VALUES ('Peru','mestizo (mixed Amerindian and white)',37);
INSERT INTO CIA_Ethnic VALUES ('Peru','white', 15);
INSERT INTO CIA_Ethnic VALUES ('Peru','black, Japanese, Chinese, and other', 3);

INSERT INTO CountryOcean VALUES ('Peru','Pacific');


--
-- Russia
-- 

INSERT INTO CIA_Country VALUES (
  'Russia',		--	Country
  'Northern Asia',	--	Location
  17075200,		--	Land
  'Gora Elbrus',	--	HighestName
  5633,			--	Highest
  'Caspian Sea',	--	LowestName
  -28,			--	Lowest
  7.17,			--	Arable
  141377752,		--	Population
  0.859,		--	SexRatio
  14.6,			--	Age14
  14.4,			--	Age65
  -0.484,		--	PopGrowth
  0.28,			--	Migration
  11.06,		--	InfantMort
  59.12,		--	LifeExpectM
  73.03,		--	LifeExpectF
  1.1,			--	HIV
  99.6,			--	Literacy
  'federation',		--	Government
  'Moscow',		--	Capital
  1991,			--	Independence
  'Vladimir Vladimirovich PUTIN',	--	Chief
  1723,			--	GDP
  6600000,		--	Growth
  9400000,		--	OilProd
  2500000,		--	OilConsum
  7,			--	OilExport
  105.3,		--	CurrAccount
  120,			--	Mobiles
  23.7,			--	Internet
  738000,		--	Paved
  133000,		--	Unpaved
  3.9			--	Military
);


INSERT INTO CIA_Language VALUES ('Russia', 'Russian', null);
INSERT INTO CIA_Language VALUES ('Russia', 'Many other minorities', null);

INSERT INTO CIA_Religion VALUES ('Russia', 'Russian Orthodox', 17.5);
INSERT INTO CIA_Religion VALUES ('Russia', 'Muslim', 12.5);
INSERT INTO CIA_Religion VALUES ('Russia', 'Christian', 2);
INSERT INTO CIA_Religion VALUES ('Russia', 'none', 65); 

INSERT INTO CIA_Ethnic VALUES ('Russia', 'Russian', 79.8);
INSERT INTO CIA_Ethnic VALUES ('Russia', 'Tatar', 3.8);
INSERT INTO CIA_Ethnic VALUES ('Russia', 'Ukrainian', 2);
INSERT INTO CIA_Ethnic VALUES ('Russia', 'Bashkir', 1.2);
INSERT INTO CIA_Ethnic VALUES ('Russia', 'Chavash', 1.1);
INSERT INTO CIA_Ethnic VALUES ('Russia', 'Other', 12.1);

INSERT INTO CountryOcean VALUES ('Russia', 'Baltic Sea');
INSERT INTO CountryOcean VALUES ('Russia', 'Caspian Sea');
INSERT INTO CountryOcean VALUES ('Russia', 'Arctic');
INSERT INTO CountryOcean VALUES ('Russia', 'Pacific');


--
-- Singapore
-- 

INSERT INTO CIA_Country VALUES (
  'Singapore',		--	Country
  'South East Asia',	--	Location
  682.7,		--	Land
  'Bukit Timah',	--	HighestName
  166,			--	Highest
  'Singaport Strait',	--	LowestName
  0,			--	Lowest
  1.47,			--	Arable
  4553009,		--	Population
  0.954,		--	SexRatio
  15.2,			--	Age14
  8.5,			--	Age65
  1.275,		--	PopGrowth
  7.98,			--	Migration
  2.3,			--	InfantMort
  84.59,		--	LifeExpectM
  79.21,		--	LifeExpectF
  0.2,			--	HIV
  92.5,			--	Literacy
  'parliamentary republic',	--	Government
  'Singapore',		--	Capital
  1965,			--	Independence
  'Nathan',		--	Chief
  138.6,		--	GDP
  7.4,			--	Growth
  9701,			--	OilProd
  800000,		--	OilConsum
  NULL,			--	OilExport
  35580000000,		--	CurrAccount
  4385000,		--	Mobiles
  2422000,		--	Internet
  3234,			--	Paved
  0,			--	Unpaved
  4.9			--	Military
);

INSERT INTO CIA_Language VALUES ('Singapore','Mandarin',35);
INSERT INTO CIA_Language VALUES ('Singapore','English',23);
INSERT INTO CIA_Language VALUES ('Singapore','Malay',14.1);
INSERT INTO CIA_Language VALUES ('Singapore','Hokkien',11.4);
INSERT INTO CIA_Language VALUES ('Singapore','Cantonese',5.7);
INSERT INTO CIA_Language VALUES ('Singapore','Teochew',4.9);
INSERT INTO CIA_Language VALUES ('Singapore','Tamil',3.2);
INSERT INTO CIA_Language VALUES ('Singapore','Other',2.7);

INSERT INTO CIA_Religion VALUES ('Singapore','Buddhist',42.5);
INSERT INTO CIA_Religion VALUES ('Singapore','Muslim',14.9);
INSERT INTO CIA_Religion VALUES ('Singapore','Taoist',8.5);
INSERT INTO CIA_Religion VALUES ('Singapore','Hindu',4);
INSERT INTO CIA_Religion VALUES ('Singapore','Catholic',4.8);
INSERT INTO CIA_Religion VALUES ('Singapore','Other Christian',9.8);
INSERT INTO CIA_Religion VALUES ('Singapore','Other',0.7);
INSERT INTO CIA_Religion VALUES ('Singapore','None',14.8);

INSERT INTO CIA_Ethnic VALUES ('Singapore','Chinese',76.8);
INSERT INTO CIA_Ethnic VALUES ('Singapore','Malay',13.9);
INSERT INTO CIA_Ethnic VALUES ('Singapore','Indian',7.9);
INSERT INTO CIA_Ethnic VALUES ('Singapore','Other',1.4);

INSERT INTO CountryOcean VALUES ('Singapore','Indian');
INSERT INTO CountryOcean VALUES ('Singapore','Pacific');

--
-- Thailand
-- 

INSERT INTO CIA_Country VALUES (
  'Thailand',		--	Country
  'Southeastern Asia',	--	Location
  511770,		--	Land
  'Doi Inthanon',	--	HighestName
  2576,			--	Highest
  'Gulf of Thailand',	--	LowestName
  0,			--	Lowest
  27.54,		--	Arable
  65068149,		--	Population
  0.98,			--	SexRatio
  21.6,			--	Age14
  70.1,			--	Age65
  0.663,		--	PopGrowth
  0,			--	Migration
  18.85,		--	InfantMort
  70.24,		--	LifeExpectM
  74.98,		--	LifeExpectF
  1.5,			--	HIV
  92.6,			--	Literacy
  'Constitutional Monarchy',	--	Government
  'Bangkok',		--	Capital
  1238,			--	Independence
  'Phumiphon',		--	Chief
  585.9,		--	GDP
  4.8,			--	Growth
  230000,		--	OilProd
  900000,		--	OilConsum
  0,			--	OilExport
  -899.4,		--	CurrAccount
  27.379,		--	Mobiles
  8.42,			--	Internet
  56542,		--	Paved
  861,			--	Unpaved
  1.8			--	Military
);

INSERT INTO CIA_Language VALUES ('Thailand','Thai',null);
INSERT INTO CIA_Language VALUES ('Thailand','English',null);

INSERT INTO CIA_Religion VALUES ('Thailand','Buddhist',94.6);
INSERT INTO CIA_Religion VALUES ('Thailand','Muslim',4.6);
INSERT INTO CIA_Religion VALUES ('Thailand','Christian',0.7);
INSERT INTO CIA_Religion VALUES ('Thailand','other',0.1);

INSERT INTO CIA_Ethnic VALUES ('Thailand','Thai',75);
INSERT INTO CIA_Ethnic VALUES ('Thailand','Chinese',14);
INSERT INTO CIA_Ethnic VALUES ('Thailand','other',11);

INSERT INTO CountryOcean VALUES ('Thailand','Indian');


--
-- United States of America
-- 

INSERT INTO CIA_Country VALUES (
  'United States of America',	--	Country
  'North America',		--	Location
  9161923,			--	Land
  'Mount McKinley',		--	HighestName
  6194,				--	Highest
  'Death Valley',		--	LowestName
  -86,				--	Lowest
  18.01,			--	Arable
  298444215,			--	Population
  0.97,				--	SexRatio
  20.04,			--	Age14
  12.5,				--	Age65
  0.91,				--	PopGrowth
  3.18,				--	Migration
  6.43,				--	InfantMort
  80.82,			--	LifeExpectM
  75.02,			--	LifeExpectF
  0.6,				--	HIV
  99,				--	Literacy
  'Constitution Based Federal Republic',	--	Government
  'Washington DC',		--	Capital
  1776,				--	Independence
  'George W Bush',		--	Chief
  12980,			--	GDP
  3.4,				--	Growth
  7.61,				--	OilProd
  20730000,			--	OilConsum
  1.048,			--	OilExport
  -862.3,			--	CurrAccount
  219.4,			--	Mobiles
  205.327,			--	Internet
  4165110,			--	Paved
  2265256,			--	Unpaved
  4.06				--	Military
);

INSERT INTO CIA_Language VALUES ('United States of America','English',82.1);
INSERT INTO CIA_Language VALUES ('United States of America','Spanish',10.7);
INSERT INTO CIA_Language VALUES ('United States of America','Other Indo European',3.8);
INSERT INTO CIA_Language VALUES ('United States of America','Asian & Pacific Island',2.7);
INSERT INTO CIA_Language VALUES ('United States of America','Other',0.70);

INSERT INTO CIA_Religion VALUES ('United States of America','Protestant',52);
INSERT INTO CIA_Religion VALUES ('United States of America','Roman Catholic',24);
INSERT INTO CIA_Religion VALUES ('United States of America','Mormon',2);
INSERT INTO CIA_Religion VALUES ('United States of America','Jewish',1);
INSERT INTO CIA_Religion VALUES ('United States of America','Muslim',1);
INSERT INTO CIA_Religion VALUES ('United States of America','Other',10);
INSERT INTO CIA_Religion VALUES ('United States of America','None',10);

INSERT INTO CIA_Ethnic VALUES ('United States of America','White',81.7);
INSERT INTO CIA_Ethnic VALUES ('United States of America','Black',12.9);
INSERT INTO CIA_Ethnic VALUES ('United States of America','Asian',4.2);
INSERT INTO CIA_Ethnic VALUES ('United States of America','Amerindian & Alaska Native',1);
INSERT INTO CIA_Ethnic VALUES ('United States of America','Native Hawaiian & Other Pacific Islander',0.2);

INSERT INTO CountryOcean VALUES ('United States of America','Pacific');
INSERT INTO CountryOcean VALUES ('United States of America','Atlantic');


--
-- Vietnam
-- 

INSERT INTO CIA_Country VALUES (
  'Vietnam',		--	Country
  'Southeastern Asia',	--	Location
  325360,		--	Land
  'Fan Si Pan',		--	HighestName
  3144,			--	Highest
  'South China Sea',	--	LowestName
  0,			--	Lowest
  20.14,		--	Arable
  85262356,		--	Population
  0.982,		--	SexRatio
  1.077,		--	Age14
  0.634,		--	Age65
  1.004,		--	PopGrowth
  -0.4,			--	Migration
  24.37,		--	InfantMort
  68.27,		--	LifeExpectM
  74.08,		--	LifeExpectF
  0.4,			--	HIV
  90.3,			--	Literacy
  'Communist state',	--	Government
  'Hanoi',		--	Capital
  1945,			--	Independence
  'TRIET',		--	Chief
  258.6,		--	GDP
  7.8,			--	Growth
  400000,		--	OilProd
  230000,		--	OilConsum
  null,			--	OilExport
  1.029,		--	CurrAccount
  9.593,		--	Mobiles
  13100000,		--	Internet
  42167,		--	Paved
  180012,		--	Unpaved
  2.5			--	Military
);

INSERT INTO CIA_Language VALUES ('Vietnam','Vietnamese',null);
INSERT INTO CIA_Language VALUES ('Vietnam','English',null);
INSERT INTO CIA_Language VALUES ('Vietnam','French',null);
INSERT INTO CIA_Language VALUES ('Vietnam','Chinese',null);
INSERT INTO CIA_Language VALUES ('Vietnam','Khmer',null);

INSERT INTO CIA_Religion VALUES ('Vietnam','Buddhist',9.3);
INSERT INTO CIA_Religion VALUES ('Vietnam','Catholic',6.7);
INSERT INTO CIA_Religion VALUES ('Vietnam','Hoa Hao',1.5);
INSERT INTO CIA_Religion VALUES ('Vietnam','Cao Dai',1.1);
INSERT INTO CIA_Religion VALUES ('Vietnam','Protestant',0.5);
INSERT INTO CIA_Religion VALUES ('Vietnam','Muslim',0.1);
INSERT INTO CIA_Religion VALUES ('Vietnam','none',80.8);

INSERT INTO CIA_Ethnic VALUES ('Vietnam','Kinh (Viet)',86.2);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Tay',1.9);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Thai',1.7);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Muong',1.5);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Khome',1.4);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Hoa',1.1);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Nun',1.1);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','Hmong',1);
INSERT INTO CIA_Ethnic VALUES ('Vietnam','others',4.1);

INSERT INTO CountryOcean VALUES ('Vietnam','Pacific');


-- 
-- CIA_Neighbour insertion
--

INSERT INTO CIA_Neighbour VALUES ('Afghanistan','China',76);
INSERT INTO CIA_Neighbour VALUES ('Argentina','Chile',5308);
INSERT INTO CIA_Neighbour VALUES ('Argentina','Peru',171);
INSERT INTO CIA_Neighbour VALUES ('Azerbaijan','Russia', 284);
INSERT INTO CIA_Neighbour VALUES ('Belarus','Russia', 959);
INSERT INTO CIA_Neighbour VALUES ('Bhutan','China',470);
INSERT INTO CIA_Neighbour VALUES ('Bolivia','Chile',860);
INSERT INTO CIA_Neighbour VALUES ('Bolivia','Peru',1075);
INSERT INTO CIA_Neighbour VALUES ('Brazil','Peru',2995);
INSERT INTO CIA_Neighbour VALUES ('Brunei','Malaysia',381);
INSERT INTO CIA_Neighbour VALUES ('Burma','China',2185);
INSERT INTO CIA_Neighbour VALUES ('Burma','Thailand',1800);
INSERT INTO CIA_Neighbour VALUES ('Cambodia','Thailand',803);
INSERT INTO CIA_Neighbour VALUES ('Cambodia','Vietnam',1228);
INSERT INTO CIA_Neighbour VALUES ('Canada','United States of America',8893);
INSERT INTO CIA_Neighbour VALUES ('Chile','Peru',171);
INSERT INTO CIA_Neighbour VALUES ('China','India',3380);
INSERT INTO CIA_Neighbour VALUES ('China','Kazakhstan',1533);
INSERT INTO CIA_Neighbour VALUES ('China','Kyrgyzstan',858);
INSERT INTO CIA_Neighbour VALUES ('China','Laos',423);
INSERT INTO CIA_Neighbour VALUES ('China','Macau',0.34);
INSERT INTO CIA_Neighbour VALUES ('China','Mongolia',4677);
INSERT INTO CIA_Neighbour VALUES ('China','Nepal',1236);
INSERT INTO CIA_Neighbour VALUES ('China','Korea, North',1416);
INSERT INTO CIA_Neighbour VALUES ('China','Pakistan',523);
INSERT INTO CIA_Neighbour VALUES ('China','Russia',3645);
INSERT INTO CIA_Neighbour VALUES ('China','Tajikistan',414);
INSERT INTO CIA_Neighbour VALUES ('China','Vietnam',1281);
INSERT INTO CIA_Neighbour VALUES ('Colombia','Peru',1800);
INSERT INTO CIA_Neighbour VALUES ('Indonesia','Timor-Leste',228);
INSERT INTO CIA_Neighbour VALUES ('Ecuador','Peru',1420);
INSERT INTO CIA_Neighbour VALUES ('Estonia','Russia', 294);
INSERT INTO CIA_Neighbour VALUES ('Finland','Russia', 1340);
INSERT INTO CIA_Neighbour VALUES ('Georgia','Russia', 723);
INSERT INTO CIA_Neighbour VALUES ('Indonesia','Malaysia',1782);
INSERT INTO CIA_Neighbour VALUES ('Indonesia','Papua New Guinea',820);
INSERT INTO CIA_Neighbour VALUES ('Kazakhstan','Russia', 6846);
INSERT INTO CIA_Neighbour VALUES ('Laos','Thailand',1754);
INSERT INTO CIA_Neighbour VALUES ('Laos','Vietnam',2130);
INSERT INTO CIA_Neighbour VALUES ('Latvia','Russia', 217);
INSERT INTO CIA_Neighbour VALUES ('Lithuania','Russia', 280.5);
INSERT INTO CIA_Neighbour VALUES ('Malaysia','Thailand',506);
INSERT INTO CIA_Neighbour VALUES ('Mexico','United States of America',3141);
INSERT INTO CIA_Neighbour VALUES ('Mongolia','Russia', 3485);
INSERT INTO CIA_Neighbour VALUES ('Korea, North','Russia', 19);
INSERT INTO CIA_Neighbour VALUES ('Korea, North','Korea, South',238);
INSERT INTO CIA_Neighbour VALUES ('Norway','Russia', 196);
INSERT INTO CIA_Neighbour VALUES ('Poland','Russia', 232);
INSERT INTO CIA_Neighbour VALUES ('Russia','Ukraine',  1576);
