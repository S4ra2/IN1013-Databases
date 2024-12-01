
-- 1. Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates and the number of bills they have taken.

SELECT waiter.first_name, waiter.surname, restBill.bill_date, COUNT(restBill.bill_no) AS bill_count
FROM restBill
JOIN restStaff AS waiter ON restBill.waiter_no = waiter.staff_no
GROUP BY waiter.staff_no, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2;



-- 2. List the rooms with tables that can server more than 6 people and how many of such tables they have.

SELECT restRest_table.room_name, COUNT(restRest_table.table_no) AS table_count
FROM restRest_table
WHERE restRest_table.no_of_seats > 6
GROUP BY restRest_table.room_name;



-- 3. List the names of the rooms and the total amount of bills in each room

SELECT restRoom_management.room_name, SUM(restBill.bill_total) AS total_bill
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management ON restRest_table.room_name = restRoom_management.room_name
GROUP BY restRoom_management.room_name;



-- 4. List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.

SELECT headwaiter.first_name, headwaiter.surname, SUM(restBill.bill_total) AS total_bill
FROM restBill
JOIN restStaff AS waiter ON restBill.waiter_no = waiter.staff_no
JOIN restStaff AS headwaiter ON waiter.headwaiter = headwaiter.staff_no
GROUP BY headwaiter.staff_no
ORDER BY total_bill DESC;



-- 5. List any customers who have spent more than £400 on average.

SELECT cust_name, AVG(bill_total) AS avg_bill
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;



-- 6. Which waiters have taken 3 or more bills on a single date? List the waiter names, surnames, and the number of bills they have taken.

SELECT waiter.first_name, waiter.surname, COUNT(restBill.bill_no) AS bill_count
FROM restBill
JOIN restStaff AS waiter ON restBill.waiter_no = waiter.staff_no
GROUP BY waiter.staff_no, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 3;
