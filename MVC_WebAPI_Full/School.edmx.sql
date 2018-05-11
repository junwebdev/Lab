
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/24/2018 15:45:46
-- Generated from EDMX file: C:\Users\wenjunxie\Source\Repos\Lab\MVC_WebAPI_Full\School.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ModelFirst.School];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [StandardId] nvarchar(max)  NOT NULL,
    [Standard_StandardId] int  NULL
);
GO

-- Creating table 'Standards'
CREATE TABLE [dbo].[Standards] (
    [StandardId] int IDENTITY(1,1) NOT NULL,
    [StandardName] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StudentAddresses'
CREATE TABLE [dbo].[StudentAddresses] (
    [StudentID] int IDENTITY(1,1) NOT NULL,
    [Address1] nvarchar(max)  NOT NULL,
    [Address2] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Teachers'
CREATE TABLE [dbo].[Teachers] (
    [TeacherId] int IDENTITY(1,1) NOT NULL,
    [TeacherName] nvarchar(max)  NOT NULL,
    [StandardId] nvarchar(max)  NOT NULL,
    [Standards_StandardId] int  NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [CourseId] int IDENTITY(1,1) NOT NULL,
    [CourseName] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [TeacherId] nvarchar(max)  NOT NULL,
    [Teacher_TeacherId] int  NULL
);
GO

-- Creating table 'StudentCourse'
CREATE TABLE [dbo].[StudentCourse] (
    [Student_StudentID] int  NOT NULL,
    [Courses_CourseId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StudentID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentID] ASC);
GO

-- Creating primary key on [StandardId] in table 'Standards'
ALTER TABLE [dbo].[Standards]
ADD CONSTRAINT [PK_Standards]
    PRIMARY KEY CLUSTERED ([StandardId] ASC);
GO

-- Creating primary key on [StudentID] in table 'StudentAddresses'
ALTER TABLE [dbo].[StudentAddresses]
ADD CONSTRAINT [PK_StudentAddresses]
    PRIMARY KEY CLUSTERED ([StudentID] ASC);
GO

-- Creating primary key on [TeacherId] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [PK_Teachers]
    PRIMARY KEY CLUSTERED ([TeacherId] ASC);
GO

-- Creating primary key on [CourseId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([CourseId] ASC);
GO

-- Creating primary key on [Student_StudentID], [Courses_CourseId] in table 'StudentCourse'
ALTER TABLE [dbo].[StudentCourse]
ADD CONSTRAINT [PK_StudentCourse]
    PRIMARY KEY CLUSTERED ([Student_StudentID], [Courses_CourseId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StudentID] in table 'StudentAddresses'
ALTER TABLE [dbo].[StudentAddresses]
ADD CONSTRAINT [FK_StudentStudentAddress]
    FOREIGN KEY ([StudentID])
    REFERENCES [dbo].[Students]
        ([StudentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Teacher_TeacherId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_TeacherCourse]
    FOREIGN KEY ([Teacher_TeacherId])
    REFERENCES [dbo].[Teachers]
        ([TeacherId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherCourse'
CREATE INDEX [IX_FK_TeacherCourse]
ON [dbo].[Courses]
    ([Teacher_TeacherId]);
GO

-- Creating foreign key on [Standards_StandardId] in table 'Teachers'
ALTER TABLE [dbo].[Teachers]
ADD CONSTRAINT [FK_TeacherStandard]
    FOREIGN KEY ([Standards_StandardId])
    REFERENCES [dbo].[Standards]
        ([StandardId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeacherStandard'
CREATE INDEX [IX_FK_TeacherStandard]
ON [dbo].[Teachers]
    ([Standards_StandardId]);
GO

-- Creating foreign key on [Student_StudentID] in table 'StudentCourse'
ALTER TABLE [dbo].[StudentCourse]
ADD CONSTRAINT [FK_StudentCourse_Student]
    FOREIGN KEY ([Student_StudentID])
    REFERENCES [dbo].[Students]
        ([StudentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Courses_CourseId] in table 'StudentCourse'
ALTER TABLE [dbo].[StudentCourse]
ADD CONSTRAINT [FK_StudentCourse_Course]
    FOREIGN KEY ([Courses_CourseId])
    REFERENCES [dbo].[Courses]
        ([CourseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentCourse_Course'
CREATE INDEX [IX_FK_StudentCourse_Course]
ON [dbo].[StudentCourse]
    ([Courses_CourseId]);
GO

-- Creating foreign key on [Standard_StandardId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_StandardStudent]
    FOREIGN KEY ([Standard_StandardId])
    REFERENCES [dbo].[Standards]
        ([StandardId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StandardStudent'
CREATE INDEX [IX_FK_StandardStudent]
ON [dbo].[Students]
    ([Standard_StandardId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------