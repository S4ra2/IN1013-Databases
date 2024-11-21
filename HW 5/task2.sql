USE restaurant_hw;

-- 1. How much money has the restaurant taken?
SELECT SUM(bill_total) AS Income
FROM restBill;

-- 2. How much money did the restaurant take in February 2016?
SELECT SUM(bill_total) AS `Feb Income`
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- 3. Calculate the average bill in table 2
SELECT AVG(bill_total) AS `Average Bill`
FROM restBill
WHERE table_no = 2;

-- 4. Calculate the minimal, maximal, and average amount of seats of tables in Blue room
SELECT 
    MIN(no_of_seats) AS Min,
    MAX(no_of_seats) AS Max,
    AVG(no_of_seats) AS Avg
FROM restRest_table
WHERE room_name = 'Blue';

-- 5. Count how many distinct tables are served by waiters 004 and 002
SELECT COUNT(DISTINCT table_no) AS `Distinct Tables`
FROM restBill
WHERE waiter_no IN (4, 2);
