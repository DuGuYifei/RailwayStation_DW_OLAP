IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subroute_RemainTicket]') AND type in (N'U'))
DROP TABLE [dbo].[Subroute_RemainTicket];
CREATE TABLE [dbo].[Subroute_RemainTicket](
    ID_Subroute INT NOT NULL,
    ID_Date_SubRouteDepart INT NOT NULL,
    ID_Time_SubRouteDepart INT NOT NULL,
    Ticket_PassThrough INT NOT NULL,
    Distance DECIMAL(24,3) NOT NULL
);

EXEC sp_addextendedproperty 'MS_Description', 'One tuple describes one fact of subroute', 'SCHEMA', dbo, 'table', Subroute_RemainTicket, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'Sub route', 'SCHEMA', dbo, 'table', Subroute_RemainTicket, 'column', ID_Subroute;
EXEC sp_addextendedproperty 'MS_Description', 'The date of the subroute depart', 'SCHEMA', dbo, 'table', Subroute_RemainTicket, 'column', ID_Date_SubRouteDepart;
EXEC sp_addextendedproperty 'MS_Description', 'The time of the subroute depart', 'SCHEMA', dbo, 'table', Subroute_RemainTicket, 'column', ID_Time_SubRouteDepart;
EXEC sp_addextendedproperty 'MS_Description', 'The amount of ticket that pass through this subroute', 'SCHEMA', dbo, 'table', Subroute_RemainTicket, 'column', Ticket_PassThrough;
EXEC sp_addextendedproperty 'MS_Description', 'The distance between this two station (km)', 'SCHEMA', dbo, 'table', Subroute_RemainTicket, 'column', Distance;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Route_OccupancyRate]') AND type in (N'U'))
DROP TABLE [dbo].[Route_OccupancyRate];
CREATE TABLE [dbo].[Route_OccupancyRate](
    ID_Route INT NOT NULL,
    ID_Date_RouteDepart INT NOT NULL,
    ID_Time_RouteDepart INT NOT NULL,
    ID_Train VARCHAR(32) NOT NULL,
    Distance DECIMAL(24,3) NOT NULL,
    Amount_Seat INT NOT NULL,
    Occupancy DECIMAL(2,2) NOT NULL
);

EXEC sp_addextendedproperty 'MS_Description', 'One tuple describe one fact of route', 'SCHEMA', dbo, 'table', Route_OccupancyRate, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'Route', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', ID_Route;
EXEC sp_addextendedproperty 'MS_Description', 'The date of the route depart', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', ID_Date_RouteDepart;
EXEC sp_addextendedproperty 'MS_Description', 'The time of the route depart', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', ID_Time_RouteDepart;
EXEC sp_addextendedproperty 'MS_Description', 'The train of this route', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', ID_Train;
EXEC sp_addextendedproperty 'MS_Description', 'The distance from start to end station of route', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', Distance;
EXEC sp_addextendedproperty 'MS_Description', 'The amount of seat', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', Amount_Seat;
EXEC sp_addextendedproperty 'MS_Description', 'The occupancy rate of this route', 'SCHEMA', dbo, 'table', Route_OccupancyRate, 'column', Occupancy;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Date]') AND type in (N'U'))
DROP TABLE [dbo].[Date];
CREATE TABLE [dbo].[Date](
    ID_Date INT NOT NULL IDENTITY(1,1),
    Date DATETIME NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    MonthChar VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_Date)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Date, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Date, 'column', ID_Date;
