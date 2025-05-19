# Fitness and Health Tracking System

A comprehensive SQL Server-based database project designed for monitoring user fitness and health activities. Built as part of a graduate-level coursework, this project covers schema creation, data population, advanced queries, triggers, views, stored procedures, functions, and cursors.

## 👨‍💻 Authors
- Bhavya Rajesh Shah

## 🛠️ Technology Stack
- Microsoft SQL Server 2022 RTM
- Structured Query Language (SQL)

## 📁 Project Structure
1. **Schema Definition**: `FitnessTrackingDB_Schema.sql` – Contains scripts to drop, create, and structure all the necessary tables.
2. **Data Insertion**: `FitnessTrackingDB_InsertScript.sql` – Populates the database with sample user, trainer, and transactional data.
3. **Advanced Features**: `FitnessTrackingDB_Features.sql` – Implements views, a trigger-based audit log, stored procedure, scalar UDF, and a cursor.
4. **Validation Script**: `FitnessTrackingDB_ValidationTestScript.sql` – Validates all components, including queries for views, procedures, and audit logs.

## 🧱 Tables
- `Users`, `Trainers`, `User_Trainer_Assignment`
- `Workout`, `Meals`, `HealthMetrics`, `SleepTracking`, `Goals`, `Recommendations`
- `Trainers_Audit` (for logging changes via trigger)

## 📊 Views
- `vw_UserWorkoutSummary`: Aggregated workout data per user.
- `vw_TrainerAssignments`: Current active trainer-user assignments.
- `vw_HealthGoalProgress`: Tracks goal completion percentages.

## 🔁 Triggers & Audit
- Trigger `trg_Trainers_Audit` captures all insert, update, and delete operations on `Trainers` table.

## ⚙️ Procedures & Functions
- `sp_GetUserWorkoutStats`: Returns total workouts, duration, and calories burned for a user.
- `fn_GetUserAge`: Scalar function that returns a user’s age based on DOB.
- `cur_GoalReminder`: Uses a cursor to print user-specific goal progress.

## ✅ How to Run
1. Open SQL Server Management Studio.
2. Run `FitnessTrackingDB_Schema.sql` to create the database and tables.
3. Execute `FitnessTrackingDB_InsertScript.sql` to populate data.
4. Execute `FitnessTrackingDB_Features.sql` to add views, triggers, procedures, functions, and cursors.
5. Run `FitnessTrackingDB_ValidationTestScript.sql` to validate everything is working.

## 📌 Notes
- All scripts are idempotent (safe to re-run).
- Designed for a modular, normalized fitness tracking system with relational integrity.

---
