-- name: get-stops
select * from stops

-- name: get-lines
select * from lines

-- name: get-ships
select * from ships

-- name: get-departures
select *
from timetables tt
left join line_segments ls on tt.segment=ls.id
where tt.segment in (select id from line_segments where from_stop = :stop)

-- name: get-linesegments
select * from line_segments

-- name: get-stoproutes
select * from mv_timetables

-- name: get-bookings-status_count
select *  from v_booking_status

-- name: get-timetables
select * from timetables

-- name: get-bookings
select first_name,
last_name,
address,
postnumber,
city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time::timestamptz,
end_time::timestamptz,
line, line_desc,
vehicle, vehicle_desc,
created_at
from bookings

-- name: get-vehicles
select * from vehicles

-- name: post-booking<!
INSERT INTO bookings (
first_name,
last_name,
address,
postnumber, city, land, telephone, email,
from_stop, from_stop_desc,
to_stop, to_stop_desc,
start_time,
end_time,
line, line_desc,
vehicle, vehicle_desc,
created_at)
VALUES (
:first_name,
:last_name,
:address,
:postnumber,
:city,
:land,
:telephone,
:email,
:from_stop,
:from_stop_desc,
:to_stop,
:to_stop_desc,
to_timestamp(:start_time,'YYYY.MM.DD. HH:MI:SS'),
to_timestamp(:end_time, 'YYYY.MM.DD. HH:MI:SS'),
:line,
:line_desc,
:vehicle,
:vehicle_desc,
now())


