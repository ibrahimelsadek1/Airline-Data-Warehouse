create table client_flight_facts
(

   issue_ticket_id   number(50)        CONSTRAINT PK_ticket_ID PRIMARY KEY,
   date_key                            DATE,
   client_mapped_key                   number(5),
   flight_key                          number(5),
   class_key                           number(5),
   payment_method_key                  number(5),
   fare_base_key                       number(5),
   time_key                            numner(5),
   booking_channel_key                 number(2),
   --------------------------------
   fare_price                          number(5),
   additional_luggage_fees             number(5), 
   upgrade_fees                        number(5),
   redeemed_miles                      number(5),
   redeemed_dollars                    number(5),
   miles_earned                        number(5),
   qualification_dollars_earned        number(5),
   total_discount_on_price             number(5)
) 
alter table client_flight_facts 
add
(
 constraint FK_date_finance_schema        foreign key  (date_key)              references  date_dim(date_key)                        on delete cascade ,
 constraint FK_mapped_finance_schema      foreign key  (client_mapped_key)     references  client_mapped_dim(client_mapped_id)       on delete cascade ,
 constraint FK_flight_finance_schema      foreign key  (flight_key)            references  Flight_dim(flight_id)                     on delete cascade ,
 constraint FK_class _finance_schema      foreign key  (class_key)             references  class_dim(class_id)                       on delete cascade ,
 constraint FK_paymet_finance_schema      foreign key  (payment_method_key)    references  payment_method_dim(method_key)            on delete cascade ,
 constraint FK_fare_finance_schema        foreign key  (fare_base_key)         references  fare_base_dim(fare_base_id)               on delete cascade ,
 constraint FK_time_finance_schema        foreign key  (time_key)              references  time_dim(time_key)                        on delete cascade ,
 constraint FK_booking_finance_schema     foreign key  (booking_channel_key)   references  Booking_channel_dim(booking_id)           on delete cascade ,
)

















create table airport_dim
(
	airport_id          number(5)   CONSTRAINT PK_airportID PRIMARY KEY,
	airport_name        varchar2(30),
	airport_country     varchar2(30),
	airport_city	    varchar2(30),
	airport_timezone    number(5)
	
)


CREATE TABLE flight_dim
	(
 	
	flight_id                        number(5)  CONSTRAINT PK_flight_ID PRIMARY KEY,
  	departure_airport_key            number(5),
  	arrival_airport_key              umber(5),
  	departure_time                   number(5),
  	arrival_time                     number(5),
  	actual_dep_time                  number(5),
  	actual_arr_time                  number(5)

)
                

create table fare_base_dim
(
	fare_base_id                 number(5)   CONSTRAINT PK_Farebase_ID PRIMARY KEY,
	type                         varchar2(30),
	base_mile                    number(5),
	class_bouns                  number(5),
	total_mile_earned_perc       number(5),
	qualification_dollars_perc   number(5)
	
)



create table Booking_channel_dim
(
    booking_channel_key     number(4)      CONSTRAINT PK_booking_ID PRIMARY KEY,
    description             varchar2(50)

)


create table payment_method_dim
(		
	method_id  number(4) CONSTRAINT PK_PayMethod_ID PRIMARY KEY,
    	type       varchar2(100)
)


 create table client_dim
 (
    client_id                number(5) CONSTRAINT PK_client_id PRIMARY KEY,
    passport_id              varchar2(100),
    F_name                   varchar2(8),
    gender                   varchar(8),
    age                      number(2),
    nationality              varchar2(30),
    contact_number           varchar2(20),
    constraint uk_pssport  unique (passport_id) 
)



create table class_dim
(
    class_id         number(4) CONSTRAINT PK_class _ID PRIMARY KEY,
    type             varchar2(50) ,
    description      varchar2(200)
)
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------


---------------------
creating sequences
---------------------
create sequence FLIGHT_KEY_seq
		increment by 7 
		start with 1000
		maxvalue   2000
		nocycle;


create sequence booking_method_seq
		increment by 2 
		start with 11
		maxvalue   15
		nocycle;



create sequence passenger_key_seq
		increment by 3 
		start with 5000
		maxvalue   6000
		nocycle;
 

create sequence Booking_key_seq
		increment by 1 
		start with 1
		maxvalue   5
		nocycle;


create sequence class_key_seq
		increment by 1 
		start with 1
		maxvalue   3
		nocycle;



