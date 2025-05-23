-- Movies table
CREATE TABLE Movies (
    MovieID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT, -- in minutes
    release_date_at DATE NOT NULL
);

-- Theaters table
CREATE TABLE Theaters (
    TheaterID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255)
);

-- Shows table (each screening of a movie)
CREATE TABLE Shows (
    ShowID BIGINT AUTO_INCREMENT PRIMARY KEY,
    MovieID BIGINT,
    TheaterID BIGINT,
    start_at DATETIME NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

-- Seats table (fixed seats per show)
CREATE TABLE Seats (
    SeatID BIGINT AUTO_INCREMENT PRIMARY KEY,
    ShowID BIGINT,
    SeatNumber VARCHAR(10) NOT NULL,
    price BIGINT NOT NULL,
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID)
);

-- User table
CREATE TABLE Users (
    UserID BIGINT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Product(popcorn + drink)
CREATE TABLE Products (
    ProductID BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price BIGINT NOT NULL,
    discount INT NOT NULL,
    stock INT NOT NULL
);
-- Tickets table
CREATE TABLE Tickets (
    TicketID BIGINT AUTO_INCREMENT PRIMARY KEY,
    ShowID BIGINT,
    UserID BIGINT,
    SeatID BIGINT,
    MovieID BIGINT,
    TheaterID BIGINT,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

-- Ticket details
CREATE TABLE ticket_details (
    TicketDetailID BIGINT AUTO_INCREMENT PRIMARY KEY,
    TicketID BIGINT NOT NULL,
    ProductID BIGINT NOT NULL,
    price BIGINT NOT NULL,
    discount INT NOT NULL,
    quantity INT NOT NULL,
    total_price BIGINT NOT NULL,
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert random movies
INSERT INTO Movies (Title, Genre, Duration, release_date_at) VALUES
('Edge of Tomorrow', 'Sci-Fi', 113, '2014-06-06'),
('The Godfather', 'Crime', 175, '1972-03-24'),
('Inception', 'Action', 148, '2010-07-16'),
('Finding Nemo', 'Animation', 100, '2003-05-30'),
('The Dark Knight', 'Action', 152, '2008-07-18'),
('Parasite', 'Thriller', 132, '2019-05-30'),
('Avengers: Endgame', 'Superhero', 181, '2019-04-26'),
('The Notebook', 'Romance', 123, '2004-06-25'),
('Coco', 'Animation', 105, '2017-10-27'),
('Interstellar', 'Sci-Fi', 169, '2014-11-07');

-- Insert random theaters
INSERT INTO Theaters (Name, Location) VALUES
('Cinema 1', 'Downtown, City Center'),
('Cinema 2', 'Uptown Mall'),
('Cinema 3', 'Eastside Cinema Complex'),
('Cinema 4', 'Westend Cinemas'),
('Cinema 5', 'City Theater Hall');

-- Insert random shows (MovieID and TheaterID are referenced)
INSERT INTO Shows (MovieID, TheaterID, start_at) VALUES
(1, 1, '2025-05-15 19:00:00'),
(2, 1, '2025-05-15 21:30:00'),
(3, 2, '2025-05-16 18:00:00'),
(4, 3, '2025-05-16 20:00:00'),
(5, 2, '2025-05-17 17:30:00'),
(6, 4, '2025-05-17 19:45:00'),
(7, 3, '2025-05-18 16:00:00'),
(8, 4, '2025-05-18 20:30:00'),
(9, 5, '2025-05-19 18:30:00'),
(10, 5, '2025-05-19 21:00:00');


-- Insert seats for ShowID 1 to 5
-- Layout: Rows A-H, Seats 01-07, Price = 100000

-- ShowID 1
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(1, 'A01', 100000), (1, 'A02', 100000), (1, 'A03', 100000), (1, 'A04', 100000), (1, 'A05', 100000), (1, 'A06', 100000), (1, 'A07', 100000),
(1, 'B01', 100000), (1, 'B02', 100000), (1, 'B03', 100000), (1, 'B04', 100000), (1, 'B05', 100000), (1, 'B06', 100000), (1, 'B07', 100000),
(1, 'C01', 100000), (1, 'C02', 100000), (1, 'C03', 100000), (1, 'C04', 100000), (1, 'C05', 100000), (1, 'C06', 100000), (1, 'C07', 100000),
(1, 'D01', 100000), (1, 'D02', 100000), (1, 'D03', 100000), (1, 'D04', 100000), (1, 'D05', 100000), (1, 'D06', 100000), (1, 'D07', 100000),
(1, 'E01', 100000), (1, 'E02', 100000), (1, 'E03', 100000), (1, 'E04', 100000), (1, 'E05', 100000), (1, 'E06', 100000), (1, 'E07', 100000),
(1, 'F01', 100000), (1, 'F02', 100000), (1, 'F03', 100000), (1, 'F04', 100000), (1, 'F05', 100000), (1, 'F06', 100000), (1, 'F07', 100000),
(1, 'G01', 100000), (1, 'G02', 100000), (1, 'G03', 100000), (1, 'G04', 100000), (1, 'G05', 100000), (1, 'G06', 100000), (1, 'G07', 100000),
(1, 'H01', 100000), (1, 'H02', 100000), (1, 'H03', 100000), (1, 'H04', 100000), (1, 'H05', 100000), (1, 'H06', 100000), (1, 'H07', 100000);

-- ShowID 2
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(2, 'A01', 100000), (2, 'A02', 100000), (2, 'A03', 100000), (2, 'A04', 100000), (2, 'A05', 100000), (2, 'A06', 100000), (2, 'A07', 100000),
(2, 'B01', 100000), (2, 'B02', 100000), (2, 'B03', 100000), (2, 'B04', 100000), (2, 'B05', 100000), (2, 'B06', 100000), (2, 'B07', 100000),
(2, 'C01', 100000), (2, 'C02', 100000), (2, 'C03', 100000), (2, 'C04', 100000), (2, 'C05', 100000), (2, 'C06', 100000), (2, 'C07', 100000),
(2, 'D01', 100000), (2, 'D02', 100000), (2, 'D03', 100000), (2, 'D04', 100000), (2, 'D05', 100000), (2, 'D06', 100000), (2, 'D07', 100000),
(2, 'E01', 100000), (2, 'E02', 100000), (2, 'E03', 100000), (2, 'E04', 100000), (2, 'E05', 100000), (2, 'E06', 100000), (2, 'E07', 100000),
(2, 'F01', 100000), (2, 'F02', 100000), (2, 'F03', 100000), (2, 'F04', 100000), (2, 'F05', 100000), (2, 'F06', 100000), (2, 'F07', 100000),
(2, 'G01', 100000), (2, 'G02', 100000), (2, 'G03', 100000), (2, 'G04', 100000), (2, 'G05', 100000), (2, 'G06', 100000), (2, 'G07', 100000),
(2, 'H01', 100000), (2, 'H02', 100000), (2, 'H03', 100000), (2, 'H04', 100000), (2, 'H05', 100000), (2, 'H06', 100000), (2, 'H07', 100000);

-- ShowID 3
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(3, 'A01', 100000), (3, 'A02', 100000), (3, 'A03', 100000), (3, 'A04', 100000), (3, 'A05', 100000), (3, 'A06', 100000), (3, 'A07', 100000),
(3, 'B01', 100000), (3, 'B02', 100000), (3, 'B03', 100000), (3, 'B04', 100000), (3, 'B05', 100000), (3, 'B06', 100000), (3, 'B07', 100000),
(3, 'C01', 100000), (3, 'C02', 100000), (3, 'C03', 100000), (3, 'C04', 100000), (3, 'C05', 100000), (3, 'C06', 100000), (3, 'C07', 100000),
(3, 'D01', 100000), (3, 'D02', 100000), (3, 'D03', 100000), (3, 'D04', 100000), (3, 'D05', 100000), (3, 'D06', 100000), (3, 'D07', 100000),
(3, 'E01', 100000), (3, 'E02', 100000), (3, 'E03', 100000), (3, 'E04', 100000), (3, 'E05', 100000), (3, 'E06', 100000), (3, 'E07', 100000),
(3, 'F01', 100000), (3, 'F02', 100000), (3, 'F03', 100000), (3, 'F04', 100000), (3, 'F05', 100000), (3, 'F06', 100000), (3, 'F07', 100000),
(3, 'G01', 100000), (3, 'G02', 100000), (3, 'G03', 100000), (3, 'G04', 100000), (3, 'G05', 100000), (3, 'G06', 100000), (3, 'G07', 100000),
(3, 'H01', 100000), (3, 'H02', 100000), (3, 'H03', 100000), (3, 'H04', 100000), (3, 'H05', 100000), (3, 'H06', 100000), (3, 'H07', 100000);

-- ShowID 4
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(4, 'A01', 100000), (4, 'A02', 100000), (4, 'A03', 100000), (4, 'A04', 100000), (4, 'A05', 100000), (4, 'A06', 100000), (4, 'A07', 100000),
(4, 'B01', 100000), (4, 'B02', 100000), (4, 'B03', 100000), (4, 'B04', 100000), (4, 'B05', 100000), (4, 'B06', 100000), (4, 'B07', 100000),
(4, 'C01', 100000), (4, 'C02', 100000), (4, 'C03', 100000), (4, 'C04', 100000), (4, 'C05', 100000), (4, 'C06', 100000), (4, 'C07', 100000),
(4, 'D01', 100000), (4, 'D02', 100000), (4, 'D03', 100000), (4, 'D04', 100000), (4, 'D05', 100000), (4, 'D06', 100000), (4, 'D07', 100000),
(4, 'E01', 100000), (4, 'E02', 100000), (4, 'E03', 100000), (4, 'E04', 100000), (4, 'E05', 100000), (4, 'E06', 100000), (4, 'E07', 100000),
(4, 'F01', 100000), (4, 'F02', 100000), (4, 'F03', 100000), (4, 'F04', 100000), (4, 'F05', 100000), (4, 'F06', 100000), (4, 'F07', 100000),
(4, 'G01', 100000), (4, 'G02', 100000), (4, 'G03', 100000), (4, 'G04', 100000), (4, 'G05', 100000), (4, 'G06', 100000), (4, 'G07', 100000),
(4, 'H01', 100000), (4, 'H02', 100000), (4, 'H03', 100000), (4, 'H04', 100000), (4, 'H05', 100000), (4, 'H06', 100000), (4, 'H07', 100000);

-- ShowID 5
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(5, 'A01', 100000), (5, 'A02', 100000), (5, 'A03', 100000), (5, 'A04', 100000), (5, 'A05', 100000), (5, 'A06', 100000), (5, 'A07', 100000),
(5, 'B01', 100000), (5, 'B02', 100000), (5, 'B03', 100000), (5, 'B04', 100000), (5, 'B05', 100000), (5, 'B06', 100000), (5, 'B07', 100000),
(5, 'C01', 100000), (5, 'C02', 100000), (5, 'C03', 100000), (5, 'C04', 100000), (5, 'C05', 100000), (5, 'C06', 100000), (5, 'C07', 100000),
(5, 'D01', 100000), (5, 'D02', 100000), (5, 'D03', 100000), (5, 'D04', 100000), (5, 'D05', 100000), (5, 'D06', 100000), (5, 'D07', 100000),
(5, 'E01', 100000), (5, 'E02', 100000), (5, 'E03', 100000), (5, 'E04', 100000), (5, 'E05', 100000), (5, 'E06', 100000), (5, 'E07', 100000),
(5, 'F01', 100000), (5, 'F02', 100000), (5, 'F03', 100000), (5, 'F04', 100000), (5, 'F05', 100000), (5, 'F06', 100000), (5, 'F07', 100000),
(5, 'G01', 100000), (5, 'G02', 100000), (5, 'G03', 100000), (5, 'G04', 100000), (5, 'G05', 100000), (5, 'G06', 100000), (5, 'G07', 100000),
(5, 'H01', 100000), (5, 'H02', 100000), (5, 'H03', 100000), (5, 'H04', 100000), (5, 'H05', 100000), (5, 'H06', 100000), (5, 'H07', 100000);

-- ShowID 6
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(6, 'A01', 100000), (6, 'A02', 100000), (6, 'A03', 100000), (6, 'A04', 100000), (6, 'A05', 100000), (6, 'A06', 100000), (6, 'A07', 100000),
(6, 'B01', 100000), (6, 'B02', 100000), (6, 'B03', 100000), (6, 'B04', 100000), (6, 'B05', 100000), (6, 'B06', 100000), (6, 'B07', 100000),
(6, 'C01', 100000), (6, 'C02', 100000), (6, 'C03', 100000), (6, 'C04', 100000), (6, 'C05', 100000), (6, 'C06', 100000), (6, 'C07', 100000),
(6, 'D01', 100000), (6, 'D02', 100000), (6, 'D03', 100000), (6, 'D04', 100000), (6, 'D05', 100000), (6, 'D06', 100000), (6, 'D07', 100000),
(6, 'E01', 100000), (6, 'E02', 100000), (6, 'E03', 100000), (6, 'E04', 100000), (6, 'E05', 100000), (6, 'E06', 100000), (6, 'E07', 100000),
(6, 'F01', 100000), (6, 'F02', 100000), (6, 'F03', 100000), (6, 'F04', 100000), (6, 'F05', 100000), (6, 'F06', 100000), (6, 'F07', 100000),
(6, 'G01', 100000), (6, 'G02', 100000), (6, 'G03', 100000), (6, 'G04', 100000), (6, 'G05', 100000), (6, 'G06', 100000), (6, 'G07', 100000),
(6, 'H01', 100000), (6, 'H02', 100000), (6, 'H03', 100000), (6, 'H04', 100000), (6, 'H05', 100000), (6, 'H06', 100000), (6, 'H07', 100000);

-- ShowID 7
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(7, 'A01', 100000), (7, 'A02', 100000), (7, 'A03', 100000), (7, 'A04', 100000), (7, 'A05', 100000), (7, 'A06', 100000), (7, 'A07', 100000),
(7, 'B01', 100000), (7, 'B02', 100000), (7, 'B03', 100000), (7, 'B04', 100000), (7, 'B05', 100000), (7, 'B06', 100000), (7, 'B07', 100000),
(7, 'C01', 100000), (7, 'C02', 100000), (7, 'C03', 100000), (7, 'C04', 100000), (7, 'C05', 100000), (7, 'C06', 100000), (7, 'C07', 100000),
(7, 'D01', 100000), (7, 'D02', 100000), (7, 'D03', 100000), (7, 'D04', 100000), (7, 'D05', 100000), (7, 'D06', 100000), (7, 'D07', 100000),
(7, 'E01', 100000), (7, 'E02', 100000), (7, 'E03', 100000), (7, 'E04', 100000), (7, 'E05', 100000), (7, 'E06', 100000), (7, 'E07', 100000),
(7, 'F01', 100000), (7, 'F02', 100000), (7, 'F03', 100000), (7, 'F04', 100000), (7, 'F05', 100000), (7, 'F06', 100000), (7, 'F07', 100000),
(7, 'G01', 100000), (7, 'G02', 100000), (7, 'G03', 100000), (7, 'G04', 100000), (7, 'G05', 100000), (7, 'G06', 100000), (7, 'G07', 100000),
(7, 'H01', 100000), (7, 'H02', 100000), (7, 'H03', 100000), (7, 'H04', 100000), (7, 'H05', 100000), (7, 'H06', 100000), (7, 'H07', 100000);

-- ShowID 8
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(8, 'A01', 100000), (8, 'A02', 100000), (8, 'A03', 100000), (8, 'A04', 100000), (8, 'A05', 100000), (8, 'A06', 100000), (8, 'A07', 100000),
(8, 'B01', 100000), (8, 'B02', 100000), (8, 'B03', 100000), (8, 'B04', 100000), (8, 'B05', 100000), (8, 'B06', 100000), (8, 'B07', 100000),
(8, 'C01', 100000), (8, 'C02', 100000), (8, 'C03', 100000), (8, 'C04', 100000), (8, 'C05', 100000), (8, 'C06', 100000), (8, 'C07', 100000),
(8, 'D01', 100000), (8, 'D02', 100000), (8, 'D03', 100000), (8, 'D04', 100000), (8, 'D05', 100000), (8, 'D06', 100000), (8, 'D07', 100000),
(8, 'E01', 100000), (8, 'E02', 100000), (8, 'E03', 100000), (8, 'E04', 100000), (8, 'E05', 100000), (8, 'E06', 100000), (8, 'E07', 100000),
(8, 'F01', 100000), (8, 'F02', 100000), (8, 'F03', 100000), (8, 'F04', 100000), (8, 'F05', 100000), (8, 'F06', 100000), (8, 'F07', 100000),
(8, 'G01', 100000), (8, 'G02', 100000), (8, 'G03', 100000), (8, 'G04', 100000), (8, 'G05', 100000), (8, 'G06', 100000), (8, 'G07', 100000),
(8, 'H01', 100000), (8, 'H02', 100000), (8, 'H03', 100000), (8, 'H04', 100000), (8, 'H05', 100000), (8, 'H06', 100000), (8, 'H07', 100000);

-- ShowID 9
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(9, 'A01', 100000), (9, 'A02', 100000), (9, 'A03', 100000), (9, 'A04', 100000), (9, 'A05', 100000), (9, 'A06', 100000), (9, 'A07', 100000),
(9, 'B01', 100000), (9, 'B02', 100000), (9, 'B03', 100000), (9, 'B04', 100000), (9, 'B05', 100000), (9, 'B06', 100000), (9, 'B07', 100000),
(9, 'C01', 100000), (9, 'C02', 100000), (9, 'C03', 100000), (9, 'C04', 100000), (9, 'C05', 100000), (9, 'C06', 100000), (9, 'C07', 100000),
(9, 'D01', 100000), (9, 'D02', 100000), (9, 'D03', 100000), (9, 'D04', 100000), (9, 'D05', 100000), (9, 'D06', 100000), (9, 'D07', 100000),
(9, 'E01', 100000), (9, 'E02', 100000), (9, 'E03', 100000), (9, 'E04', 100000), (9, 'E05', 100000), (9, 'E06', 100000), (9, 'E07', 100000),
(9, 'F01', 100000), (9, 'F02', 100000), (9, 'F03', 100000), (9, 'F04', 100000), (9, 'F05', 100000), (9, 'F06', 100000), (9, 'F07', 100000),
(9, 'G01', 100000), (9, 'G02', 100000), (9, 'G03', 100000), (9, 'G04', 100000), (9, 'G05', 100000), (9, 'G06', 100000), (9, 'G07', 100000),
(9, 'H01', 100000), (9, 'H02', 100000), (9, 'H03', 100000), (9, 'H04', 100000), (9, 'H05', 100000), (9, 'H06', 100000), (9, 'H07', 100000);

-- ShowID 10
INSERT INTO Seats (ShowID, SeatNumber, price) VALUES
(10, 'A01', 100000), (10, 'A02', 100000), (10, 'A03', 100000), (10, 'A04', 100000), (10, 'A05', 100000), (10, 'A06', 100000), (10, 'A07', 100000),
(10, 'B01', 100000), (10, 'B02', 100000), (10, 'B03', 100000), (10, 'B04', 100000), (10, 'B05', 100000), (10, 'B06', 100000), (10, 'B07', 100000),
(10, 'C01', 100000), (10, 'C02', 100000), (10, 'C03', 100000), (10, 'C04', 100000), (10, 'C05', 100000), (10, 'C06', 100000), (10, 'C07', 100000),
(10, 'D01', 100000), (10, 'D02', 100000), (10, 'D03', 100000), (10, 'D04', 100000), (10, 'D05', 100000), (10, 'D06', 100000), (10, 'D07', 100000),
(10, 'E01', 100000), (10, 'E02', 100000), (10, 'E03', 100000), (10, 'E04', 100000), (10, 'E05', 100000), (10, 'E06', 100000), (10, 'E07', 100000),
(10, 'F01', 100000), (10, 'F02', 100000), (10, 'F03', 100000), (10, 'F04', 100000), (10, 'F05', 100000), (10, 'F06', 100000), (10, 'F07', 100000),
(10, 'G01', 100000), (10, 'G02', 100000), (10, 'G03', 100000), (10, 'G04', 100000), (10, 'G05', 100000), (10, 'G06', 100000), (10, 'G07', 100000),
(10, 'H01', 100000), (10, 'H02', 100000), (10, 'H03', 100000), (10, 'H04', 100000), (10, 'H05', 100000), (10, 'H06', 100000), (10, 'H07', 100000);

-- Insert random users
INSERT INTO Users (fullname, email, username, password, role_name) VALUES
('The Huy', 'huy@example.com', 'huy', '123', 'admin'),
('Gia Tuan', 'tuan@example.com', 'tuan', '123', 'admin'),
('Thai Duy', 'duy@example.com', 'duy', '123', 'admin'),
('Phuc Nhan', 'nhan@example.com', 'nhan', '123', 'admin'),
('Ngoc Bich', 'bich@example.com', 'bich', '123', 'customer'),
('Anh Thu', 'thuw@example.com', 'thuw', '123', 'customer'),
('Thanh Chung', 'chung@example.com', 'chung', '123', 'customer'),
('Anh Hao', 'haolu@example.com', 'haolu', '123', 'customer'),
('Tri Hao', 'haocon@example.com', 'trihao', '123', 'customer'),
('Tan Phat', 'pat@example.com', 'pat', '123', 'customer'),
('Van Sac', 'sac@example.com', 'sac', '123', 'customer'),
('Thanh Son', 'son@example.com', 'son', '123', 'customer');


-- Insert random product
INSERT INTO Products (product_name, price, discount, stock) VALUES
('Popcorn Combo', 50000, 10, 100),
('Coke Large', 30000, 0, 200),
('Nachos with Cheese', 60000, 15, 80),
('Sprite Medium', 25000, 0, 150),
('Hotdog', 45000, 5, 120),
('Caramel Popcorn', 55000, 10, 90),
('Iced Tea', 28000, 0, 140),
('Cheese Popcorn', 53000, 12, 110),
('Pepsi Can', 20000, 0, 300),
('Family Combo (2 drinks + popcorn)', 95000, 20, 50);

-- Insert random tickets (show, user, and seat references)
INSERT INTO Tickets (ShowID, UserID, SeatID, MovieID, TheaterID) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 1),
(3, 3, 3, 3, 2),
(4, 4, 4, 4, 3),
(5, 5, 5, 5, 2),
(6, 6, 6, 6, 4),
(7, 7, 7, 7, 3),
(8, 8, 8, 8, 4),
(9, 9, 9, 9, 5),
(10, 10, 10, 10, 5),
(1, 1, 11, 1, 1),
(2, 2, 12, 2, 2),
(3, 3, 13, 3, 3),
(4, 4, 14, 4, 4),
(5, 5, 15, 5, 5),
(6, 6, 16, 6, 1),
(7, 7, 17, 7, 2),
(8, 8, 18, 8, 3),
(9, 9, 19, 9, 4),
(10, 10, 20, 10, 5),
(1, 11, 21, 1, 1),
(2, 12, 22, 2, 2),
(3, 1, 23, 3, 3),
(4, 2, 24, 4, 4),
(5, 3, 25, 5, 5);

-- Insert random ticket_detail
INSERT INTO ticket_details (TicketID, ProductID, price, discount, quantity, total_price) VALUES
(1, 1, 50000, 10, 1, 45000),
(2, 2, 30000, 0, 2, 60000),
(3, 3, 60000, 15, 1, 51000),
(4, 4, 25000, 0, 1, 25000),
(5, 5, 45000, 5, 1, 42750),
(6, 6, 55000, 10, 2, 99000),
(7, 7, 28000, 0, 1, 28000),
(8, 8, 53000, 12, 1, 46640),
(9, 9, 20000, 0, 2, 40000),
(10, 10, 95000, 20, 1, 76000);