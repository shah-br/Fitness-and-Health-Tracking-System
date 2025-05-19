USE FitnessDB;
GO

-- 1. Validate Data in Dimension and Transactional Tables
SELECT TOP 10 * FROM Users;
SELECT TOP 10 * FROM Trainers;
SELECT TOP 10 * FROM User_Trainer_Assignment;
SELECT TOP 10 * FROM Workout;
SELECT TOP 10 * FROM Meals;
SELECT TOP 10 * FROM HealthMetrics;
SELECT TOP 10 * FROM SleepTracking;
SELECT TOP 10 * FROM Goals;
SELECT TOP 10 * FROM Recommendations;

-- 2. Validate Views
SELECT * FROM vw_UserWorkoutSummary;
SELECT * FROM vw_TrainerAssignments;
SELECT * FROM vw_HealthGoalProgress;

-- 3. Validate Trigger (Audit Log Test)
-- Insert, Update, Delete a dummy Trainer
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Trigger Tester', 'Strength', 'trigger_test@example.com');
UPDATE Trainers SET Specialization = 'Cardio' WHERE TrainerName = 'Trigger Tester';
DELETE FROM Trainers WHERE TrainerName = 'Trigger Tester';

-- Check audit table
SELECT * FROM Trainers_Audit WHERE TrainerName = 'Trigger Tester';

-- 4. Validate Stored Procedure
EXEC sp_GetUserWorkoutStats @UserID = 100000;

-- 5. Validate Scalar UDF
SELECT dbo.fn_GetUserAge(100000) AS UserAge;

-- 6. Validate Cursor Output
EXEC cur_GoalReminder;
