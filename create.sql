create table track(  
      track_name varchar(1000) not null PRIMARY KEY, 
      artist varchar(1000) not null, 
      track_duration integer not null 
);

insert into track(track_name,track_duration,artist)
values ('DHL', '183', 'Frank Ocean');

insert into track(track_name,track_duration,artist)
values ('GUMMY', '156', 'BROCKHAMPTON');

insert into track(track_name,track_duration,artist)
values ('GEORGIA', '147', 'Kevin Abstract');

insert into track(track_name,track_duration,artist)
values ('Cloud Blu', '137', 'IDK');

insert into track(track_name,track_duration,artist)
values ('Stoned Again', '168', 'King Krule');

insert into track(track_name,track_duration,artist)
values ('Ivy', '198', 'Frank Ocean');

create table region(
      region_name varchar(1000) not null PRIMARY KEY,
      full_spreading varchar(50) not null
);

insert into region(region_name, full_spreading)
values ('Apple Music', 'Yes');

insert into region(region_name, full_spreading)
values ('Spotify', 'No');

insert into region(region_name, full_spreading)
values ('Tidal', 'Yes');

insert into region(region_name, full_spreading)
values ('Google Music', 'Yes');

insert into region(region_name, full_spreading)
values ('Amazon Music', 'No');

insert into region(region_name, full_spreading)
values ('YouTube Music', 'Yes');

insert into region(region_name, full_spreading)
values ('Soundcloud', 'Yes');
     
create table charts(
      charts_place integer not null PRIMARY KEY,
      region_name varchar(1000) not null references region(region_name),
      track_name varchar(1000) not null references track(track_name),
      popularity integer not null
);

insert into charts(charts_place, region_name, track_name, popularity)
values ('1', 'Apple Music', 'DHL', '79');

insert into charts(charts_place, region_name, track_name, popularity)
values ('4', 'Apple Music', 'Cloud Blu', '58');

insert into charts(charts_place, region_name, track_name, popularity)
values ('6', 'Spotify', 'Ivy', '72');

insert into charts(charts_place, region_name, track_name, popularity)
values ('8', 'Tidal', 'GUMMY', '55');

insert into charts(charts_place, region_name, track_name, popularity)
values ('3', 'Spotify', 'GEORGIA', '67');

insert into charts(charts_place, region_name, track_name, popularity)
values ('2', 'Apple Music', 'Stoned Again', '45');
