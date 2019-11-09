/*
ConcatenateNamesSQLDatabase
By malai40 (Github: https://github.com/malai40/)
Repository: https://github.com/malai40/ConcatenateNamesSQLDatabase

Quick code to concatenate names in database to one column in SQL Server 2008.
Assuming that first name, middle name, and last name are in separate columns, and 
that not all records have middle names.

Example database name: Student
Columns: StudentId, FirstName, MiddleName, MiddleInitial, LastName
*/

--Create the table
CREATE TABLE Students (
	StudentId int,
	FirstName varchar(255),
	MiddleName varchar(255),
	--MiddleInitial varchar(255), --Version where middle initial is supplied in lieu of whole middle name
	LastName varchar(255)
)
;

--Populate the table
INSERT INTO Students (StudentId, FirstName, MiddleName, LastName)
	VALUES 
		('012345678', 'Jane', 'Medel', 'Doe'),
		('123456789', 'John', 'Mabel', 'Elk')
;
INSERT INTO Students (StudentId, FirstName, LastName)
	VALUES 
		('884200112', 'Mary', 'Contrary'),
		('111000448', 'Kerry', 'Sloan')
;

--Create full name when some students don't have middle name supplied
SELECT 
	StudentId AS [ID Number],
	REPLACE(FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName , '  ', ' ')
		AS [Full Name]
FROM Students
;

--Create full name when some students don't have middle name supplied
--Middle initial only
SELECT 
	StudentId AS [ID Number],
	REPLACE(FirstName + ' ' + SUBSTRING(ISNULL(MiddleName, ''), 1, 1) + '. ' + LastName, ' .', '') 
		AS [Full Name]
FROM Students
;

--Create full name when some students don't have middle name supplied
--Middle initial column is supplied
/*
SELECT 
	StudentId AS [ID Number],
	REPLACE(FirstName + ' ' + ISNULL(MiddleInitial, '') + '. ' + LastName, ' .', '') 
		AS [Full Name]
FROM Students
;
*/