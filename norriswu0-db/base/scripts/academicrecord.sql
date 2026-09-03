-- 
-- The Academic Record Database
-- Database Design by Raymond Lister, last modified Spring 2010
--
-- This database describes the academic record of students
--


DROP TABLE ARenrollment CASCADE;
DROP TABLE ARsubject    CASCADE;
DROP TABLE ARstudent    CASCADE;
DROP TABLE ARdegree     CASCADE;


CREATE TABLE ARdegree
(
	degreeCode	TEXT,
	degreeName	TEXT    NOT NULL,
	
	CONSTRAINT ARdegreePK PRIMARY KEY (degreeCode)
);


CREATE TABLE ARstudent
(
	studentNo	CHAR(8),
	studentName	TEXT	 NOT NULL,
	studentBirth	INTEGER,
	studentGender	CHAR(1),
	degreeCode	TEXT,

	CONSTRAINT ARstudent_pk PRIMARY KEY (studentNo),

        CONSTRAINT di_table_ARstudent_studentNo CHECK (studentNo IN (
          '03019116', '10353441', '10454128', '10544296', '10569972',
          '10645036', '10674493', '10675510', '10684999', '10697833',
          '10744391', '10759811', '10774863', '10778874', '10786960',
          '10808970', '10813006', '10835965', '10864369', '10886000',
          '10896746', '10897078', '10907513', '10922324', '10922817',
          '10922856', '10924696', '10927022', '10931487', '10931931',
          '10940385', '10956959', '10956973', '10969234', '10969400',
          '10973752', '10974804', '10976912', '10983118', '10985152',
          '10986154', '10986519', '11058082', '11059159', '11061379',
          '11062787', '11065481', '11068970', '11070481', '11074693',
          '11083387', '11084706', '11085747', '11086016', '11086562',
          '11087424', '11089455', '11092259', '11092689', '11093883',
          '11093921', '11094909', '11097223', '11102403', '11103153',
          '11103355', '11103429', '11103431', '11103544', '11104282',
          '11104484', '11107859', '11108471', '11109307', '11109360',
          '11109749', '11109764', '11114004', '11115425', '11115944',
          '11116264', '11118395', '11119031', '11120868', '11121011',
          '11121454', '11122189', '11122241', '11122280', '11122379',
          '11123801', '11123813', '11123902', '11123938', '11123989',
          '11124447', '11124563', '11124878', '11125085', '11125628',
          '11125958', '11126885', '11127394', '11128523', '11128954',
          '11132469', '11133713', '11133877', '11134754', '11135643',
          '11136746', '11138245', '88424811', '98029390', '99079535'
        )),

        CONSTRAINT di_table_ARstudent_studentName CHECK (studentName IN (
          'Aamann, Louise', 'Abbas, Qassim', 'Ahadi, Alireza',
          'Al Khathlan, Rashid', 'Al Saeed, Aqeel', 'Alahmari, Nawal Awadh',
          'Alamri, Abdullah', 'Alanssari, Yousif', 'Almarwani, Amna',
          'Almotairi, Fahad', 'Almwari, Rami', 'Alqarni, Lulwah',
          'Arjonillo, Francis', 'Arjpru, Chanissara', 'Behl, Pankaj',
          'Bell, Duncan', 'Bukhari, Abdullah', 'Chandler, Paul',
          'Chen, Liang', 'Chen, Ruitao', 'Chiou, Tay-Yi', 'Cook, David',
          'Cui, Guanyuan', 'Da Silva Ponde Serra, Gabriel',
          'Declase, James', 'Donoghoe, Bernadette', 'Du, Minmin',
          'Duckett, Mark', 'Dudek, Matthew', 'Elias, Bradley',
          'Faldu, Priyanka', 'Falemban, Elham', 'Fallatah, Hana',
          'Felimban, Dalal', 'Fukase, Sonoe', 'Gilshenen, Dennis',
          'Guo, Min', 'Gupta, Arpit', 'Hamid, Negar',
          'Hauge Mortensen, Ann-Sofie', 'He, Shan', 'Heilers, Marcus',
          'Hoang, Van', 'Huang, Fei', 'Ishac, Nancy', 'Janik, Robert',
          'Jayadevan, Kirti', 'Ji, Xiang', 'Kang, SeungHeon',
          'Kim, Minsuck', 'Li, Chaochen', 'Li, Yang', 'Liang, Jianhui',
          'Lim, Anchalee', 'Liu, Wenfu', 'Ma, Cheng Kun', 'Macgregor, Alison',
          'Martignago, Michael', 'McRae, Andrew', 'Nguyen, Duc',
          'Ning, Tao', 'Pan, Yaokun', 'Pedersen, Jimmy', 'Phan, Hoang',
          'Piao, Huizhen', 'Porangada, Nanaiah', 'Punsalan, Nicole',
          'Ragavan, Surbhi', 'Raghavendra, Venkatesh', 'Randhawa, Jaspreet',
          'Ren, Jianing', 'Riveros Gutierrez, Pedro', 'Rivers, Robert',
          'Saini, Amandeep', 'Saraiya, Veena', 'Seethapathy, Deepak',
          'Shargawi, M', 'Sharma, Shashwat', 'Shi, Guang', 'Skuta, Gerald',
          'Sukumaran Nair, Dheerakumar', 'Sun, Jiayi',
          'Suvithayapornskul, Thanaphan', 'Tan, Qinyun', 'Tang, Ruichao',
          'Tao, Ruizhe', 'Taylor, Michael', 'Teh, Boon Chin', 'Tong, Ke',
          'Uemura, Mitsuhide', 'Uribe, David', 'Valivety, Haritha',
          'Villanueva, Ganjar', 'Wang, Di', 'Wang, Kai -Ping',
          'Wang, Sida', 'Wang, Ziqi', 'Weise, Christian', 'Wen, Zhiye',
          'Wiriyapong, Siwarux', 'Wu, Roydon', 'Xu, Shen', 'Yan, Yu',
          'Yeleswarapu, Srinivas Subramanyam Shashank', 'Yip, Christina',
          'Yuan, Shuang', 'Yue, Weiming', 'Zeng, Jie', 'Zhan, Hao',
          'Zhan, Ke', 'Zhang, Haide', 'Zhang, Jonson', 'Zhang, Kecheng',
          'Zhao, Qian', 'Zhou, Peng'
        )),

        CONSTRAINT di_table_ARstudent_student_birth CHECK
                               (studentBirth >= 1900 AND studentBirth <= 1999),

        CONSTRAINT di_table_ARstudent_gender CHECK (studentGender IN (
                'M',    -- Male
                'F')),  -- Female

        CONSTRAINT ARstudentFK_degreeCode FOREIGN KEY
                                               (degreeCode) REFERENCES ARdegree
);


