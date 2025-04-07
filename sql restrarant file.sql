CREATE DATABASE Restaurantid_db;
USE Restaurantid_db;

-- Table: Cuisines
CREATE TABLE Cuisines (
    Cuisine_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cuisine_Type VARCHAR(255) UNIQUE NOT NULL,
    Count INT,
    Percentage FLOAT
);

INSERT INTO Cuisines (Cuisine_Type, Count, Percentage)
VALUES 
    ('North Indian', 936, 9.803100),
    ('North Indian, Chinese', 511, 5.351906),
    ('Chinese', 354, 3.707583);

-- Table: Cities
CREATE TABLE Cities (
    City_ID INT PRIMARY KEY AUTO_INCREMENT,
    City VARCHAR(255) UNIQUE NOT NULL,
    Number_of_Restaurants INT,
    Average_Rating FLOAT
);

INSERT INTO Cities (City, Number_of_Restaurants, Average_Rating)
VALUES 
    ('New Delhi', NULL, NULL),
    ('Abu Dhabi', NULL, 4.300000),
    ('Agra', NULL, 3.965000),
    ('Ahmedabad', NULL, 4.161905),
    ('Albany', NULL, 3.555000);

-- Table: Restaurants (Main Table)
CREATE TABLE Restaurants (
    Restaurant_ID INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_Name VARCHAR(255),
    City_ID INT,
    Cuisine_ID INT,
    Price_Range INT,
    Has_Online_Delivery BOOLEAN,
    Aggregate_Rating FLOAT,
    Votes INT,
    FOREIGN KEY (City_ID) REFERENCES Cities(City_ID) ON DELETE CASCADE,
    FOREIGN KEY (Cuisine_ID) REFERENCES Cuisines(Cuisine_ID) ON DELETE CASCADE
);

-- Table: Price Range Distribution
CREATE TABLE Price_Range_Distribution (
    Price_Range INT PRIMARY KEY,
    Number_of_Restaurants INT
);

INSERT INTO Price_Range_Distribution (Price_Range, Number_of_Restaurants)
VALUES 
    (1, 4500),
    (2, 3200),
    (3, 1800),
    (4, 900);

-- Table: Online Delivery Stats
CREATE TABLE Online_Delivery_Stats (
    Has_Online_Delivery BOOLEAN PRIMARY KEY,
    Percentage_of_Restaurants FLOAT,
    Average_Rating FLOAT
);

INSERT INTO Online_Delivery_Stats (Has_Online_Delivery, Percentage_of_Restaurants, Average_Rating)
VALUES 
    (FALSE, 74.329703, 3.467453),
    (TRUE, 25.670297, 3.381274);

-- Table: Aggregate Rating Distribution
CREATE TABLE Aggregate_Rating_Distribution (
    Aggregate_Rating FLOAT PRIMARY KEY,
    Number_of_Restaurants INT
);

INSERT INTO Aggregate_Rating_Distribution (Aggregate_Rating, Number_of_Restaurants)
VALUES 
    (1.8, 50),
    (2.2, 150),
    (2.6, 600),
    (3.0, 1200),
    (3.2, 1500);

-- Table: Restaurant Votes
CREATE TABLE Restaurant_Votes (
    Metric VARCHAR(255) PRIMARY KEY,
    Value FLOAT
);

INSERT INTO Restaurant_Votes (Metric, Value)
VALUES 
    ('Average Votes', 156.78);

-- Table: Restaurant Locations
CREATE TABLE Restaurant_Locations (
    Restaurant_ID INT PRIMARY KEY,
    Latitude FLOAT,
    Longitude FLOAT,
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID) ON DELETE CASCADE
);

INSERT INTO Restaurant_Locations (Restaurant_ID, Latitude, Longitude)
VALUES 
    (1, 10.5, 75.3),
    (2, 22.7, 88.4),
    (3, 35.2, 120.9),
    (4, 40.7, 74.0);

-- Table: Restaurant Clusters
CREATE TABLE Restaurant_Clusters (
    Cluster_ID INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_ID INT,
    Latitude FLOAT,
    Longitude FLOAT,
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID) ON DELETE CASCADE
);

INSERT INTO Restaurant_Clusters (Restaurant_ID, Latitude, Longitude)
VALUES 
    (1, 10.5, 75.3),
    (2, 22.7, 88.4),
    (3, 35.2, 120.9),
    (4, 40.7, 74.0);

-- Table: Restaurant Chains
CREATE TABLE Restaurant_Chains (
    Restaurant_ID INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_Name VARCHAR(255) UNIQUE NOT NULL,
    Number_of_Locations INT
);

INSERT INTO Restaurant_Chains (Restaurant_Name, Number_of_Locations)
VALUES 
    ('Cafe Coffee Day', 83),
    ('Domino''s Pizza', 79),
    ('Subway', 63),
    ('Green Chick Chop', 51),
    ('McDonald''s', 48);

-- Table: Restaurant Chain Analysis
CREATE TABLE Restaurant_Chain_Analysis (
    Restaurant_ID INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_Name VARCHAR(255) UNIQUE NOT NULL,
    Average_Rating FLOAT,
    Total_Votes INT
);

INSERT INTO Restaurant_Chain_Analysis (Restaurant_Name, Average_Rating, Total_Votes)
VALUES 
    ('Talaga Sampireun', 4.900, 5514),
    ('Silantro FilMex', 4.850, 1364),
    ('AB''s Absolute Barbecues', 4.850, 3151),
    ('AB''s Absolute Barbecues', 4.825, 13400),
    ('Naturals Ice Cream', 4.800, 3094);