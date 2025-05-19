
USE FitnessDB;
GO

INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Mia Williams', 'mia181@example.com', 'Male', '2013-08-05');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Olivia Williams', 'olivia755@example.com', 'Male', '2014-03-30');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Sophia Wilson', 'sophia865@example.com', 'Male', '1999-05-24');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Mia Garcia', 'mia464@example.com', 'Other', '2008-09-29');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Olivia Martinez', 'olivia573@example.com', 'Other', '1999-12-14');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Daniel Garcia', 'daniel102@example.com', 'Other', '2010-11-01');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Sophia Miller', 'sophia623@example.com', 'Male', '2011-09-02');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Daniel Smith', 'daniel518@example.com', 'Male', '2005-03-12');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('Daniel Johnson', 'daniel474@example.com', 'Other', '2010-07-26');
INSERT INTO Users (UserName, Email, Gender, DateofBirth) VALUES ('David Wilson', 'david985@example.com', 'Other', '2009-02-02');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Michael Garcia', 'Yoga', 'michael990@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('James Williams', 'Strength', 'james754@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('David Brown', 'Strength', 'david433@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Mia Williams', 'Cardio', 'mia671@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Olivia Wilson', 'Strength', 'olivia294@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('John Smith', 'Yoga', 'john145@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('John Miller', 'Strength', 'john248@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Mia Johnson', 'Strength', 'mia241@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Sophia Wilson', 'Yoga', 'sophia721@trainers.com');
INSERT INTO Trainers (TrainerName, Specialization, Email) VALUES ('Sophia Jones', 'Pilates', 'sophia616@trainers.com');

-- Insert 10 Unique User-Trainer Assignments
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100000, 100, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100001, 101, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100002, 102, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100003, 103, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100004, 104, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100005, 105, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100006, 106, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100007, 107, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100008, 108, '2024-01-01');
INSERT INTO User_Trainer_Assignment (UserID, TrainerID, StartDate) VALUES (100009, 109, '2024-01-01');

-- Insert into Transactional Tables for Existing 10 Pairs

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100000, 'Cycling', 64, 289, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100000, 'Lunch', 637, 46.65, 48.71, 13.58, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100000, 85.2, 23.6, 69, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100000, 4.4, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100000, 'Weight Loss', 11.4, 1.2, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (100, 100000, 'Focus on flexibility this week.', 'Workout');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100001, 'Cycling', 30, 666, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100001, 'Breakfast', 488, 40.69, 81.01, 12.14, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100001, 82.7, 29.5, 100, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100001, 8.7, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100001, 'Cardio Fitness', 15.7, 4.6, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (101, 100001, 'Focus on flexibility this week.', 'Lifestyle');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100002, 'HIIT', 61, 254, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100002, 'Snack', 742, 42.59, 70.85, 26.84, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100002, 83.0, 22.8, 96, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100002, 4.9, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100002, 'Muscle Gain', 23.7, 6.1, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (102, 100002, 'Focus on cardio this week.', 'Workout');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100003, 'HIIT', 37, 482, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100003, 'Snack', 564, 35.36, 51.08, 22.34, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100003, 75.7, 18.3, 91, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100003, 7.6, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100003, 'Weight Loss', 30.0, 4.7, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (103, 100003, 'Focus on flexibility this week.', 'Lifestyle');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100004, 'Cycling', 42, 439, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100004, 'Breakfast', 718, 21.07, 76.13, 18.19, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100004, 60.6, 25.9, 61, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100004, 4.5, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100004, 'Cardio Fitness', 27.6, 8.7, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (104, 100004, 'Focus on flexibility this week.', 'Lifestyle');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100005, 'Running', 56, 435, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100005, 'Dinner', 726, 25.51, 49.25, 21.08, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100005, 61.5, 25.4, 85, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100005, 4.8, 'Fair', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100005, 'Muscle Gain', 22.5, 5.4, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (105, 100005, 'Focus on strength this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100006, 'Yoga', 49, 519, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100006, 'Snack', 529, 24.48, 40.33, 18.71, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100006, 69.6, 23.8, 60, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100006, 7.9, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100006, 'Muscle Gain', 10.3, 4.2, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (106, 100006, 'Focus on cardio this week.', 'Workout');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100007, 'Cycling', 47, 274, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100007, 'Breakfast', 319, 23.64, 70.6, 11.43, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100007, 70.0, 24.5, 72, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100007, 5.5, 'Good', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100007, 'Weight Loss', 17.4, 1.3, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (107, 100007, 'Focus on strength this week.', 'Workout');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100008, 'Running', 69, 516, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100008, 'Dinner', 676, 33.06, 98.23, 11.45, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100008, 69.0, 26.1, 89, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100008, 8.8, 'Excellent', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100008, 'Muscle Gain', 27.5, 2.4, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (108, 100008, 'Focus on strength this week.', 'Lifestyle');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100009, 'HIIT', 39, 307, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100009, 'Lunch', 792, 40.06, 64.06, 26.41, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100009, 81.2, 23.0, 64, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100009, 6.3, 'Excellent', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100009, 'Weight Loss', 21.8, 7.7, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (109, 100009, 'Focus on cardio this week.', 'Workout');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100000, 'Cycling', 78, 304, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100000, 'Lunch', 745, 29.87, 77.95, 15.6, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100000, 83.9, 21.3, 94, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100000, 8.7, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100000, 'Cardio Fitness', 19.4, 8.7, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (100, 100000, 'Focus on strength this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100001, 'Running', 65, 587, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100001, 'Breakfast', 739, 24.96, 76.68, 22.71, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100001, 85.2, 21.0, 79, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100001, 7.7, 'Fair', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100001, 'Muscle Gain', 21.4, 4.0, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (101, 100001, 'Focus on strength this week.', 'Workout');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100002, 'Running', 68, 400, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100002, 'Snack', 435, 40.8, 54.99, 21.52, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100002, 74.2, 20.1, 90, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100002, 5.1, 'Fair', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100002, 'Cardio Fitness', 19.7, 9.6, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (102, 100002, 'Focus on strength this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100003, 'HIIT', 51, 340, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100003, 'Lunch', 462, 24.55, 91.11, 18.93, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100003, 66.5, 22.0, 93, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100003, 8.0, 'Fair', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100003, 'Weight Loss', 25.7, 4.2, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (103, 100003, 'Focus on cardio this week.', 'Lifestyle');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100004, 'Yoga', 30, 391, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100004, 'Lunch', 453, 37.03, 98.11, 22.83, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100004, 64.8, 28.0, 70, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100004, 8.3, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100004, 'Muscle Gain', 26.1, 8.3, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (104, 100004, 'Focus on flexibility this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100005, 'Cycling', 61, 620, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100005, 'Snack', 368, 42.2, 49.84, 23.54, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100005, 65.5, 26.4, 93, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100005, 7.1, 'Fair', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100005, 'Cardio Fitness', 15.0, 3.2, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (105, 100005, 'Focus on strength this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100006, 'Running', 46, 478, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100006, 'Breakfast', 581, 25.82, 76.64, 18.5, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100006, 61.1, 27.3, 68, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100006, 6.3, 'Fair', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100006, 'Weight Loss', 16.2, 9.0, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (106, 100006, 'Focus on flexibility this week.', 'Lifestyle');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100007, 'Running', 53, 314, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100007, 'Breakfast', 498, 25.49, 53.3, 28.34, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100007, 70.7, 21.4, 66, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100007, 5.7, 'Poor', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100007, 'Muscle Gain', 16.0, 5.4, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (107, 100007, 'Focus on cardio this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100008, 'Running', 30, 340, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100008, 'Breakfast', 530, 23.01, 66.09, 13.62, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100008, 60.1, 25.3, 100, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100008, 7.5, 'Excellent', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100008, 'Weight Loss', 27.8, 7.7, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (108, 100008, 'Focus on strength this week.', 'Diet');

INSERT INTO Workout (UserID, WorkoutType, Duration, CaloriesBurned, WorkoutDate) VALUES (100009, 'HIIT', 56, 258, '2025-05-01');
INSERT INTO Meals (UserID, MealType, Calories, ProteinsGrams, CarbsGrams, FatGrams, MealDate) VALUES (100009, 'Lunch', 472, 27.77, 40.57, 22.59, '2025-05-01');
INSERT INTO HealthMetrics (UserID, WeightKg, BMI, HeartRate, RecordDate) VALUES (100009, 87.1, 19.3, 74, '2025-05-01');
INSERT INTO SleepTracking (UserID, HoursSlept, SleepQuality, SleepDate) VALUES (100009, 6.1, 'Good', '2025-05-01');
INSERT INTO Goals (UserID, GoalType, TargetValue, CurrentValue, DeadlineDate) VALUES (100009, 'Weight Loss', 23.4, 7.5, '2024-12-31');
INSERT INTO Recommendations (TrainerID, UserID, Recommendation, RecommendationType) VALUES (109, 100009, 'Focus on strength this week.', 'Diet');
