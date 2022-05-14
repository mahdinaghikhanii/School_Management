SELECT DB_ID('School')
if DB_ID('School') is NULL 
    CREATE DATABASE School 
    COLLATE Arabic_CI_AS
go 
use School
GO
if SCHEMA_ID('Sch') is NULL
    EXEC Sp_executesql N'Create Schema [Sch]'
go
GO
if OBJECT_ID('Sch.TBUser') is NULL
CREATE TABLE Sch.TBUser(
    ID SmallInt PRIMARY KEY,
    [Name] NVARCHAR(50),
    Family NVARCHAR(100),
    Mobile NVARCHAR (30),
    Email NVARCHAR (50),
    Pass NVARCHAR (500),
    Active TINYINT,
    Education NVARCHAR(100),
    [Type] TINYINT,
    --1 = Admin
    --2 = Teacher

)
GO
