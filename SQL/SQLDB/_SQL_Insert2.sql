-- second time slot (2022-3-1 2022-3-18)
BULK INSERT dbo.Route FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Route2.csv' WITH (FIELDTERMINATOR=',');
BULK INSERT dbo.SubsetOfRoute FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\RouteSubset2.csv' WITH (FIELDTERMINATOR=',');
BULK INSERT dbo.Ticket FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Ticket3.csv' WITH (FIELDTERMINATOR=',');

update Route SET DepartureTime = '20220201 8:02' where ID_R = 1
update Route SET DepartureTime = '20220318 10:05' where ID_R = 2
update Route SET DepartureTime = '20220318 10:04' where ID_R = 3