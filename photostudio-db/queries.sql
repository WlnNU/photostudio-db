SELECT b.id, c.name AS client, p.name AS photographer,
       s.name AS studio, st.name AS shoot_type,
       b.start_time, b.end_time, b.status, b.total_price
FROM booking b
JOIN client c            ON b.client_id = c.id
LEFT JOIN photographer p ON b.photographer_id = p.id
JOIN studio s            ON b.studio_id = s.id
JOIN shoot_type st       ON b.shoot_type_id = st.id;

SELECT po.*, b.status AS booking_status
FROM print_order po
JOIN booking b ON po.booking_id = b.id
WHERE b.client_id = 1;