CREATE TABLE ARsubject
(
	subjectNo	INTEGER,
	subjectName 	TEXT       NOT NULL,

        CONSTRAINT ARsubjectPK PRIMARY KEY (subjectNo),

        CONSTRAINT di_table_ARsubject_subjectNo CHECK (subjectNo >= 10000 AND
                                                       subjectNo <= 99999)
);


CREATE TABLE ARenrollment
(
	studentNo	CHAR(8),
	subjectNo  	INTEGER,
	year		INTEGER,
	semester	TEXT,
	grade		CHAR(1),

   CONSTRAINT ARenrollmentPK PRIMARY KEY (studentNo, subjectNo, year, semester),

   CONSTRAINT ARenrollmentFK_student FOREIGN KEY
                                               (studentNo) REFERENCES ARstudent,

   CONSTRAINT ARenrollmentFK_subject FOREIGN KEY
                                               (subjectNo) REFERENCES ARsubject,

   CONSTRAINT di_table_enrollment_year CHECK 
             ((year >= 1990 AND year <= 2010)  OR  (grade  = 'M' AND year = 0)),

   CONSTRAINT di_table_enrollment_semester CHECK (semester IN (
                'autumn', 'spring', 'summer', 'winter', 'exempt', 'other')),

   CONSTRAINT di_table_ARenrollment_grade CHECK (grade IN (
                'C',   -- Credit
                'D',   -- Distinction
                'E',   -- Grade not submitted by the subject coordinator
                'H',   -- High Distinction
                'M',   -- The student was granted an exemption for that subject
                'P',   -- Pass
                'Q',   -- Grade pending
                'S',   -- Satisfactory
                'T',   -- Supplementary Pending
                'W',   -- Grade Withheld by the subject coordinator
                'X',   -- Unsatisfactory performance in a compulsory component
                'Z'   -- Fail
             )),

   CONSTRAINT di_table_ARenrollment_grade_M_but_semester_year_mismatch CHECK
             ((grade  <> 'M') OR
              (grade   = 'M' AND Year = 0 AND semester = 'exempt'))
);


