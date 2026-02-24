CREATE DATABASE client_portal;

USE client_portal;

CREATE TABLE Clients (
	client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    company_name VARCHAR(50),
    phoneNumber VARCHAR(20)
);

CREATE TABLE Projects (
	project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100),
    client_id INT,
    budget DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE DataLog (
	datalog_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    client_id INT,
    message TEXT,
    FOREIGN KEY (project_id) REFERENCES Projects (project_id)
);


INSERT INTO Clients (name, email, company_name, phoneNumber) VALUES
('Vikas Sutar', 'vikas@gmail.com', 'RS Designs', 9158257510),
('Omkar Mohite', 'omkar@gmail.com', 'Mohite Industries', 8544213480),
('Payal Sabale', 'payal@gmail.com', 'Sabale Industries', 7786687826),
('Neha Yadav', 'neha@gmail.com', 'Optivine Agency', 9185525701),
('Sushant Patil', 'sushant@gmail.com', 'Om Sai Pvt LTD', 8909084054),
('Karan Sonavne', 'karan@gmail.com', 'Sonavne Tech', 7582081233),
('Snehal Gupta', 'snehal@gmail.com', 'Gupta Tech Hub', 9034771254),
('Ashvini Singh', 'ashu@gmail.com', 'Singh Industries', 8001203291),
('Aditya Kapoor', 'aditya@gmail.com', 'Kapoor & Sons Pvt LTD', 8690332485),
('Arjun Nair', 'arjun@gmail.com', 'Sai Motors', 7770006643);


INSERT INTO Projects (project_name, client_id, budget, start_date, end_date) VALUES
('Road contract tender', 9, 100000, '2024-01-23', '2024-03-10'),
('Corporate Website Project', 2, 50000, '2024-01-10', '2024-04-20'),
('Home design Project', 1, 70000, '2024-04-01', '2024-05-22'),
('Revenue Calculate', 10, 1500000, '2024-01-30', '2024-03-25'),
('Website UI Design', 7, 55000, '2024-03-23', '2024-04-15'),
('Marketing project', 3, 150000, '2024-04-01', '2024-05-03'),
('Cloud Server Maintain', 8, 90000, '2024-07-16', '2024-10-30'),
('E-Commerce Project', 6, 59000, '2024-07-17', '2024-09-29'),
('Build System', 4, 80000, '2024-08-24', '2024-11-22'),
('SEO Optimization', 5, 30000, '2024-10-08', '2025-01-06');


INSERT INTO DataLog (project_id, client_id, message) VALUES
(1,2, 'Budget update after discussion'),
(2,9,'Project created successfully'),
(3,3, 'Design is ready'),
(4,10, 'Revenue calculated'),
(5,8, 'Website design is ready'),
(6,1, 'Project document uploaded'),
(7,7,'Testing phase started' ),
(8,6, 'Project in progress'),
(9,5,'System is created successfully'),
(10,4, 'Project discussion completed');

SELECT * FROM Clients;

SELECT * FROM Projects;

SELECT * FROM DataLog;