CREATE MATERIALIZED VIEW v_timetables as
select l.name_sv,
       l.name_fi,
       l.name_en,
       l.id as lineid,
       s.id as ship_id,
       (select s2.name from stops s2 where ls.from_stop = s2.id) as from_name,
       (select s2.name from stops s2 where ls.to_stop = s2.id) as to_name,
       ls.from_stop,
       ls.to_stop,
       t.start_time,
       t.end_time,
       s.name as ship_name,
       s.passengers,
       s.cars,
       s.phone ,
       ls.id as segment_id,
       ls.geometry
from timetables t
    join line_segments ls
        on (t.segment = ls.id)
    join ships s
        on (t.ship = s.id)
    join lines l
        on (ls.line = l.id)
order by start_time;