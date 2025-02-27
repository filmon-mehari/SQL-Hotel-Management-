--List of the highest price of the room which is higher than 80$ at the hotel
SELECT price as HigherRoomPrice, Type as roomType FROM room 
WHERE price > $90.00
ORDER by price DESC;

--Inserting new colmun into table customer 
INSERT INTO "customer" (First_Name,Last_Name, Date_Of_Birth,Address,Phone_Number,Email) 
VALUES ('Bini','Semere', '2022-01-01','9 Mellangatan Pde., NSW 2035', 123456789,'binijohn@gmail.com');

--FULL OUTER JOIN of service and room
SELECT DISTINCT s.Name as ServiceName, r.room_ID
FROM service s
FULL OUTER JOIN room r 
ON s.service_ID=r.room_ID
ORDER BY s.Name;

--List of January payments
SELECT * FROM payment
WHERE date like '%-01-%'
ORDER BY Date DESC;

--RIGHT JOIN of reservation and manager. 
SELECT r.reservation_ID, m.Last_Name, m.First_Name
FROM reservation r
RIGHT JOIN manager m
ON r.manager_ID = m.manager_ID
ORDER BY r.reservation_ID;


--List of top 50 customers
SELECT TOP 50 customer_ID,First_Name, Date_Of_Birth,Last_Name
FROM customer
WHERE Date_Of_Birth like '%-10-%';


--FULL OUTER JOIN of customer and room
SELECT customer.First_Name, room.room_ID
FROM customer
FULL OUTER JOIN room ON customer.customer_ID=room.room_ID
ORDER BY customer.First_Name;


--List of maximum reservation number
SELECT MAX(reservation_ID) from reservation;


--An OUTER JOIN of manger and hotel tables
SELECT hotel.Name, hotel.Address, hotel.Email
FROM manager
FULL OUTER JOIN hotel
ON manager.First_Name = hotel.Name
WHERE hotel.Address like '%a%' or hotel.hotel_ID LIKE '%5%'; 

--List the number of customers with birth date  
SELECT COUNT(Customer_ID) customer_ID, Date_Of_Birth
FROM customer
GROUP BY Date_Of_Birth
HAVING COUNT(customer_ID) < 5
ORDER BY COUNT(customer_ID) DESC;

--An OUTER JOIN of a customer and reservation tables
SELECT Customer.First_Name, customer.Last_Name,customer.Date_Of_Birth, reservation.reservation_ID
FROM Customer
FULL OUTER JOIN reservation ON Customer.customer_ID=reservation.customer_ID
ORDER BY Customer.First_Name;

-- List of available rooms for reservation with the price less than 50$ 
SELECT COUNT(room.Availability) as AvailableRoomsUnder50$ 
FROM room
where Availability LIKE 'YES' and Price > $50.00;


--List of room with the price BETWEEN 20$ to 60$ 
SELECT * FROM room
WHERE Price NOT BETWEEN '20$' AND '60$';

--Selects all customers with a Last Name starting with "f", "j", "s", "p". 
SELECT * FROM Customer
WHERE First_Name LIKE '[fjsp]%'
ORDER BY First_Name;

--List of LEFT JOIN which returns all from the left table or customer, even if there is no matches in the right table or reservation. all colmuns from the left table
SELECT customer.First_Name, reservation.reservation_ID
FROM customer
LEFT JOIN reservation ON customer.customer_ID = reservation.customer_ID
ORDER BY Customer.First_Name;

--List of SELF JOIN which matches table(service) that are from the same type
SELECT A.Name AS serviceName1, B.Name AS serviceName2, A.Type
FROM service A, service B
WHERE A.service_ID <> B.service_ID
AND A.Type = B.Type
ORDER BY A.Type;