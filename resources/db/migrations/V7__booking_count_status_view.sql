CREATE VIEW v_booking_status AS
 select count(*) as passenger_count, 
(select count(*) from bookings b1
   where t.from_stop = b1.from_stop 
    and t.to_stop = b1.to_stop
    and t.start_time = b1.start_time
    and t.end_time = b1.end_time
    and b1.vehicle is not NULL) as vehicle_count,
 t.name_sv,
 t.line_id,
 t.ship_id,
 t.ship_name,
 t.from_stop,
 t.from_name,
 t.to_stop,
 t.to_name,
 t.start_time,
 t.end_time,
 t.max_passengers,
 t.max_vehicles,
 t.geometry
from mv_timetables t
join bookings b
 on (b.from_stop = t.from_stop
  and b.to_stop = t.to_stop
  and b.start_time = t.start_time
  and b.end_time = t.end_time
  and b.line = t.line_id)
group by  t.name_sv, t.line_id, t.ship_id, t.ship_name, t.from_stop, t.from_name, t.to_stop, t.to_name, t.start_time, t.end_time, t.max_passengers, t.max_vehicles, t.geometry ;
