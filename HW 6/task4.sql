SELECT DISTINCT cust_name
FROM restBill
WHERE bill_total > 450.00
  AND waiter_no IN (
    SELECT staff_no
    FROM restStaff
    WHERE headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = 'Charles')
);

SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = (
        SELECT room_name
        FROM restRest_table
        WHERE table_no = (
            SELECT table_no
            FROM restBill
            WHERE cust_name = 'Nerida Smith' AND bill_date = 160111
        )
    )
    AND room_date = 160111
);

SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT waiter_no FROM restBill);

SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, rm.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);