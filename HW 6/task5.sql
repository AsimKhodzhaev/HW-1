SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

SELECT room_name, COUNT(*) AS num_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

SELECT rt.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
GROUP BY rt.room_name;

SELECT hs.first_name, hs.surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff hs
JOIN restStaff ws ON hs.staff_no = ws.headwaiter
JOIN restBill b ON ws.staff_no = b.waiter_no
GROUP BY hs.first_name, hs.surname
ORDER BY total_bill_amount DESC;

SELECT cust_name, AVG(bill_total) AS avg_spent
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;
