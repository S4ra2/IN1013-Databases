-- 1. Create a view with the name samsBills to allow the waiter Sam Pitt to see the bills he has taken.

CREATE VIEW samsBills AS
SELECT 
    waiter.first_name, 
    waiter.surname, 
    bill.bill_date, 
    customer.cust_name, 
    bill.bill_total
FROM 
    waiter
JOIN 
    bill ON waiter.waiter_id = bill.waiter_id
JOIN 
    customer ON bill.customer_id = customer.customer_id
WHERE 
    waiter.first_name = 'Sam' AND waiter.surname = 'Pitt';



-- 2. Query using samsBills view so Sam can see only bills over £400.

SELECT * 
FROM samsBills
WHERE bill_total > 400;



-- 3. Create a view with the name roomTotals to allow management to see how much each room has taken.

CREATE VIEW roomTotals AS
SELECT 
    room.room_name, 
    SUM(bill.bill_total) AS total_sum
FROM 
    room
JOIN 
    bill ON room.room_id = bill.room_id
GROUP BY 
    room.room_name;



-- 4. Create a view with the name teamTotals to allow management to see how much each team has taken.
--    Concatenate the first name and surname of the waiter with a space in between.

CREATE VIEW teamTotals AS
SELECT 
    CONCAT(waiter.first_name, ' ', waiter.surname) AS headwaiter_name, 
    SUM(bill.bill_total) AS total_sum
FROM 
    waiter
JOIN 
    bill ON waiter.waiter_id = bill.waiter_id
GROUP BY 
    headwaiter_name;
