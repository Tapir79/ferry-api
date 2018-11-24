CREATE TABLE ships (
   id serial,
   name text not null unique,
   passengers integer not null,
   cars integer not null,
   phone text
);


INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Rosala II', 65, 6, '+358 (0)400 492 739');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Odin', 80, 45, '+358 (0)40 484 0352');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Frida II', 70, 16, '+358 (0)457 361 3394');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Bärö', 65, 25, '+358 (0)400 492 739');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Skarven', 250, 60, '+358 (0)40 173 3600');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Viggen', 250, 50, '+358 (0)400 330 455');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Alfågeln', 244, 50, '+358 (0)40 768 2108');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Doppingen', 70, 18, '+358 (0)40 708 2136');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Knipan', 157, 20, '+358 (0)400 229 261');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Gudingen', 195, 20, '+358 (0)40 769 3687');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Skiftet', 200, 20, '+358 (0)400 350 265');
INSERT INTO ships (name, passengers, cars, phone) VALUES ('M/S Ejden', 144, 20, '+358 (0)400 229 260');

