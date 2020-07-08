CREATE schema latino_royal;
USE latino_royal;


create table ship
(
	s_ID int NOT NULL PRIMARY KEY, 
	s_name varchar(100), 
	s_type varchar(100),
    s_size float,
	max_Guests int,
    max_staff int,
    s_value float,
    num_restaurant int
    )
    engine=innodb;
    

create table luxury_ship
(
	s_ID int NOT NULL PRIMARY KEY, 
	num_casino int,
    num_mishellen_rest int,
    num_spa_rooms int,
    constraint fk_s_Id
    FOREIGN KEY (s_Id) REFERENCES ship(s_ID)
    )
    engine=innodb;
    
    
    
    create table staff
(
	staff_ID int NOT NULL PRIMARY KEY, 
    s_id int not null,
	staff_firstname varchar(100), 
	staff_lastname varchar(100),
    staff_role varchar(100),
	staff_salery float,
    constraint fk_s1_Id
    FOREIGN KEY (s_Id) REFERENCES ship(s_ID)
    )
    engine=innodb;
    
    
       create table harbor
(
	h_ID varchar(9) NOT NULL PRIMARY KEY, 
    h_name varchar(100),
    h_city varchar(100),
    h_country varchar(100),
	dock_size float, 
	num_docks int

    )
    engine=innodb;
    
    
        create table attraction
(
	at_ID int NOT NULL PRIMARY KEY, 
    h_ID varchar(9) not null,
	at_name varchar(100), 
	max_group_size int,
    tripadvisor_rank float,
    constraint fk_h_ID
    FOREIGN KEY (h_ID) REFERENCES harbor(h_ID)
    )
    engine=innodb;
    
    
        create table cruise
(
	c_ID int NOT NULL PRIMARY KEY, 
    c_duration int 
    )
    engine=innodb;
    
    
    
          create table route
(
	h_ID varchar(9) not null,
    c_ID int NOT NULL,
    num_of_days int,
    primary key(h_ID,c_ID),
    constraint fk_h1_ID 
    FOREIGN KEY (h_ID)  REFERENCES harbor(h_ID),
	constraint fk_c1_ID
	FOREIGN KEY (c_ID) REFERENCES  cruise(c_ID)
    )
    engine=innodb;
    
             create table actual_cruise
(
	
	ac_id int not null ,
    c_id int not null , 
    s_id int,
    foreign key (s_id) references ship(s_ID),
    foreign key (c_id) references cruise(c_ID),
	primary key(ac_id,c_id)
    )
    engine=innodb;
    
       create table actual_route
(
	ac_id int not null ,
    h_ID varchar(9) not null,
    arraival_date date not null,
    departure_date date not null,
    primary key(ac_ID,h_ID,arraival_date,departure_date),
    constraint fk_h11_ID 
    FOREIGN KEY (h_ID)  REFERENCES harbor(h_ID),
	constraint fk_c11_ID
	FOREIGN KEY (ac_ID) REFERENCES  actual_cruise(ac_ID)
    )
    engine=innodb;
    
      create table staff_in_att
