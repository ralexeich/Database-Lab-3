create table track(  
      track_name varchar(1000)  PRIMARY KEY, 
      artist varchar(1000), 
      track_duration varchar(1000)
);

create table region(
      region_name varchar(1000)  PRIMARY KEY
);


     
create table charts(
      charts_place varchar(1000)  PRIMARY KEY,
      region_name varchar(1000)  references region(region_name),
      track_name varchar(1000)  references track(track_name),
      popularity varchar(1000) 
);
