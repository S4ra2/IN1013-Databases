USE restaurant_hw;

-- 1. List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2. On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room?
SELECT restRoom_management.room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles'
  AND restRoom_management.room_name = 'Green'
  AND restRoom_management.room_date BETWEEN 160201 AND 160229;

-- 3. List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4. List the customer name, the amount they spent, and the waiter’s name for all bills.
-- Order the list by the amount spent, highest bill first.
SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5. List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill AS b1
JOIN restBill AS b2 ON b1.waiter_no = b2.waiter_no
JOIN restStaff ON b1.waiter_no = restStaff.staff_no
WHERE b1.bill_no IN (14, 17);

-- 6. List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restRoom_management
JOIN restRest_table ON restRoom_management.room_name = restRest_table.room_name
JOIN restBill ON restRest_table.table_no = restBill.table_no
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restRoom_management.room_name = 'Blue'
  AND restRoom_management.room_date = 160312;