INSERT INTO ARdegree VALUES('C04158','Master of Interactive Multimedia');
INSERT INTO ARdegree VALUES('C04160','Master of Science in Internetworking');
INSERT INTO ARdegree VALUES('C09019','Bachelor of Science (Honours) in IT');
INSERT INTO ARdegree VALUES('C10026','Bachelor of Business');
INSERT INTO ARdegree VALUES('C10061','Bachelor of Engineering');
INSERT INTO ARdegree VALUES('C10066','Bachelor of Engineering Science');
INSERT INTO ARdegree VALUES('C10067','Bachelor of Engineering');
INSERT INTO ARdegree VALUES('C10216','Bachelor of Arts in Communication (Information Management)');
INSERT INTO ARdegree VALUES('C10219','Bachelor of Business Bachelor of Science in IT');
INSERT INTO ARdegree VALUES('C50006','Study Abroad Undergraduate');


INSERT INTO ARsubject VALUES(21128,'International Business');
INSERT INTO ARsubject VALUES(21129,'Managing People and Organisations');
INSERT INTO ARsubject VALUES(21130,'Management and Organisations');
INSERT INTO ARsubject VALUES(21193,'Business Strategy');
INSERT INTO ARsubject VALUES(21226,'Sustainable Enterprises');
INSERT INTO ARsubject VALUES(21228,'Management Consulting');
INSERT INTO ARsubject VALUES(21229,'Management Knowledge');
INSERT INTO ARsubject VALUES(21231,'Managing the Value Stream');
INSERT INTO ARsubject VALUES(21591,'International Management');
INSERT INTO ARsubject VALUES(22105,'Accounting A');
INSERT INTO ARsubject VALUES(22107,'Accounting for Business');
INSERT INTO ARsubject VALUES(22207,'Accounting Transactions and Business Decisions');
INSERT INTO ARsubject VALUES(22309,'Accounting Overseas Transaction');
INSERT INTO ARsubject VALUES(22319,'Financial Statement Analysis');
INSERT INTO ARsubject VALUES(22320,'Accounting for Business Combinations');
INSERT INTO ARsubject VALUES(22321,'Cost Management Systems');
INSERT INTO ARsubject VALUES(22420,'Accounting Standards and Regulations');
INSERT INTO ARsubject VALUES(22421,'Management Decisions and Control');
INSERT INTO ARsubject VALUES(22515,'Computer-based Accounting');
INSERT INTO ARsubject VALUES(22520,'Corporate Reporting Profession');
INSERT INTO ARsubject VALUES(22522,'Assurance Services and Audit');
INSERT INTO ARsubject VALUES(22566,'Accounting Small Business 1');
INSERT INTO ARsubject VALUES(22610,'Accounting for Insolvency');
INSERT INTO ARsubject VALUES(24108,'Marketing Foundations');
INSERT INTO ARsubject VALUES(24202,'Consumer Behaviour');
INSERT INTO ARsubject VALUES(24205,'Business Marketing');
INSERT INTO ARsubject VALUES(24210,'Advertising Promotion Mamagement');
INSERT INTO ARsubject VALUES(24220,'International Marketing');
INSERT INTO ARsubject VALUES(24307,'e-Business Foundations');
INSERT INTO ARsubject VALUES(24309,'Introductory Marketing Research');
INSERT INTO ARsubject VALUES(24331,'Decision Models in Marketing');
INSERT INTO ARsubject VALUES(24408,'e-Marketing Strategy');
INSERT INTO ARsubject VALUES(24415,'Marketing Planning and Strategy');
INSERT INTO ARsubject VALUES(25115,'Economics for business');
INSERT INTO ARsubject VALUES(25300,'Fundamentals of Business Finance');
INSERT INTO ARsubject VALUES(25410,'Corporate Financial Analysis');
INSERT INTO ARsubject VALUES(25421,'International Financial Management');
INSERT INTO ARsubject VALUES(25503,'Investment Analysis');
INSERT INTO ARsubject VALUES(25555,'Macroeconomics: Theory and Applications');
INSERT INTO ARsubject VALUES(25556,'The Financial System');
INSERT INTO ARsubject VALUES(25557,'Corporate Finance Theory Practice');
INSERT INTO ARsubject VALUES(25620,'Derivative Securities');
INSERT INTO ARsubject VALUES(25622,'Quantitative Business Analysis');
INSERT INTO ARsubject VALUES(26133,'Business Information Analysis');
INSERT INTO ARsubject VALUES(26134,'Business Statistics');
INSERT INTO ARsubject VALUES(27184,'Tourism and the Industry 1');
INSERT INTO ARsubject VALUES(27185,'The Tourist Experience');
INSERT INTO ARsubject VALUES(27327,'Tourism and Sustainability');
INSERT INTO ARsubject VALUES(27703,'Events Management');
INSERT INTO ARsubject VALUES(31029,'Information Systems Dev');
INSERT INTO ARsubject VALUES(31034,'Advanced Communication IT');
INSERT INTO ARsubject VALUES(31059,'Computer Fundamentals');
INSERT INTO ARsubject VALUES(31060,'Information Systems Principles');
INSERT INTO ARsubject VALUES(31061,'Database Principles');
INSERT INTO ARsubject VALUES(31084,'VaW and WaV');
INSERT INTO ARsubject VALUES(31090,'Mobile Programming');
INSERT INTO ARsubject VALUES(31092,'Information Systems Development');
INSERT INTO ARsubject VALUES(31097,'IT Operations Management');
INSERT INTO ARsubject VALUES(31266,'Introduction to Information Systems');
INSERT INTO ARsubject VALUES(31267,'Programming Fundamentals');
INSERT INTO ARsubject VALUES(31268,'Web Systems');
INSERT INTO ARsubject VALUES(31270,'Networking Essentials');
INSERT INTO ARsubject VALUES(31271,'Database Fundamentals');
INSERT INTO ARsubject VALUES(31424,'Systems Modelling');
INSERT INTO ARsubject VALUES(31472,'Introduction to Collaborative Systems');
INSERT INTO ARsubject VALUES(31473,'Data Structures & Procedural Programming');
INSERT INTO ARsubject VALUES(31476,'Systems Development Project');
INSERT INTO ARsubject VALUES(31748,'Programming on the Internet');
INSERT INTO ARsubject VALUES(31479,'IT Professional Society');
INSERT INTO ARsubject VALUES(31480,'Strategic IT Planning Project');
INSERT INTO ARsubject VALUES(31488, 'Programming Foundations');
INSERT INTO ARsubject VALUES(31508,'Programming Fundamentals');
INSERT INTO ARsubject VALUES(31509,'Computer Fundamentals');
INSERT INTO ARsubject VALUES(31516,'Networking Fundamentals');
INSERT INTO ARsubject VALUES(31735,'Information Systems and Organisation Development');
INSERT INTO ARsubject VALUES(31736,'Business Processes and IT Strategy');
INSERT INTO ARsubject VALUES(31749,'Internet Commerce');
INSERT INTO ARsubject VALUES(31927,'Application Develop Visual');
INSERT INTO ARsubject VALUES(31950,'Networked Enterprise Design');
INSERT INTO ARsubject VALUES(32012,'Internet Quality of Service');
INSERT INTO ARsubject VALUES(32118,'Mobile Communications Comp ');
INSERT INTO ARsubject VALUES(32144,'IT Research Preparation');
INSERT INTO ARsubject VALUES(32209,'Advanced Topics in Computer Networks');
INSERT INTO ARsubject VALUES(32509,'Interaction Design');
INSERT INTO ARsubject VALUES(32516,'Internet Programming');
INSERT INTO ARsubject VALUES(32520,'UNIX Systems Administration');
INSERT INTO ARsubject VALUES(32521,'WANS and VLANS');
INSERT INTO ARsubject VALUES(32523,'Operating Systems Network Security');
INSERT INTO ARsubject VALUES(32524,'LANS and Routing');
INSERT INTO ARsubject VALUES(32547,'UNIX Systems Programming');
INSERT INTO ARsubject VALUES(32606,'Database');
INSERT INTO ARsubject VALUES(32702,'Contemporary Telecommunication');
INSERT INTO ARsubject VALUES(33130,'Mathematical Modelling 1');
INSERT INTO ARsubject VALUES(33230,'Mathematical Modelling 2');
INSERT INTO ARsubject VALUES(35102,'Mathematics 2');
INSERT INTO ARsubject VALUES(35212,'Linear Algebra');
INSERT INTO ARsubject VALUES(48001,'Project BEngSc');
INSERT INTO ARsubject VALUES(48012,'Capstone Project');
INSERT INTO ARsubject VALUES(48016,'Capstone Project Part A');
INSERT INTO ARsubject VALUES(48023,'Object Oriented Programming (Eng)');
INSERT INTO ARsubject VALUES(48024,'Object Oriented Design (Eng)');
INSERT INTO ARsubject VALUES(48026,'Capstone Project Part B');
INSERT INTO ARsubject VALUES(48027,'Language Contexts Australian');
INSERT INTO ARsubject VALUES(48110,'Engineering Experience 1');
INSERT INTO ARsubject VALUES(48111,'Engineering Experience 1 - 1st Internship');
INSERT INTO ARsubject VALUES(48121,'Engineering Practice Preview 1');
INSERT INTO ARsubject VALUES(48122,'Engineering Practice Review 1');
INSERT INTO ARsubject VALUES(48130,'Engineering Experience 2');
INSERT INTO ARsubject VALUES(48141,'Engineering Practice Preview 2');
INSERT INTO ARsubject VALUES(48142,'Engineering Practice Review 2');
INSERT INTO ARsubject VALUES(48210,'Engineering for Sustainability');
INSERT INTO ARsubject VALUES(48221,'Informatics: Visual Basic');
INSERT INTO ARsubject VALUES(48222,'Informatics C');
INSERT INTO ARsubject VALUES(48230,'Engineering Communication');
INSERT INTO ARsubject VALUES(48240,'Uncertainties & Risks in Engineering');
INSERT INTO ARsubject VALUES(48250,'Engineering Economics & Finance');
INSERT INTO ARsubject VALUES(48260,'Engineering Project Management');
INSERT INTO ARsubject VALUES(48270,'Engineering Enterprise / Technology Assessment');
INSERT INTO ARsubject VALUES(48430,'Embedded C');
INSERT INTO ARsubject VALUES(48440,'Software Engineering');
INSERT INTO ARsubject VALUES(48441,'Introduction to Digital Systems');
INSERT INTO ARsubject VALUES(48450,'Real-time Operating Systems');
INSERT INTO ARsubject VALUES(48451,'Advanced Digital Systems');
INSERT INTO ARsubject VALUES(48470,'Computer Systems Analysis');
INSERT INTO ARsubject VALUES(48480,'Computer Systems Design');
INSERT INTO ARsubject VALUES(48510,'Introduction to Electrical Engineering');
INSERT INTO ARsubject VALUES(48520,'Electronics and Circuits');
INSERT INTO ARsubject VALUES(48530,'Circuit Analysis');
INSERT INTO ARsubject VALUES(48531,'Electromechanical Systems');
INSERT INTO ARsubject VALUES(48540,'Signals and Systems');
INSERT INTO ARsubject VALUES(48541,'Signal Theory');
INSERT INTO ARsubject VALUES(48550,'Electrical Energy Technology');
INSERT INTO ARsubject VALUES(48551,'Advanced Electronics');
INSERT INTO ARsubject VALUES(48560,'Analogue and Digital Control');
INSERT INTO ARsubject VALUES(48561,'Power Electronics');
INSERT INTO ARsubject VALUES(48570,'Data Acquisition and Distribution');
INSERT INTO ARsubject VALUES(48610,'Introduction to Mechanical and Mechatronic Engineering');
INSERT INTO ARsubject VALUES(48720,'Introduction to Telecommunications Engineering');
INSERT INTO ARsubject VALUES(48721,'Strategic Electronic Business Technology');
INSERT INTO ARsubject VALUES(48730,'Authentication and System Security');
INSERT INTO ARsubject VALUES(48740,'Communications Networks');
INSERT INTO ARsubject VALUES(48750,'Network Planning and Management');
INSERT INTO ARsubject VALUES(48770,'Signal Processing');
INSERT INTO ARsubject VALUES(48771,'Communication Theory');
INSERT INTO ARsubject VALUES(48785,'Telecommunications Channels');
INSERT INTO ARsubject VALUES(49016,'Technology and Innovation Management');
INSERT INTO ARsubject VALUES(49048,'Wireless Networking Technologies');
INSERT INTO ARsubject VALUES(49275,'Neural Networks & Fuzzy Logic');
INSERT INTO ARsubject VALUES(50105,'Communication and Information Environments');
INSERT INTO ARsubject VALUES(50106,'Media, Information and Society');
INSERT INTO ARsubject VALUES(50107,'Contemporary Cultures 1');
INSERT INTO ARsubject VALUES(50108,'Contemporary Cultures 2');
INSERT INTO ARsubject VALUES(50109,'Power and Change in Australia');
INSERT INTO ARsubject VALUES(50111,'Colonialism and Modernity');
INSERT INTO ARsubject VALUES(50112,'Information in Society');
INSERT INTO ARsubject VALUES(50159,'Management Consulting');
INSERT INTO ARsubject VALUES(50172,'Information, Society and Policy');
INSERT INTO ARsubject VALUES(50190,'Professional Information Project');
INSERT INTO ARsubject VALUES(50481,'People and Information');
INSERT INTO ARsubject VALUES(50482,'Social Informatics');
INSERT INTO ARsubject VALUES(50487,'Exploring Information Resources');
INSERT INTO ARsubject VALUES(50490,'Information Design for Communicating');
INSERT INTO ARsubject VALUES(50491,'Organising Information for Access');
INSERT INTO ARsubject VALUES(50493,'Managing Information');
INSERT INTO ARsubject VALUES(60101,'Chemistry & Materials Science');
INSERT INTO ARsubject VALUES(68037,'Physical Modelling');
INSERT INTO ARsubject VALUES(68038,'Advanced Mathematics and Physics');
INSERT INTO ARsubject VALUES(68039,'Physical Modelling (2 Sem)');
INSERT INTO ARsubject VALUES(68314,'Electronics');
INSERT INTO ARsubject VALUES(73203,'Business Law and Ethics');
INSERT INTO ARsubject VALUES(79006,'Intellectual Property Commerce');
INSERT INTO ARsubject VALUES(79014,'Applied Company Law');
INSERT INTO ARsubject VALUES(79017,'Taxation Law');
INSERT INTO ARsubject VALUES(79203,'Business Law And Ethics');
INSERT INTO ARsubject VALUES(79371,'Legal Issues in Communications');
INSERT INTO ARsubject VALUES(89200,'Graphic Visualisation');
INSERT INTO ARsubject VALUES(89204,'2D Digital Animation');
INSERT INTO ARsubject VALUES(95563,'Digital Media Development Process');
INSERT INTO ARsubject VALUES(95564,'Digital Media Technologies');
INSERT INTO ARsubject VALUES(95565,'Digital Graphice Still Image');
INSERT INTO ARsubject VALUES(95566,'Digital Information Interaction Design');
INSERT INTO ARsubject VALUES(95567,'Digital Media Social Context');
INSERT INTO ARsubject VALUES(95568,'Digital Sound & Moving Image');
INSERT INTO ARsubject VALUES(97017,'Taxation Law');
INSERT INTO ARsubject VALUES(97101,'Chinese Language Culture 1');
INSERT INTO ARsubject VALUES(97201,'Japanese Language Culture 1');
INSERT INTO ARsubject VALUES(97202,'Japanese Language Culture 2');
