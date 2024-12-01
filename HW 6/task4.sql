
-- 1. List the names of customers who spent more than 450.00 on a single bill on 
-- occasions when ‘Charles’ was their Headwaiter.

SELECT DISTINCT restBill.cust_name 
FROM restBill
JOIN restStaff AS waiter ON restBill.waiter_no = waiter.staff_no
JOIN restStaff AS headwaiter ON waiter.headwaiter = headwaiter.staff_no
WHERE headwaiter.first_name = 'Charles'
  AND restBill.bill_total > 450.00;



-- 2. A customer called Nerida has complained that a waiter was rude to her when she dined at 
-- the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have
-- to deal with the matter?

SELECT headwaiter.first_name, headwaiter.surname
FROM restBill
JOIN restStaff AS waiter ON restBill.waiter_no = waiter.staff_no
JOIN restStaff AS headwaiter ON waiter.headwaiter = headwaiter.staff_no
WHERE restBill.cust_name = 'Nerida Smith'
  AND restBill.bill_date = 160111;



-- 3. What are the names of customers with the smallest bill?

SELECT cust_name, bill_total
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);



-- 4. List the names of any waiters who have not taken any bills.

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN ( SELECT DISTINCT waiter_no FROM restBill );



-- 5. Which customers had the largest single bill? List the customer name, the name and surname
--  of headwaiters, and the room name where they were served on that occasion.

SELECT cust_name, 
       headwaiter.first_name AS headwaiter_first_name, 
       headwaiter.surname AS headwaiter_surname, 
       restRoom_management.room_name
FROM restBill
JOIN restStaff AS waiter ON restBill.waiter_no = waiter.staff_no
JOIN restStaff AS headwaiter ON waiter.headwaiter = headwaiter.staff_no
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management ON restRest_table.room_name = restRoom_management.room_name
WHERE bill_total = (SELECT MAX(bill_total) FROM restBill);