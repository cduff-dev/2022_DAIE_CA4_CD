-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-12 14:41:38.109

-- tables
-- Table: Employees
CREATE TABLE Employees (
    employeeID int NOT NULL AUTO_INCREMENT,
    employeeName varchar(128) NOT NULL,
    job varchar(128) NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY (employeeID)
) COMMENT 'Stores Employee Information
';

-- Table: Library
CREATE TABLE Library (
    libraryID int NOT NULL AUTO_INCREMENT,
    libraryType varchar(128) NOT NULL,
    assetName varchar(128) NOT NULL,
    CONSTRAINT Library_pk PRIMARY KEY (libraryID)
);

-- Table: ProjectAssets
CREATE TABLE ProjectAssets (
    assetID int NOT NULL AUTO_INCREMENT,
    Projects_projectID int NOT NULL,
    projectName varchar(128) NOT NULL,
    assetName varchar(128) NOT NULL,
    Library_libraryID int NOT NULL,
    libraryType varchar(128) NOT NULL,
    startDate date NOT NULL,
    finishDate date NULL,
    CONSTRAINT ProjectAssets_pk PRIMARY KEY (assetID)
) COMMENT 'Stores Project Asset Information
';

-- Table: ProjectJobs
CREATE TABLE ProjectJobs (
    Employees_employeeID int NOT NULL,
    Employees_employeeName varchar(128) NOT NULL,
    projectJobID int NOT NULL AUTO_INCREMENT,
    projectJobName varchar(400) NOT NULL,
    startDate date NOT NULL,
    finishDate date NOT NULL,
    CONSTRAINT ProjectJobs_pk PRIMARY KEY (projectJobID)
);

-- Table: Projects
CREATE TABLE Projects (
    projectID int NOT NULL AUTO_INCREMENT,
    projectName varchar(128) NOT NULL,
    startDate date NOT NULL,
    finishDate date NOT NULL,
    CONSTRAINT Projects_pk PRIMARY KEY (projectID)
) COMMENT 'Stores Project Information
';

-- foreign keys
-- Reference: Jobs_Employees (table: ProjectJobs)
ALTER TABLE ProjectJobs ADD CONSTRAINT Jobs_Employees FOREIGN KEY Jobs_Employees (Employees_employeeID)
    REFERENCES Employees (employeeID);

-- Reference: ProjectAssets_Library (table: ProjectAssets)
ALTER TABLE ProjectAssets ADD CONSTRAINT ProjectAssets_Library FOREIGN KEY ProjectAssets_Library (Library_libraryID)
    REFERENCES Library (libraryID);

-- Reference: ProjectAssets_Projects (table: ProjectAssets)
ALTER TABLE ProjectAssets ADD CONSTRAINT ProjectAssets_Projects FOREIGN KEY ProjectAssets_Projects (Projects_projectID)
    REFERENCES Projects (projectID);

-- End of file.

