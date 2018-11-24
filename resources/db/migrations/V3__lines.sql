CREATE TABLE lines (
    id integer primary key,
    name_sv text,
    name_fi text,
    name_en text,
    geometry text
);

INSERT INTO lines (id, name_sv, name_fi, name_en) VALUES (1, 'Norra linjen', 'Pohjoinen linja', 'Northen line');
INSERT INTO lines (id, name_sv, name_fi, name_en) VALUES (2, 'Södra linjen', 'Eteläinen linja', 'Southern line');
INSERT INTO lines (id, name_sv, name_fi, name_en) VALUES (3, 'Tvärgående linjen', 'Poikittainen linja', 'Cross line');
INSERT INTO lines (id, name_sv, name_fi, name_en) VALUES (4, 'Föglölinjen', 'Föglön linja', 'Föglö line');

CREATE TABLE stops (
    id integer primary key,
    name text,
    lat decimal,
    lng decimal
);

INSERT INTO stops (id, name, lat, lng) VALUES (1, 'Snäckö', 60.21916, 20.72675);
INSERT INTO stops (id, name, lat, lng) VALUES (2, 'Sottunga', 60.11003, 20.68214);
INSERT INTO stops (id, name, lat, lng) VALUES (3, 'Överö', 60.11145, 20.51089);
INSERT INTO stops (id, name, lat, lng) VALUES (4, 'Långnäs', 60.11763, 20.29668);
INSERT INTO stops (id, name, lat, lng) VALUES (5, 'Bergö', 60.1626921, 20.3927480);

INSERT INTO stops (id, name, lat, lng) VALUES (6, 'Galtby', 60.1854808, 21.5858297);
INSERT INTO stops (id, name, lat, lng) VALUES (7, 'Kökar', 59.9455971, 20.8917824);
INSERT INTO stops (id, name, lat, lng) VALUES (8, 'Kyrkogårdsö', 60.0313030, 20.8251714);
INSERT INTO stops (id, name, lat, lng) VALUES (9, 'Husö', 60.0647341, 20.8073747);

INSERT INTO stops (id, name, lat, lng) VALUES (10, 'Degerby', 60.0317802, 20.3858259);
INSERT INTO stops (id, name, lat, lng) VALUES (11, 'Svinö', 60.0665811, 20.2675505);

INSERT INTO stops (id, name, lat, lng) VALUES (12, 'Hummelvik', 60.2242177, 20.4136621);
INSERT INTO stops (id, name, lat, lng) VALUES (13, 'Enklinge', 60.3183138, 20.7513513);
INSERT INTO stops (id, name, lat, lng) VALUES (14, 'Kumlinge', 60.2904026, 20.7901287);
INSERT INTO stops (id, name, lat, lng) VALUES (15, 'Lappo', 60.3174626, 20.9959478);
INSERT INTO stops (id, name, lat, lng) VALUES (16, 'Torsholma', 60.3568842, 21.0388434);

