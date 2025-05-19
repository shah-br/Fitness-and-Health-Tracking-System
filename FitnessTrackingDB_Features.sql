
USE FitnessDB;
GO

--------------------------
-- A. VIEWS
--------------------------

-- Drop views if exist
IF OBJECT_ID('vw_UserWorkoutSummary', 'V') IS NOT NULL DROP VIEW vw_UserWorkoutSummary;
IF OBJECT_ID('vw_TrainerAssignments', 'V') IS NOT NULL DROP VIEW vw_TrainerAssignments;
IF OBJECT_ID('vw_HealthGoalProgress', 'V') IS NOT NULL DROP VIEW vw_HealthGoalProgress;
GO

-- View 1: Summary of total workout duration and calories per user (restricted to last 1 month)
CREATE VIEW vw_UserWorkoutSummary AS
SELECT 
    U.UserID,
    U.UserName,
    COUNT(W.WorkoutID) AS WorkoutCount,
    SUM(W.Duration) AS TotalDuration,
    SUM(W.CaloriesBurned) AS TotalCalories
FROM Users U
JOIN Workout W ON U.UserID = W.UserID
WHERE W.WorkoutDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY U.UserID, U.UserName;
GO

-- View 2: List of all trainer-user assignments (restricted to only ongoing assignments)
CREATE VIEW vw_TrainerAssignments AS
SELECT 
    T.TrainerName,
    U.UserName,
    A.StartDate,
    A.EndDate
FROM User_Trainer_Assignment A
JOIN Users U ON A.UserID = U.UserID
JOIN Trainers T ON A.TrainerID = T.TrainerID
WHERE A.EndDate IS NULL;  -- 
GO

-- View 3: User goal progress (restricted to incomplete goals)
CREATE VIEW vw_HealthGoalProgress AS
SELECT 
    U.UserName,
    G.GoalType,
    G.TargetValue,
    G.CurrentValue,
    ROUND((G.CurrentValue / G.TargetValue) * 100, 2) AS ProgressPercentage
FROM Goals G
JOIN Users U ON G.UserID = U.UserID
WHERE G.CurrentValue < G.TargetValue; 
GO


--------------------------
-- B. AUDIT TABLE + TRIGGER
--------------------------

-- Drop audit table and trigger if exist
IF OBJECT_ID('Trainers_Audit', 'U') IS NOT NULL DROP TABLE Trainers_Audit;
IF OBJECT_ID('trg_Trainers_Audit', 'TR') IS NOT NULL DROP TRIGGER trg_Trainers_Audit;
GO

-- Audit table for Trainers
CREATE TABLE Trainers_Audit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TrainerID INT,
    TrainerName VARCHAR(100),
    Specialization VARCHAR(100),
    Email VARCHAR(100),
    ActionType VARCHAR(10),
    ActionTime DATETIME DEFAULT GETDATE()
);
GO

-- Trigger for INSERT, UPDATE, DELETE on Trainers
CREATE TRIGGER trg_Trainers_Audit
ON Trainers
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Inserted rows
    INSERT INTO Trainers_Audit (TrainerID, TrainerName, Specialization, Email, ActionType)
    SELECT TrainerID, TrainerName, Specialization, Email, 'INSERT'
    FROM inserted;

    -- Deleted rows
    INSERT INTO Trainers_Audit (TrainerID, TrainerName, Specialization, Email, ActionType)
    SELECT TrainerID, TrainerName, Specialization, Email, 'DELETE'
    FROM deleted;

    -- For updates, log as 'UPDATE'
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Trainers_Audit (TrainerID, TrainerName, Specialization, Email, ActionType)
        SELECT TrainerID, TrainerName, Specialization, Email, 'UPDATE'
        FROM inserted;
    END
END;
GO


--------------------------
-- C. STORED PROCEDURE + UDF
--------------------------

-- Drop if exists
IF OBJECT_ID('sp_GetUserWorkoutStats', 'P') IS NOT NULL DROP PROCEDURE sp_GetUserWorkoutStats;
IF OBJECT_ID('fn_GetUserAge', 'FN') IS NOT NULL DROP FUNCTION fn_GetUserAge;
GO

-- Stored Procedure: Get workout stats by user
CREATE PROCEDURE sp_GetUserWorkoutStats
    @UserID INT
AS
BEGIN
    SELECT 
        COUNT(*) AS TotalWorkouts,
        SUM(Duration) AS TotalDuration,
        SUM(CaloriesBurned) AS TotalCalories
    FROM Workout
    WHERE UserID = @UserID;
END;
GO

-- Scalar UDF: Get age of a user
CREATE FUNCTION fn_GetUserAge(@UserID INT)
RETURNS INT
AS
BEGIN
    DECLARE @age INT;
    SELECT @age = DATEDIFF(YEAR, DateofBirth, GETDATE()) FROM Users WHERE UserID = @UserID;
    RETURN @age;
END;
GO


--------------------------
-- D. CURSOR
--------------------------

-- Drop if exists
IF OBJECT_ID('cur_GoalReminder', 'P') IS NOT NULL DROP PROCEDURE cur_GoalReminder;
GO

-- Cursor procedure: Go through goals and print reminders
CREATE PROCEDURE cur_GoalReminder
AS
BEGIN
    DECLARE @UserName VARCHAR(100), @GoalType VARCHAR(100), @Progress FLOAT;

    DECLARE goal_cursor CURSOR FOR
    SELECT U.UserName, G.GoalType, (G.CurrentValue / G.TargetValue) * 100.0
    FROM Goals G
    JOIN Users U ON G.UserID = U.UserID;

    OPEN goal_cursor;
    FETCH NEXT FROM goal_cursor INTO @UserName, @GoalType, @Progress;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @UserName + ' has completed ' + CAST(@Progress AS VARCHAR(10)) + '% of goal: ' + @GoalType;
        FETCH NEXT FROM goal_cursor INTO @UserName, @GoalType, @Progress;
    END

    CLOSE goal_cursor;
    DEALLOCATE goal_cursor;
END;
GO

