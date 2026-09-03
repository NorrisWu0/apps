drop table menu;
drop table items;
drop table recipe;


create table menu
	(	pizza	varchar(20),
		price	real, 	
		country	varchar(20),		
		base	varchar(20),			
		PRIMARY KEY (pizza)		
);

insert into menu values ('margarita',6.20,'italy','Wf');
insert into menu (pizza,price,base) values ('ham',7.30,'Wf');
insert into menu values ('napolitana',7.40,'italy','Wf');
insert into menu values ('stagiony',7.80,'italy','Wm');
insert into menu values ('hawaiian',7.40,'hawaii','Wm');
insert into menu values ('cabanossi',7.40,'italy','Wf');
insert into menu (pizza,price,base) values ('special',9.90,'Wf');
insert into menu values ('siciliano',7.40,'italy','Wm');
insert into menu values ('americano',7.40,'usa','Wm');
insert into menu values ('mexicano',7.40,'mexico','Wf');
insert into menu (pizza, price,base) values ('vegetarian',7.40,'Wm');
insert into menu (pizza,price,base) values ('mushroom',7.30,'Wm');
insert into menu (pizza,price,base) values ('seafood',9.20,'Wm');
insert into menu (pizza,price,base) values ('garlic',3.50,'Wm');

create table items
(	ingredient varchar(12),
	type varchar(8),
	PRIMARY KEY (ingredient)
);

insert into items values ('cheese','dairy');
insert into items values ('tomato','veg');
insert into items values ('ham','meat');
insert into items values ('anchovies','fish');
insert into items values ('olives','veg');
insert into items values ('mushroom','veg');
insert into items values ('prawn','fish');
insert into items values ('garlic','spice');
insert into items values ('bacon','meat');
insert into items values ('egg','dairy');
insert into items values ('pineapple','fruit');
insert into items values ('cabanossi','meat');
insert into items values ('salami','meat');
insert into items values ('pepperoni','meat');
insert into items values ('capsicum','veg');
insert into items values ('onion','veg');
insert into items values ('chilli','spice');
insert into items values ('peas','veg');
insert into items values ('seafood','fish');
insert into items values ('spice','spice');

create table recipe
(	pizza varchar(20),
	ingredient varchar(12),
	amount integer,
	PRIMARY KEY (pizza,ingredient),
	FOREIGN KEY (pizza) REFERENCES menu,
	FOREIGN KEY (ingredient) REFERENCES items
);

insert into recipe values ('margarita','cheese',120);
insert into recipe values ('margarita','spice',5);
insert into recipe values ('ham','ham',150);
insert into recipe values ('ham','spice',5);
insert into recipe values ('napolitana','anchovies',100);
insert into recipe values ('napolitana','olives',75);
insert into recipe values ('napolitana','spice',10);
insert into recipe values ('hawaiian','ham',100);
insert into recipe values ('hawaiian','pineapple',100);
insert into recipe values ('hawaiian','spice',5);
insert into recipe values ('cabanossi','cabanossi',150);
insert into recipe values ('cabanossi','spice',10);
insert into recipe values ('siciliano','onion',50);
insert into recipe values ('siciliano','capsicum',75);
insert into recipe values ('siciliano','olives',50);
insert into recipe values ('siciliano','anchovies',50);
insert into recipe values ('siciliano','spice',15);
insert into recipe values ('americano','salami',120);
insert into recipe values ('americano','pepperoni',75);
insert into recipe values ('americano','spice',10);
insert into recipe values ('mexicano','onion',75);
insert into recipe values ('mexicano','capsicum',75);
insert into recipe values ('mexicano','mushroom',50);
insert into recipe values ('mexicano','chilli',25);
insert into recipe values ('mexicano','spice',20);
insert into recipe values ('seafood','seafood',200);
insert into recipe values ('seafood','spice',5);
insert into recipe values ('garlic','garlic',25);
insert into recipe values ('garlic','spice',10);
insert into recipe values ('vegetarian','onion',50);
insert into recipe values ('vegetarian','capsicum',50);
insert into recipe values ('vegetarian','mushroom',50);
insert into recipe values ('vegetarian','peas',50);
insert into recipe values ('vegetarian','tomato',50);
insert into recipe values ('vegetarian','spice',5);
insert into recipe values ('mushroom','mushroom',100);
insert into recipe values ('mushroom','spice',5);
insert into recipe values ('special','cheese',25);
insert into recipe values ('special','tomato',25);
insert into recipe values ('special','ham',25);
insert into recipe values ('special','anchovies',25);
insert into recipe values ('special','olives',25);
insert into recipe values ('special','mushroom',25);
insert into recipe values ('special','bacon',25);
insert into recipe values ('special','egg',25);
insert into recipe values ('special','pineapple',25);
insert into recipe values ('special','cabanossi',25);
insert into recipe values ('special','salami',25);
insert into recipe values ('special','capsicum',25);
insert into recipe values ('special','onion',25);
insert into recipe values ('special','peas',25);
insert into recipe values ('special','seafood',25);
insert into recipe values ('special','spice',10);
insert into recipe values ('stagiony','ham',75);
insert into recipe values ('stagiony','mushroom',50);
insert into recipe values ('stagiony','olives',50);
insert into recipe values ('stagiony','anchovies',25);
insert into recipe values ('stagiony','spice',10);