(
	staff_ID int NOT NULL,
    at_ID int NOT NULL,
    at_date date,
    isMainGuide bit not null, 
    primary key(staff_ID,at_ID,at_date),
    constraint fk_staff_ID 
    FOREIGN KEY (staff_ID)  REFERENCES staff(staff_ID),
	constraint fk_at_ID
	FOREIGN KEY (at_ID) REFERENCES  attraction(at_ID)
    )
    engine=innodb;
    
    
    /* ---SHIP---*/
    insert into ship values(111,'PRINCESS','AZIMUT',250.5,2000,30,300000000.0,15) ;
	insert into ship values(222,'PERRECILLA','AZIMUT',122.3,1300,25,20000000.0,7) ;
    insert into ship values(333,'BONITA DE MAS','KATAMARAN',56.9,30,12,250000000.0,9) ;
    insert into ship values(444,'LIORI','AZIMUT',105.3,1700,22,155000000.0,13) ;
    insert into ship values(555,'NAAMUL','TORPEDO',170.3,1450,21,235100000.0,15) ;
    insert into ship values(666,'BARBUR','DOLPHIN3',114.3,1150,17,1230000000.0,6) ;
    insert into ship values(777,'HERMOSA','COLMBUS',100.5,970,15,93000000.0,4) ;
    
    /*---LUXURY BOAT*/
    insert into luxury_ship values(333,2,3,7);
    insert into luxury_ship values(777,1,2,5);
    
    
    /*	---STAFF--*/
    insert into staff values(11,111,"SHAGI","YOMT","CAPITAN",21.3);
    insert into staff values(12,111,"THE","SHADOW","POOL-MAN",12.2);
    insert into staff values(13,111,"AVRAHAM","TAKO","WAITER",17.3);
    
    insert into staff values(14,222,"SHALOM","TIKVA","CAPITAN",25.4);
    insert into staff values(17,222,"SHIMRIT","ABUKSIS","GIO",13.3);
    insert into staff values(16,222,"YOCHAI","BEN-LULU","CHEF",12.9);
    
    insert into staff values(15,333,"JACK","SPARO","CAPITAN",95.3);
    insert into staff values(18,333,"AVI","RON","POOL-MAN",11.6);
    insert into staff values(19,333,"IZABITO","OGABUNA","GIO",17.3);
    
    insert into staff values(20,444,"JAMES","RODRIGUEZ","CAPITAN",200.3);
    insert into staff values(21,444,"ROBERTO","CARLOS","WAITER",16.6);
    insert into staff values(22,444,"AHAM","STAF","CHEF",17.5);
    
    insert into staff values(23,555,"RONALD","MCDONALD","CAPITAN",115.6);
    insert into staff values(24,555,"JOHN","RUDOLPH","MECHANIC",20.3);
    insert into staff values(25,555,"LUCAS","SASHA","NEVIGATOR",3.5);
    
    insert into staff values(26,666,"ROEE","ARNON","CAPITAN",93.5);
    insert into staff values(28,666,"EYAL","GOLAN","GIO",25.3);
	insert into staff values(29,666,"ADAM","BRONSON","MECHANIC",14.3);    
    insert into staff values(31,777,"DINA","SALAME","CAPITAN",215.3);
    insert into staff values(27,777,"ROTEM","LOTEM","POOL-MAN",19.6);
    insert into staff values(30,777,"RONA","SASSON","SPA",26.0);
  
  
	/* ----HARBORS-----*/
	
	Insert into harbor values('ush','del-mondo', 'ushuaia','Argentina',252,5);
	Insert into harbor values('ba','lo mejor','Buenos-Aires','Argentina',300,7);
	Insert into harbor values('rio','Obrigdo','Rio','Brazil',270,9);
	Insert into harbor values('slb','Pele','Salvador','Brazil',254,3);
	
	Insert into harbor values('gen','cumbia','Cartagena','Colombia',320,10);
	Insert into harbor values('pan','sanBlas','panma-city','Panama',350,13);
	Insert into harbor values('can','MayaPort','Cancun','Mexico',285,10);
	Insert into harbor values('jam','Bob','kingStone','Jamica',251,3);
	Insert into harbor values('gal','SantaPort','Galpagos','Ecuador',270,4);
	Insert into harbor values('hav','Che','Havanna','Cuba',280,4);

	
/*--ATTRACTIONS*/
	insert into attraction values(18,'ush',"SNOW TOUR",13,3.7);
    insert into attraction values(19,'ush',"SHIP TREK",18,4);
    
    
	insert into attraction values(20,'ba',"BAR'S TOUR",20,2.6);
	insert into attraction values(21,'ba',"ALFAJORES TOUR",14,5);
	insert into attraction values(22,'ba',"LA-BOCA TOUR",20,4.6);
    
	insert into attraction values(6,'rio',"SURF IN COPACABANA",7,4.3);
	insert into attraction values(7,'rio',"CAPUERA",22,3.3);
    
    insert into attraction values(8,'slb',"FOOTVOLLEY",4,2.0);
    insert into attraction values(9,'slb',"CARNAVAL",30,5.0);

	insert into attraction values(10,'gen',"PLAYA BLANCA",4,4.9);
    insert into attraction values(11,'gen',"ESCOBAR TOUR",7,4.7);

	insert into attraction values(12,'pan',"SAN BLAS ISLANDS",20,5);
    
    insert into attraction values(13,'can',"DAY IN THE BEACH",30,3.0);
	insert into attraction values(14,'can',"CHCHAN ITZA",15,2.4);
    
    insert into attraction values(15,'jam',"REGGAE DISCO",20,4.2);    
    insert into attraction values(16,'gal',"DIVING",8,4.7);    
	insert into attraction values(17,'hav',"CHE GUAVARRA MUSEUM",15,3.8);

	/* staff_in_att*/
    insert into staff_in_att values(11,18,20200620,0);
    insert into staff_in_att values(12,18,20200620,1);
    insert into staff_in_att values(13,18,20200620,0);
    
    insert into staff_in_att values(14,20,20200510,1);
    insert into staff_in_att values(17,20,20200620,0);
    
    insert into staff_in_att values(19,12,20200125,1);
    insert into staff_in_att values(11,12,20200620,0);
    
    insert into staff_in_att values(28,15,20200701,1);
    insert into staff_in_att values(21,15,20200701,0);
    
    insert into staff_in_att values(20,8,20210820,1);
    insert into staff_in_att values(21,8,20210820,0);
    insert into staff_in_att values(22,8,20210820,0);
    insert into staff_in_att values(14,8,20210820,0);
    
   /*--CRUISE--*/
	Insert into cruise values(1000,8);
	Insert into cruise values(2000,9);
	Insert into cruise values(3000,18);
	Insert into cruise values(4000,12);
	Insert into cruise values(5000,14);
	Insert into cruise values(6000,15);
    
    
    /*--ROUTE--*/
    Insert into route values('can',1000,2);
	Insert into route values('gen',1000,3);
	Insert into route values('pan',1000,3);

	Insert into route values('can',2000,2);
	Insert into route values('jam',2000,3);
	Insert into route values('hav',2000,4);

	Insert into route values('pan',3000,2);
	Insert into route values('slb',3000,4);
	Insert into route values('rio',3000,6);
	Insert into route values('ba',3000,4);
	Insert into route values('ush',3000,2);

	Insert into route values('pan',4000,2);
	Insert into route values('gen',4000,6);
	Insert into route values('gal',4000,4);

	Insert into route values('jam',5000,4);
	Insert into route values('hav',5000,4);
	Insert into route values('rio',5000,4);
	Insert into route values('ba',5000,2);
	Insert into route values('gen',6000,2);
	Insert into route values('gal',6000,6);
	Insert into route values('ush',6000,7);



