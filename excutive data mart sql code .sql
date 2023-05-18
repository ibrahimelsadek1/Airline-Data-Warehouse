
  
--drop table Date_Dim ;
create table Date_Dim (
date_key number(10) primary key ,
Date_d date   ,
year_y date ,
month_m date ,
day_d date 
);
  
--drop table time_dim ;
create table time_dim (
time_key number(10) primary key ,
timestamp_t  timestamp --'YYYY-MM-DD HH24:MI:SS.FF' ,
--hour_h timezone_hour ,
--minutes timezone_minute,
); 
--drop table AirPort_Dim;
create table 
AirPort_Dim (
airport_key   number(10) unique  ,
airport_name varchar2(100) ,
 country varchar2(30) , 
 city  varchar2(30) , 
 num_of_gates number(5) ,
 timezone number(10) );
  
--drop table Plane;  
  create table Plane (
  plane_key  number(10) primary key,
 engine_num  varchar2(30) unique ,
 plane_model varchar2(30) 
 );
 
 --Drop table cancellation_reasons ;
 create table cancellation_reasons( 
 reason_Key number(10) primary key ,
 reason_category varchar2(30),
 reason_description varchar2(200));
 
 /*--Drop table Pilot ;
 create table Pilot( Pilot_key  number(10) primary key ,
NID number(20) unique,
Pilot_name varchar2(50),
gender varchar2(25) ,
age number(2),
email varchar2(50),
licence  varchar2(50),
contact_num number(20));*/

--Drop table Cancelled_flights_fact ;
create table Cancelled_flights_fact(
 Flight_key  number(10) primary key ,
plane_key number(10) , 
--Pilot_Key number(10), 
cancellation_reasons_key number(10) ,
departure_airport_key number(10) ,
 arrival_airport_key number(10),
date_key  number(10),
total_reserved_seats number (5) ,
constraint plane_fk FOREIGN KEY(plane_key) references Plane(plane_key) on delete cascade  , 
--constraint pilot_fk FOREIGN KEY(Pilot_Key) references Pilot (Pilot_key),
constraint reason_fk FOREIGN KEY(cancellation_reasons_key) references cancellation_reasons (reason_Key) on delete cascade ,
constraint dep_airport_fk FOREIGN KEY(departure_airport_key) references AirPort_Dim (airport_key) on delete cascade  ,
constraint destination_airport_fk FOREIGN KEY(arrival_airport_key) references AirPort_Dim (airport_key) on delete cascade ,
constraint date_fk FOREIGN KEY (date_key) references Date_Dim(date_key)  on delete cascade 
) ; 

--Drop table flights_fact ;
 create table flights_fact(
 Flight_key  number(10) primary key ,
plane_key number(10)  , 
--Pilot_Key number(10) ,
departureairport_key number(10) ,
arrival_airport_key number(10),

departure_time_key number(10),
arrival_time_key number(10),
actual_dept_time_key number(10),
actual_arr_time_key number(10),

departure_date_key number(10),
arrival_date_key number(10),
actual_dept_date_key number(10),
actual_arr_date_key number(10),

Plane_capacity number(4),
total_reserved_seats number(4),
onboard_passengers_count number(4),
total_revenue number (25),
status varchar2(10) ,
flight_duration number(4),
delay_duration number(4),

constraint planeID_fk FOREIGN KEY(plane_key) references Plane (plane_key) ,
--constraint pilot_fk FOREIGN KEY(Pilot_key) references Pilot (Pilot_key)  ,
constraint depature_airport_fk FOREIGN KEY(departureairport_key) references AirPort_Dim (airport_key) ,
constraint arr_airport_fk FOREIGN KEY(arrival_airport_key) references AirPort_Dim (airport_key) ,

constraint departure_time_fk FOREIGN KEY(departure_time_key) references time_dim (time_key) ,
constraint arrival_time_fk FOREIGN KEY(arrival_time_key) references time_dim (time_key) ,
constraint actual_dept_time_fk FOREIGN KEY(actual_dept_time_key) references time_dim (time_key) ,
constraint actual_arr_time_fk FOREIGN KEY(actual_arr_time_key) references time_dim (time_key) ,

constraint departure_date_fk FOREIGN KEY(departure_date_key) references Date_Dim (date_key) ,
constraint arrival_date_fk FOREIGN KEY(arrival_date_key) references Date_Dim (date_key) ,
constraint actual_dept_date_fk FOREIGN KEY(actual_dept_date_key) references Date_Dim (date_key) ,
constraint actual_arr_date_fk FOREIGN KEY(actual_arr_date_key) references Date_Dim (date_key) 
 );


                                               --------Sequences--------


-----cancellation_sequence-----
--drop sequence   reason_seq ;                                                      
 create sequence reason_seq 
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE ; 

-----Plane_sequence-----
--drop sequence   reason_seq ;                                                      
 create sequence planeID_seq 
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE ; 

------------airport_sequence------------
--drop sequence     airport_id_seq ;                                                      
 create sequence airport_id_seq 
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE ; 


-------------- index_airport_dim    ------------------                                                                

 create index country_index 
 on AirPort_Dim(country);
 
 create index city_index 
 on AirPort_Dim(city);

