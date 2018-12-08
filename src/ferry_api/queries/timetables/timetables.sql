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
select * from v_timetables

-- name: get-bookings
select * from bookings

-- name: get-vehicles
select * from vehicles

-- name: post-booking<!
INSERT INTO bookings (first_name, last_name, address, postnumber, city, land, telephone, email, from_stop, to_stop, line, vehicle)
VALUES (:first_name, :last_name, :address, :postnumber, :city, :land, :telephone, :email, :from_stop, :to_stop, :line, :vehicle)