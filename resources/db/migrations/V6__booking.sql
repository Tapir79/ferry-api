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
    from_stop integer references stops(id),
    to_stop integer references stops(id),
    line integer references lines(id),
    vehicle integer references vehicles(id)
);

-- examples Teppo is travelling from Långnäs to Överö by Sothern Line and he has a motorcycle
INSERT INTO bookings (first_name, last_name, address, postnumber, city, land, telephone, email, from_stop, to_stop, line, vehicle) VALUES ('Teppo','Testaaja','Kärsämäentie 5 a 4','02720','Kärsämäki', 'Finland','+35850666333','teppo.testaaja@gmail.com', 4, 3, 2, 2);
-- Terhi is travelling from Överö to Långnäs by Southern Line without a vehicle
INSERT INTO bookings (first_name, last_name, address, postnumber, city, land, telephone, email, from_stop, to_stop, line, vehicle) VALUES ('Terhi','Testaaja','Kärsämäenkuja 4','02730','Kärsämäki', 'Finland','+35850222333','terhi.testaaja@gmail.com', 3, 4, 2, null);


--grant all on all tables in schema public to ferry;
--grant all on all tables in schema ferry to ferry;