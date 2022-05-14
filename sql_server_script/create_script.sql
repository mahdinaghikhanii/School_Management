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
    Token  UNIQUEIDENTIFIER,
    TokenTime DATETIME,
)
GO
IF OBJECT_ID('Sch.TBBranch') is NULL
CREATE TABLE Sch.TBBranch(
 ID TINYINT PRIMARY KEY,
 [Name] NVARCHAR(50),
 [Address] NVARCHAR(500),
 Telephone NVARCHAR(30),
)
IF OBJECT_ID('Sch.TBBranchUser') is NULL 
CREATE TABLE Sch.TBBranchUser(
    BrnID TINYINT FOREIGN KEY REFERENCES Sch.TBBranch(ID),
    UserID SMALLINT FOREIGN KEY REFERENCES Sch.TBUser(ID),
    PRIMARY KEY(BrnID, UserID),
)
GO
IF OBJECT_ID('Sch.TBStudent') IS NULL
CREATE TABLE Sch.TBStudent(
    ID  int PRIMARY KEY,
    [Name] NVARCHAR(50),
    Family NVARCHAR (100),
    Mobile NVARCHAR(30),
    [Address] NVARCHAR(500),
    Telephone NVARCHAR(30),
    Father NVARCHAR(100),
    Job NVARCHAR(50),
    regDate CHAR(10),
)
GO
IF OBJECT_ID('Sch.TBTerm') is NULL
CREATE TABLE S.chTBTerm(
    ID SMALLINT PRIMARY key ,
    BrnID TINYINT FOREIGN key REFERENCES Sch.TBBranch(ID),
    [Name] NVARCHAR(50),
    BDate CHAR(10),
    EDate CHAR(10),
)
go

IF OBJECT_id('Sch.TBLevel') is NULL
CREATE TABLE Sch.TBLevel(
    ID TINYINT  PRIMARY KEY,
    [Name] NVARCHAR(30),
)
if OBJECT_ID('Sch.TBClass') is NULL
CREATE TABLE Sch.TBClass(
    ID SMALLINT PRIMARY KEY ,
    TermID SMALLINT FOREIGN KEY REFERENCES Sch.TbTerm(ID),
    LevID TINYINT FOREIGN KEY REFERENCES Sch.TBLevel(ID),
    Room NVARCHAR(10),
    TecherID SNAPSHOT FOREIGN KEY REFERENCES Sch.TBUser(ID),
    Price FLOAT,
    BookPrice FLOAT,
    OtherPrice FLOAT,
    Capacity TINYINT,
    SDate CHAR(10),
    EDate CHAR(10), 
)
GO
if OBJECT_ID('Sch.TBDStudent') is NULL
CREATE TABLE Sch.TBDStudent(
    STID int  FOREIGN key REFERENCES Sch.TBStudent(ID),
    ClcID SMALLINT FOREIGN KEY REFERENCES Sch.TBClass(ID),
    RegDate CHAR(10),

)
GO
IF OBJECT_ID('Sch.TBSAbsent') IS NULL
CREATE TABLE Sch.TBSAbsent(
    STID  int FOREIGN KEY REFERENCES Sch.TBStudent(ID),
    Radif  TINYINT,
    [Date] CHAR(10),
    PRIMARY KEY(STID,Radif),
)
GO

