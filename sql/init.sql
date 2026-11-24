IF DB_ID('analysis_academic') IS NULL CREATE DATABASE analysis_academic;
GO
USE analysis_academic;
GO
IF SCHEMA_ID('raw') IS NULL EXEC('CREATE SCHEMA raw');
GO