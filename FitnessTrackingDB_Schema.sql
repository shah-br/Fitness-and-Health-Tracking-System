
USE MASTER
-- DROP, CREATE AND USE DATABASE
GO

-- Force disconnect all users
IF DB_ID('FitnessDB') IS NOT NULL
BEGIN
    ALTER DATABASE FitnessDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FitnessDB;
END
GO

CREATE DATABASE FitnessDB
GO

USE FitnessDB
GO


IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL 
  DROP TABLE dbo.Users; 

IF OBJECT_ID('dbo.Trainers', 'U') IS NOT NULL 
  DROP TABLE dbo.Trainers; 

IF OBJECT_ID('dbo.User_Trainer_Assignment', 'U') IS NOT NULL 
  DROP TABLE dbo.User_Trainer_Assignment; 
  
IF OBJECT_ID('dbo.Workout', 'U') IS NOT NULL 
  DROP TABLE dbo.Workout; 

IF OBJECT_ID('dbo.Meals', 'U') IS NOT NULL 
  DROP TABLE dbo.Meals;

IF OBJECT_ID('dbo.HealthMetrics', 'U') IS NOT NULL 
  DROP TABLE dbo.HealthMetrics; 

IF OBJECT_ID('dbo.SleepTracking', 'U') IS NOT NULL 
  DROP TABLE dbo.SleepTracking; 

IF OBJECT_ID('dbo.Goals', 'U') IS NOT NULL 
  DROP TABLE dbo.Goals; 

IF OBJECT_ID('dbo.Recommendations', 'U') IS NOT NULL 
  DROP TABLE dbo.Recommendations;


-- Users table
CREATE TABLE Users (
    UserID INT IDENTITY(100000,1) PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Other')),
    DateofBirth DATE NOT NULL,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- Trainers table
CREATE TABLE Trainers (
    TrainerID INT IDENTITY(100,1) PRIMARY KEY,
    TrainerName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Email VARCHAR(100) UNIQUE NOT NULL
);


-- User_Trainer_Assignment table
CREATE TABLE User_Trainer_Assignment (
    AssignmentID INT IDENTITY(10000,1) PRIMARY KEY,
    UserID INT NOT NULL,
    TrainerID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_TrainerID FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID),
	UNIQUE (UserID, TrainerID)
);

-- Workout table
CREATE TABLE Workout (
    WorkoutID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    WorkoutType VARCHAR(50) NOT NULL,
    Duration INT CHECK (Duration > 0),
    CaloriesBurned INT CHECK (CaloriesBurned >= 0),
    WorkoutDate DATE NOT NULL,
    CONSTRAINT FK_UserID1 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Meals table
CREATE TABLE Meals (
    MealId INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    MealType VARCHAR(10) CHECK (MealType IN ('Breakfast', 'Lunch', 'Dinner', 'Snack')),
    Calories INT CHECK (Calories >= 0),
    ProteinsGrams FLOAT CHECK (ProteinsGrams >= 0),
    CarbsGrams FLOAT CHECK (CarbsGrams >= 0),
    FatGrams FLOAT CHECK (FatGrams >= 0),
    MealDate DATE NOT NULL,
    CONSTRAINT FK_UserID2 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- HealthMetrics table
CREATE TABLE HealthMetrics (
    MetricID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    WeightKg FLOAT CHECK (WeightKg > 0),
    BMI FLOAT CHECK (BMI > 0),
    HeartRate INT CHECK (HeartRate BETWEEN 40 AND 200),
    RecordDate DATE NOT NULL,
    CONSTRAINT FK_UserID3 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- SleepTracking table
CREATE TABLE SleepTracking (
    SleepID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    HoursSlept FLOAT CHECK (HoursSlept BETWEEN 0 AND 24),
    SleepQuality VARCHAR(10) CHECK (SleepQuality IN ('Poor', 'Fair', 'Good', 'Excellent')),
    SleepDate DATE NOT NULL,
    CONSTRAINT FK_UserID4 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Goals table
CREATE TABLE Goals (
    GoalID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    GoalType VARCHAR(100) NOT NULL,
    TargetValue FLOAT NOT NULL,
    CurrentValue FLOAT NOT NULL,
    DeadlineDate DATE NOT NULL,
    CONSTRAINT FK_UserID5 FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Recommendations table
CREATE TABLE Recommendations (
    RecommendationID INT IDENTITY(1,1) PRIMARY KEY,
    TrainerID INT NOT NULL,
    UserID INT NOT NULL,
    Recommendation TEXT NOT NULL,
    RecommendationType VARCHAR(10) CHECK (RecommendationType IN ('Workout', 'Diet', 'Lifestyle')),
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_TrainerID1 FOREIGN KEY (UserID, TrainerID) REFERENCES User_Trainer_Assignment(UserID, TrainerID)
);

SELECT * FROM Users;
SELECT * FROM Trainers;
SELECT * FROM User_Trainer_Assignment;
SELECT * FROM Workout;
SELECT * FROM Meals;
SELECT * FROM HealthMetrics;
SELECT * FROM SleepTracking;
SELECT * FROM Goals;
SELECT * FROM Recommendations;
