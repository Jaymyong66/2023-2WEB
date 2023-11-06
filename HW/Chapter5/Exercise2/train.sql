/* 5.2.1 */
SELECT u.id, u.name, t.seat_number
FROM users u
INNER JOIN tickets t ON u.id = t.user
WHERE t.train = 11
ORDER BY t.seat_number;


/* 5.2.2 */
SELECT u.id, u.name, COUNT(*) AS trains_count, SUM(t.distance) / 10 AS total_distance
FROM users u
INNER JOIN (
  SELECT t.user, t.train, SUM(tr.distance) AS distance
  FROM tickets t
  INNER JOIN trains tr ON t.train = tr.id
  GROUP BY t.user, t.train
) AS t ON u.id = t.user
GROUP BY u.id
ORDER BY total_distance DESC
LIMIT 6;


/* 5.2.3 */
SELECT t.id, ty.name AS type, src.name AS src_stn, dst.name AS dst_stn, 
       TIMEDIFF(t.arrival, t.departure) AS travel_time
FROM trains t
INNER JOIN types ty ON t.type = ty.id
INNER JOIN stations src ON t.source = src.id
INNER JOIN stations dst ON t.destination = dst.id
ORDER BY travel_time DESC
LIMIT 6;


/* 5.2.4 */
SELECT ty.name AS type, src.name AS src_stn, dst.name AS dst_stn, 
       t.departure, t.arrival, ROUND((ty.fare_rate * t.distance / 1000), -2) AS fare
FROM trains t
INNER JOIN types ty ON t.type = ty.id
INNER JOIN stations src ON t.source = src.id
INNER JOIN stations dst ON t.destination = dst.id
ORDER BY t.departure;


/* 5.2.5 */
SELECT t.id, ty.name AS type, src.name AS src_stn, dst.name AS dst_stn,
       COUNT(*) AS occupied, ty.max_seats AS maximum
FROM tickets ti
INNER JOIN trains t ON t.id = ti.train
INNER JOIN types ty ON t.type = ty.id
INNER JOIN stations src ON t.source = src.id
INNER JOIN stations dst ON t.destination = dst.id
GROUP BY t.id
ORDER BY t.id;


/* 5.2.6 */
SELECT t.id, ty.name AS type, src.name AS src_stn, dst.name AS dst_stn,
       COALESCE(COUNT(ti.id), 0) AS occupied, ty.max_seats AS maximum
FROM trains t
LEFT JOIN tickets ti ON t.id = ti.train
INNER JOIN types ty ON t.type = ty.id
INNER JOIN stations src ON t.source = src.id
INNER JOIN stations dst ON t.destination = dst.id
GROUP BY t.id
ORDER BY t.id;
