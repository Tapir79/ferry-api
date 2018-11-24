CREATE TABLE timetables (
    id serial primary key,
    line integer references lines(id),
    from_stop integer references stops(id),
    to_stop integer references stops(id),
    ship integer references ships(id),
    start_time timestamp,
    end_time timestamp
);

INSERT INTO timetables (line, from_stop, to_stop, ship, start_time, end_time) VALUES (2, 10, 7, 8, '2018-12-10 06:30:00+02', '2018-12-10 07:05:00+02');
INSERT INTO timetables (line, from_stop, to_stop, ship, start_time, end_time) VALUES (2, 7, 2, 8, '2018-12-10 07:05:00+02', '2018-12-10 07:50:00+02');
INSERT INTO timetables (line, from_stop, to_stop, ship, start_time, end_time) VALUES (2, 2, 3, 8, '2018-12-10 07:50:00+02', '2018-12-10 08:20:00+02');
INSERT INTO timetables (line, from_stop, to_stop, ship, start_time, end_time) VALUES (2, 3, 4, 8, '2018-12-10 08:20:00+02', '2018-12-10 09:00:00+02');

