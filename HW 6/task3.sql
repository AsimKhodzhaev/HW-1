SELECT DISTINCT first_name, surname
FROM restStaff
WHERE staff_no IN (
    SELECT waiter_no
    FROM restBill
    WHERE cust_name = 'Tanya Singh'
);

SELECT room_date
FROM restRoom_management
WHERE room_name = 'Green' 
  AND headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = 'Charles')
  AND room_date BETWEEN 160201 AND 160229;

SELECT first_name, surname
FROM restStaff
WHERE headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT DISTINCT waiter_no
    FROM restBill
    WHERE table_no IN (
        SELECT table_no
        FROM restBill
        WHERE bill_no IN (14, 17)
    )
);

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT waiter_no
    FROM restBill
    WHERE table_no IN (
        SELECT table_no
        FROM restRest_table
        WHERE room_name = 'Blue'
    )
    AND bill_date = 160312
)
OR s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);

