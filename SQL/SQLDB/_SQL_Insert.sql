BULK INSERT dbo.Class_Train FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Train_class.csv' WITH (FIELDTERMINATOR = ',');
BULK INSERT dbo.Train FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Train.csv' WITH (FIELDTERMINATOR=',');
BULK INSERT dbo.Customer FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\CustomerName.csv' WITH (FIELDTERMINATOR=',');
BULK INSERT dbo.Station FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Station.csv' WITH (FIELDTERMINATOR=',');

-- first time slot (2022-2-1  2022-2-28)
BULK INSERT dbo.Route FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Route1.csv' WITH (FIELDTERMINATOR=',');
BULK INSERT dbo.SubsetOfRoute FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\RouteSubset1.csv' WITH (FIELDTERMINATOR=',');
BULK INSERT dbo.Ticket FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Ticket1.csv' WITH (FIELDTERMINATOR=',');


---- second time slot (2022-3-1 2022-3-18)
--BULK INSERT dbo.Route FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Route2.csv' WITH (FIELDTERMINATOR=',');
--BULK INSERT dbo.SubsetOfRoute FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\RouteSubset2.csv' WITH (FIELDTERMINATOR=',');
--BULK INSERT dbo.Ticket FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\Ticket3.csv' WITH (FIELDTERMINATOR=',');

---- make up the difference in excel
--BULK INSERT dbo.Train FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\ConsistentWithExcel_Train.csv' WITH (FIELDTERMINATOR=',');
--BULK INSERT dbo.Station FROM 'E:\Gdansk University of Technology\Fourth_Semester\DataWarehouse\Lab\2_DataGenerator\ConsistentWithExcel_Station.csv' WITH (FIELDTERMINATOR=',');