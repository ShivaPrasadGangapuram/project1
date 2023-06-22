
--------- Creating stg tables for both api data ---------------
create table staging.stg_earthquake
  ( 
    feature_type varchar(10),
    id varchar(20),
    mag varchar(5),
    place varchar(50),
    occur_time varchar(20),
    updated varchar(20),
    tz varchar(10),
    url varchar(100),
    detail varchar(200),
    felt varchar(10),
    cdi varchar(10),
    mmi varchar(10),
    alert varchar(10),
    status varchar(20),
    tsunami varchar(5),
    sig varchar(10),
    net varchar(5),
    code varchar(20),
    ids varchar(100),
    sources varchar(20),
    types varchar(200),
    nst varchar(10),
    dmin varchar(10),
    rms varchar(10),
    gap varchar(10),
    magType varchar(10),
    disaster_type varchar(15),
    title varchar(100),
    location_type varchar(10),
    coordinates varchar(50)
   ); 

create table staging.stg_universities
 (
     country varchar(15),
     alpha_two_code	varchar(5),
     name varchar(100),
     state_province varchar(20),
     domains varchar(50),
     web_pages varchar(100)
  );

----- creating tables in BIDatamart -----
create table BIDatamart.earthquake
  ( 
    feature_type varchar(10),
    id varchar(20),
    mag float(5),
    place varchar(50),
    occur_time timestamp,
    updated  timestamp,
    tz varchar(10),
    url varchar(100),
    detail varchar(200),
    felt float(10),
    cdi float(10),
    mmi float(10),
    alert varchar(10),
    status varchar(20),
    tsunami int(5),
    sig int(10),
    net varchar(5),
    code varchar(20),
    ids varchar(100),
    sources varchar(20),
    types varchar(200),
    nst float(10),
    dmin float(10),
    rms float(10),
    gap float(10),
    magType varchar(10),
    disaster_type varchar(15),
    title varchar(100),
    location_type varchar(10),
    coordinates varchar(50),
    etl_processed_date timestamp
    );

create table BIDatamart.universities
 (
     country varchar(15),
     alpha_two_code	varchar(5),
     name varchar(100),
     state_province varchar(20),
     domains varchar(50),
     web_pages varchar(100)
  );

  