### actual cruise
	Insert into actual_cruise values(1,1000,222);
	Insert into actual_cruise values(2,4000,444);
	Insert into actual_cruise values(3,2000,777);
	Insert into actual_cruise values(4,3000,555);
	Insert into actual_cruise values(5,4000,666);
	Insert into actual_cruise values(6,3000,111);
	Insert into actual_cruise values(7,1000,333);
	Insert into actual_cruise values(8,2000,444);
	Insert into actual_cruise values(9,5000,555);
	Insert into actual_cruise values(10,6000,666);
	
   




	###Actual_route
	Insert into actual_route values(1,'can',20200102,20200104);
	Insert into actual_route values(1,'gen',20200104,20200107);
	Insert into actual_route values(1,'pan',20200107,20200110);

	Insert into actual_route values(2,'pan',20200122,20200124);
	Insert into actual_route values(2,'gen',20200124,20200130);
	Insert into actual_route values(2,'gal',20200130,20200201);

	Insert into actual_route values(3,'can',20200210,20200214);
        Insert into actual_route values(3,'jam',20200214,20200214);
	Insert into actual_route values(3,'hav',20200214,20200219);

	Insert into actual_route values(4,'pan',20200301,20200303);
	Insert into actual_route values(4,'slb',20200303,20200307);
	Insert into actual_route values(4,'rio',20200307,20200313);
	Insert into actual_route values(4,'ba',20200313,20200317);
	Insert into actual_route values(4,'ush',20200317,20200319);

	Insert into actual_route values(5,'pan',20200401,20200403);
	Insert into actual_route values(5,'gen',20200403,20200409);
	Insert into actual_route values(5,'gal',20200409,20200411);

	Insert into actual_route values(6,'pan',20200501,20200503);
	Insert into actual_route values(6,'slb',20200503,20200507);
	Insert into actual_route values(6,'rio',20200507,20200513);
	Insert into actual_route values(6,'ba',20200513,20200517);
	Insert into actual_route values(6,'ush',20200517,20200519);

	Insert into actual_route values(7,'can',20200602,20200604);
	Insert into actual_route values(7,'gen',20200604,20200607);
	Insert into actual_route values(7,'pan',20200607,20200610);

	Insert into actual_route values(8,'can',20200610,20200612);
	Insert into actual_route values(8,'jam',20200612,20200615);
	Insert into actual_route values(8,'hav',20200615,20200619);

	Insert into actual_route values(9,'jam',20200701,20200705);
	Insert into actual_route values(9,'hav',20200705,20200709);
	Insert into actual_route values(9,'rio',20200709,20200713);
	Insert into actual_route values(9,'ba',20200713,20200715);
	 
	Insert into actual_route values(10,'gen',20200801,20200803);
	Insert into actual_route values(10,'gal',20200803,20200809);
	Insert into actual_route values(10,'ush',20200809,20200816);





		
	  
		