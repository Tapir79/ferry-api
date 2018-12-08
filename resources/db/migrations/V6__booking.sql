--X-SMALL
--Cykel, cykelsläp, moped
--Polkupyörä, polkupyörävanu, mopo
--Bike, bicycle trailer, moped

--SMALL MC, mopedbil, 4-hjuling
--Moottoripyörä, mopoauto, mönkijä
--MC, 4-wheeled moped car, light 4 WD-vehicle

--MEDIUM
--Lågt fordon, maxhöjd 1,8 m inkl. taklast.
--Matala ajoneuvo, kork. 1,8 m kattokuorman kanssa.
--Low vehicle, max. height 1.8 m, incl. roof load.
--EKIPAGE
--MEDIUM*)
--Lågt fordon+lågt släp, maxhöjd 1,8 m inkl. taklast/last.
--Matala ajoneuvo+matala perävaunu, kork. 1,8 m kattokuorman/kuorman kanssa.
--Low vehicle+low trailer, max. height 1.8 m, incl. roof load/load.
--LARGE Högt fordon, höjd över 1,8 m inkl. taklast.
--Korkea ajoneuvo, yli 1,8 m kattokuorman kanssa.
--High vehicle, height over 1.8 m incl. roof load.
--EKIPAGE
--LARGE*)
--Fordon+släp, höjd över 1,8 m inkl. taklast/last.
--Ajoneuvo+perävaunu, korkeus yli 1,8 m sis. kattokuorman/kuorman.
--Vehicle+trailer, height over 1.8 m incl. roof load/load.
--X-LARGEN)
--(nyttotrafik)
--Buss, lastbil, lastbilssläp, traktor, traktorsläp, dumpers, skogskran, markvält
--Linja-auto, kuorma-auto, kuorma-auton perävaunu, traktori, traktoriperävaunu, maansiirtoajoneuvo,
--puutavarakuormain, valssijyrä.
--Bus, lorry, lorry trailer, tractor, tractortrailer, dumper, forestry harvester, compaction roller.

CREATE TABLE vehicles(
 id integer primary key,
 vehicle_group varchar,
 name_fi varchar,
 name_sv varchar,
 name_en varchar
);


INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (1,'X-SMALL', 'Polkupyörä, polkupyörävanu, mopo', 'Cykel, cykelsläp, moped','Bike, bicycle trailer, moped');
INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (2,'SMALL ', 'Moottoripyörä, mopoauto, mönkijä', 'MC, mopedbil, 4-hjuling','MC, 4-wheeled moped car, light 4 WD-vehicle');
INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (3,'MEDIUM', 'Matala ajoneuvo, kork. 1,8 m kattokuorman kanssa.', 'Lågt fordon, maxhöjd 1,8 m inkl. taklast.','Low vehicle, max. height 1.8 m, incl. roof load.');
INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (4,'EKIPAGE MEDIUM', 'Matala ajoneuvo+matala perävaunu, kork. 1,8 m kattokuorman/kuorman kanssa.', 'Lågt fordon+lågt släp, maxhöjd 1,8 m inkl. taklast/last. ','Low vehicle+low trailer, max. height 1.8 m, incl. roof load/load.');
INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (5,'LARGE', 'Korkea ajoneuvo, yli 1,8 m kattokuorman kanssa.', 'Högt fordon, höjd över 1,8 m inkl. taklast.','High vehicle, height over 1.8 m incl. roof load.');
INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (6,'EKIPAGE LARGE', 'Ajoneuvo+perävaunu, korkeus yli 1,8 m sis. kattokuorman/kuorman. ', 'Fordon+släp, höjd över 1,8 m inkl. taklast/last','Vehicle+trailer, height over 1.8 m incl. roof load/load.');
INSERT INTO vehicles (id, vehicle_group, name_fi, name_sv, name_en) VALUES (7,'X-LARGEN) (nyttotrafik)', 'Linja-auto, kuorma-auto, kuorma-auton perävaunu, traktori, traktoriperävaunu, maansiirtoajoneuvo,
puutavarakuormain, valssijyrä.', 'Buss, lastbil, lastbilssläp, traktor, traktorsläp, dumpers, skogskran, markvält','Bus, lorry, lorry trailer, tractor, tractortrailer, dumper, forestry harvester, compaction roller');


CREATE TABLE bookings(
    id serial primary key,
    first_name varchar,
    last_name varchar,
    address varchar,
    postnumber varchar,
    city varchar,
    land varchar,
    telephone varchar,
    email varchar,
    from_stop integer,
    from_stop_desc varchar,
    to_stop integer,
    to_stop_desc varchar,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    line integer,
    line_desc varchar,
    ship integer,
    ship_desc varchar,
    vehicle integer,
    vehicle_desc varchar,
    created_at TIMESTAMP
);

-- examples Teppo is travelling from Långnäs (4) to Överö (3) by Sothern Line and he has a motorcycle
INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com', 4,'Långnäs', 3, 'Överö', '2018-12-10 07:05:00+02', '2018-12-10 07:50:00+02', 2, 'Södra linjen', 8,'M/S Doppingen', 2, 'MC, mopedbil, 4-hjuling','2018-12-10 07:50:00+02');
-- Terhi is travelling from Överö (3) to Långnäs (4) by Southern Line without a vehicle
INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Terhi','Testaaja','Kärsämäenkuja 4','02730','Kärsämäki', 'Finland','+35850222333','terhi.testaaja@gmail.com', 3, 'Överö', 4, 'Långnäs', '2018-12-10 08:20:00+02', '2018-12-10 09:00:00+02', 2, 'Södra linjen',8,'M/S Doppingen',null,null,'2018-12-10 07:50:00+02');


-- demo 1

INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com',7, 'Kökar', 4,'Långnäs', '2018-12-13 06:30:00+02', '2018-12-13 09:00:00+02', 2, 'Södra linjen', 10, 'M/S Gudingen', 2, 'MC, mopedbil, 4-hjuling','2018-12-10 10:50:00+02');

INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com',7, 'Kökar', 4,'Långnäs', '2018-12-13 06:30:00+02', '2018-12-13 09:00:00+02', 2, 'Södra linjen', 10, 'M/S Gudingen', 2, 'MC, mopedbil, 4-hjuling','2018-12-10 10:50:00+02');

INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com',7, 'Kökar', 4,'Långnäs', '2018-12-13 06:30:00+02', '2018-12-13 09:00:00+02', 2, 'Södra linjen', 10, 'M/S Gudingen', 2, 'MC, mopedbil, 4-hjuling','2018-12-10 10:50:00+02');

INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com',7, 'Kökar', 4,'Långnäs', '2018-12-13 06:30:00+02', '2018-12-13 09:00:00+02', 2, 'Södra linjen', 10, 'M/S Gudingen', 2, 'MC, mopedbil, 4-hjuling','2018-12-10 10:50:00+02');

INSERT INTO bookings (first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time, end_time,
line, line_desc,
ship, ship_desc,
vehicle, vehicle_desc,
created_at)
VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com',7, 'Kökar', 4,'Långnäs', '2018-12-13 06:30:00+02', '2018-12-13 09:00:00+02', 2, 'Södra linjen', 10, 'M/S Gudingen', null, null,'2018-12-10 10:50:00+02');


--grant all on all tables in schema public to ferry;
--grant all on all tables in schema ferry to ferry;