-- ==============================
-- TABLE 1: flights
-- ==============================
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) UNIQUE NOT NULL,
    airline VARCHAR(100),
    departure VARCHAR(50),
    destination VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    available_seats INT,
    price DECIMAL(10,2)
);

-- ==============================
-- TABLE 2: passengers
-- ==============================
CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    contact VARCHAR(15),
    passport_number VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- ==============================
-- TABLE 3: reservations
-- ==============================
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(10),
    class ENUM('Economy', 'Business', 'First'),
    payment_status ENUM('Paid', 'Pending') DEFAULT 'Pending',
    cancellation_status ENUM('Active', 'Cancelled') DEFAULT 'Active',
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

-- ==============================
-- INSERTING DATA: flights
-- ==============================
INSERT INTO flights (flight_number, airline, departure, destination, departure_time, arrival_time, available_seats, price)
VALUES 
('AI101', 'IndiGo', 'Delhi', 'Mumbai', '2025-07-01 10:00:00', '2025-07-01 12:30:00', 150, 4500.00),
('AI202', 'Air India', 'Kolkata', 'Chennai', '2025-07-02 15:00:00', '2025-07-02 18:00:00', 120, 5500.00),
('AI303', 'SpiceJet', 'Bangalore', 'Pune', '2025-07-03 07:00:00', '2025-07-03 08:45:00', 100, 3200.00),
('AI404', 'GoAir', 'Hyderabad', 'Delhi', '2025-07-04 13:30:00', '2025-07-04 15:30:00', 180, 3900.00),
('AI505', 'Vistara', 'Ahmedabad', 'Goa', '2025-07-05 11:00:00', '2025-07-05 13:00:00', 140, 4700.00);

-- ==============================
-- INSERTING DATA: passengers
-- ==============================
INSERT INTO passengers (name, age, gender, contact, passport_number, email, password_hash)
VALUES
('John Doe', 30, 'Male', '9876543210', 'A12345678', 'john@example.com', 'hashed123'),
('Jane Smith', 27, 'Female', '8765432109', 'B98765432', 'jane@example.com', 'hashed456'),
('Ravi Kumar', 35, 'Male', '9999999999', 'C11223344', 'ravi@example.com', 'pass@123'),
('Priya Mehta', 29, 'Female', '8888888888', 'D55667788', 'priya@example.com', 'pass@456');

-- ==============================
-- INSERTING DATA: reservations
-- ==============================
INSERT INTO reservations (passenger_id, flight_id, booking_date, seat_number, class, payment_status, cancellation_status)
VALUES
(1, 1, '2025-06-01', '12A', 'Economy', 'Paid', 'Active'),
(2, 2, '2025-06-02', '14B', 'Business', 'Pending', 'Active'),
(3, 3, '2025-06-03', '16C', 'Economy', 'Paid', 'Cancelled'),
(4, 4, '2025-06-04', '18D', 'First', 'Paid', 'Active');

-- ==============================
-- OUTPUT: View Data from All Tables
-- ==============================
SELECT * FROM flights;
SELECT * FROM passengers;
SELECT * FROM reservations;