EXEC sp_addextendedproperty 'MS_Description', 'The specific date', 'SCHEMA', dbo, 'table', Date, 'column', Date;
EXEC sp_addextendedproperty 'MS_Description', 'Numeric year, e.g. 2022', 'SCHEMA', dbo, 'table', Date, 'column', Year;
EXEC sp_addextendedproperty 'MS_Description', 'Numeric month, 1-12', 'SCHEMA', dbo, 'table', Date, 'column', Month;
EXEC sp_addextendedproperty 'MS_Description', 'Numeric day, 1-31', 'SCHEMA', dbo, 'table', Date, 'column', Day;
EXEC sp_addextendedproperty 'MS_Description', 'Month. e.g. January', 'SCHEMA', dbo, 'table', Date, 'column', MonthChar;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Time]') AND type in (N'U'))
DROP TABLE [dbo].[Time];
CREATE TABLE [dbo].[Time](
    ID_Time INT NOT NULL IDENTITY(1,1),
    Hour INT NOT NULL,
    Minute INT NOT NULL,
    PRIMARY KEY (ID_Time)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Time, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Time, 'column', ID_Time;
EXEC sp_addextendedproperty 'MS_Description', 'The hour of a day, 0-23', 'SCHEMA', dbo, 'table', Time, 'column', Hour;
EXEC sp_addextendedproperty 'MS_Description', 'The minute of a hour, 0-59', 'SCHEMA', dbo, 'table', Time, 'column', Minute;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tickets]') AND type in (N'U'))
DROP TABLE [dbo].[Tickets];
CREATE TABLE [dbo].[Tickets](
    ID_Ticket INT NOT NULL,
    ID_SR INT NOT NULL,
    ID_Date_Sale INT NOT NULL,
    ID_Time_Sale INT NOT NULL,
    PRIMARY KEY (ID_Ticket)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Tickets, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Tickets, 'column', ID_Ticket;
EXEC sp_addextendedproperty 'MS_Description', 'The ticket is for trip between which two stations', 'SCHEMA', dbo, 'table', Tickets, 'column', ID_SR;
EXEC sp_addextendedproperty 'MS_Description', 'The date of ticket sell out', 'SCHEMA', dbo, 'table', Tickets, 'column', ID_Date_Sale;
EXEC sp_addextendedproperty 'MS_Description', 'The time of ticket sell out', 'SCHEMA', dbo, 'table', Tickets, 'column', ID_Time_Sale;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Routes]') AND type in (N'U'))
DROP TABLE [dbo].[Routes];
CREATE TABLE [dbo].[Routes](
    ID_R_surrogate INT NOT NULL IDENTITY(1,1),
    ID_R INT NOT NULL,
    Departure_Hub_EndName VARCHAR(255) NOT NULL,
    Amount_Seat VARCHAR(32) NOT NULL,
    Distance VARCHAR(32) NOT NULL,
    ID_Train VARCHAR(32) NOT NULL,
    isDelayed BIT NOT NULL,
	DepartTime DATETIME NOT NULL,
    PRIMARY KEY (ID_R_surrogate)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Routes, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Routes, 'column', ID_R;
EXEC sp_addextendedproperty 'MS_Description', 'A string that can be used for recognizing same line which combined by _ and important station.', 'SCHEMA', dbo, 'table', Routes, 'column', Departure_Hub_EndName;
EXEC sp_addextendedproperty 'MS_Description', 'Large, above_average, medium, below_average, small - types of seats prepared for the route', 'SCHEMA', dbo, 'table', Routes, 'column', Amount_Seat;
EXEC sp_addextendedproperty 'MS_Description', 'Long, medium or short distance of the route', 'SCHEMA', dbo, 'table', Routes, 'column', Distance;
EXEC sp_addextendedproperty 'MS_Description', 'The train which was used for this route', 'SCHEMA', dbo, 'table', Routes, 'column', ID_Train;
EXEC sp_addextendedproperty 'MS_Description', 'Is the train delayed, if delayed will have new row for new time', 'SCHEMA', dbo, 'table', Routes, 'column', isDelayed;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subroutes]') AND type in (N'U'))
DROP TABLE [dbo].[Subroutes];
CREATE TABLE [dbo].[Subroutes](
	ID_SR_surrogate INT NOT NULL IDENTITY(1,1),
    ID_SR INT NOT NULL,
    ID_R INT NOT NULL,
    Ordinal_Start INT NOT NULL,
    Ordinal_End INT NOT NULL,
    PRIMARY KEY (ID_SR_surrogate)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Subroutes, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Subroutes, 'column', ID_SR;
EXEC sp_addextendedproperty 'MS_Description', 'It is the subroute of which route in history.', 'SCHEMA', dbo, 'table', Subroutes, 'column', ID_R;
EXEC sp_addextendedproperty 'MS_Description', 'The start station is the nth station in whole route (index from 1)', 'SCHEMA', dbo, 'table', Subroutes, 'column', Ordinal_Start;
EXEC sp_addextendedproperty 'MS_Description', 'The end station is the nth station in whole route (index from 1)', 'SCHEMA', dbo, 'table', Subroutes, 'column', Ordinal_End;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trains]') AND type in (N'U'))
DROP TABLE [dbo].[Trains];
CREATE TABLE [dbo].[Trains](
    ID_Train VARCHAR(32) NOT NULL,
    TrainClass VARCHAR(32) NOT NULL,
    PRIMARY KEY (ID_Train)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Trains, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Trains, 'column', ID_Train;
EXEC sp_addextendedproperty 'MS_Description', 'The class of the train', 'SCHEMA', dbo, 'table', Trains, 'column', TrainClass;

