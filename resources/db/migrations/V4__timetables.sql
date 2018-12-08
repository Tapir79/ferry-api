CREATE TABLE timetables (
    id serial primary key,
    segment integer references line_segments(id),
    ship integer references ships(id),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

-- demo 1 Södra linje
-- segment 21 kökar to långnäs 13.12.2018  M/S Gudingen
-- 6.30 -- 9
-- 15.00 -- 17.30
-- straight
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (21, 10, '2018-12-13 06:30:00+02', '2018-12-13 09:00:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (21, 10, '2018-12-13 15:00:00+02', '2018-12-13 17:30:00+02');

-- demo 2 Tvar linje or Södra+Tvar linjes 13.12
-- segment 43 Långnäs to Snäckö Tvar linje M/S Odin
-- straight
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (43, 2, '2018-12-13 16:10:00+02', '2018-12-13 17:55:00+02');

-- Mon 10.12.2018
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (2, 8, '2018-12-10 06:30:00+02', '2018-12-10 07:05:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (7, 8, '2018-12-10 07:05:00+02', '2018-12-10 07:50:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (5, 8, '2018-12-10 07:50:00+02', '2018-12-10 08:20:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (6, 8, '2018-12-10 08:20:00+02', '2018-12-10 09:00:00+02');

INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (14, 11, '2018-12-10 09:00:00+02', '2018-12-10 09:50:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (4, 11, '2018-12-10 09:50:00+02', '2018-12-10 10:20:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (5, 11, '2018-12-10 10:20:00+02', '2018-12-10 10:50:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (6, 11, '2018-12-10 10:50:00+02', '2018-12-10 11:30:00+02');

INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (2, 8, '2018-12-10 15:00:00+02', '2018-12-10 15:35:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (7, 8, '2018-12-10 15:35:00+02', '2018-12-10 16:20:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (5, 8, '2018-12-10 16:20:00+02', '2018-12-10 16:50:00+02');
INSERT INTO timetables (segment, ship, start_time, end_time) VALUES (6, 8, '2018-12-10 16:50:00+02', '2018-12-10 17:30:00+02');