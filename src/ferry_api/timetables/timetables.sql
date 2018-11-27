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
