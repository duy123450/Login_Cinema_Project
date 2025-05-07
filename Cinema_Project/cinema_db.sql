-- Create the database
CREATE DATABASE cinema_db;
USE cinema_db;

-- Movies table
CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT, -- in minutes
    ReleaseDate DATE
);

-- Theaters table
CREATE TABLE Theaters (
    TheaterID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255)
);

-- Shows table (each screening of a movie)
CREATE TABLE Shows (
    ShowID INT AUTO_INCREMENT PRIMARY KEY,
    MovieID INT,
    TheaterID INT,
    ShowTime DATETIME,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

-- Seats table (fixed seats per theater)
CREATE TABLE Seats (
    SeatID INT AUTO_INCREMENT PRIMARY KEY,
    TheaterID INT,
    SeatNumber VARCHAR(10),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

-- Roles table
CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) UNIQUE NOT NULL
);

-- User table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    RoleID INT,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Tickets table
CREATE TABLE Tickets (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    ShowID INT,
    CustomerID INT,
    SeatID INT,
    BookingTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (CustomerID) REFERENCES Users(UserID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID)
);

-- Insert random movies
INSERT INTO Movies (Title, Genre, Duration, ReleaseDate) VALUES
('Avengers: Endgame', 'Action', 181, '2019-04-26'),
('The Lion King', 'Animation', 118, '2019-07-19'),
('Inception', 'Sci-Fi', 148, '2010-07-16'),
('Titanic', 'Romance', 195, '1997-12-19'),
('The Dark Knight', 'Action', 152, '2008-07-18'),
('A Miku Who Cant Sing', 'Anime', 105, '2025-01-17');

-- Insert random theaters
INSERT INTO Theaters (Name, Location) VALUES
('Cinema 1', 'Downtown, City Center'),
('Cinema 2', 'Uptown Mall'),
('Cinema 3', 'Eastside Cinema Complex'),
('Cinema 4', 'Westend Cinemas'),
('Cinema 5', 'City Theater Hall');

-- Insert random shows (MovieID and TheaterID are referenced)
INSERT INTO Shows (MovieID, TheaterID, ShowTime) VALUES
(1, 1, '2025-05-10 14:30:00'),
(2, 2, '2025-05-10 16:30:00'),
(3, 3, '2025-05-10 18:30:00'),
(4, 4, '2025-05-10 20:30:00'),
(5, 5, '2025-05-10 22:30:00');

-- Insert random seats (TheaterID references)
INSERT INTO Seats (TheaterID, SeatNumber) VALUES
(1, 'A1'), (1, 'A2'), (1, 'A3'), (1, 'B1'), (1, 'B2'),
(2, 'A1'), (2, 'A2'), (2, 'A3'), (2, 'B1'), (2, 'B2'),
(3, 'A1'), (3, 'A2'), (3, 'A3'), (3, 'B1'), (3, 'B2'),
(4, 'A1'), (4, 'A2'), (4, 'A3'), (4, 'B1'), (4, 'B2'),
(5, 'A1'), (5, 'A2'), (5, 'A3'), (5, 'B1'), (5, 'B2');

-- Insert random users (with hashed passwords for security)
INSERT INTO Users (fullname, email, username, password, role_name) VALUES
('The Huy', 'huy@example.com', 'huy', '123', 'admin'),
('Gia Tuan', 'tuan@example.com', 'tuan', '123', 'admin'),
('Thai Duy', 'duy@example.com', 'duy', '123', 'admin'),
('Phuc Nhan', 'nhan@example.com', 'nhan', '123', 'admin'),
('John Doe', 'john.doe@example.com', 'john_doe', 'hashed_password_123', 'customer'),
('Jane Smith', 'jane.smith@example.com', 'jane_smith', 'hashed_password_456', 'customer');

-- Insert random tickets (show, user, and seat references)
INSERT INTO Tickets (ShowID, CustomerID, SeatID) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 3),
(2, 4, 4),
(3, 5, 5),
(3, 1, 2),
(4, 2, 3),
(4, 3, 1),
(5, 4, 4),
(5, 5, 5);

-- Insert random roles
INSERT INTO Roles (RoleName) VALUES
('customer'),
('admin');