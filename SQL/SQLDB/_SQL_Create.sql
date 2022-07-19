IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
DROP TABLE [dbo].[Station];
CREATE TABLE [dbo].[Station](
    ID_S INT NOT NULL IDENTITY(1,1),
    SName VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID_S)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Station, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Station, 'column', ID_S;
EXEC sp_addextendedproperty 'MS_Description', 'The name of station', 'SCHEMA', dbo, 'table', Station, 'column', SName;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Route]') AND type in (N'U'))
DROP TABLE [dbo].[Route];
CREATE TABLE [dbo].[Route](
    ID_R INT NOT NULL IDENTITY(1,1),
    Departure_Hub_EndName VARCHAR(255) NOT NULL,
    Amount_Seat INT NOT NULL,
    ID_Train VARCHAR(32) NOT NULL,
    DepartureTime DATETIME NOT NULL,
    PRIMARY KEY (ID_R)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Route, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Route, 'column', ID_R;
EXEC sp_addextendedproperty 'MS_Description', 'A string that can be used for recognizing same line which combined by _ and important station.', 'SCHEMA', dbo, 'table', Route, 'column', Departure_Hub_EndName;
EXEC sp_addextendedproperty 'MS_Description', 'How many seat prepared in this route.', 'SCHEMA', dbo, 'table', Route, 'column', Amount_Seat;
EXEC sp_addextendedproperty 'MS_Description', 'The train which was used for this route', 'SCHEMA', dbo, 'table', Route, 'column', ID_Train;
EXEC sp_addextendedproperty 'MS_Description', 'The time of the departure in the start station', 'SCHEMA', dbo, 'table', Route, 'column', DepartureTime;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
DROP TABLE [dbo].[Ticket];
CREATE TABLE [dbo].[Ticket](
    ID_Ticket INT NOT NULL IDENTITY(1,1),
    ID_SR INT NOT NULL,
    ID_C INT NOT NULL,
    DepartureTime DATETIME NOT NULL,
    Seat_Num VARCHAR(255) NOT NULL,
    Time_Sales DATETIME NOT NULL,
    PRIMARY KEY (ID_Ticket)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Ticket, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Ticket, 'column', ID_Ticket;
EXEC sp_addextendedproperty 'MS_Description', 'The ticket is for trip between which two stations', 'SCHEMA', dbo, 'table', Ticket, 'column', ID_SR;
EXEC sp_addextendedproperty 'MS_Description', 'The ticket is bought by which customer', 'SCHEMA', dbo, 'table', Ticket, 'column', ID_C;
EXEC sp_addextendedproperty 'MS_Description', 'The departure time of this trip', 'SCHEMA', dbo, 'table', Ticket, 'column', DepartureTime;
EXEC sp_addextendedproperty 'MS_Description', 'The ticket is responsible for which seat', 'SCHEMA', dbo, 'table', Ticket, 'column', Seat_Num;
EXEC sp_addextendedproperty 'MS_Description', 'The time of the ticket bought', 'SCHEMA', dbo, 'table', Ticket, 'column', Time_Sales;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer];
CREATE TABLE [dbo].[Customer](
    ID_C INT NOT NULL IDENTITY(1,1),
    CName VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID_C)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Customer, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Customer, 'column', ID_C;
EXEC sp_addextendedproperty 'MS_Description', 'Customers name', 'SCHEMA', dbo, 'table', Customer, 'column', CName;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Train]') AND type in (N'U'))
DROP TABLE [dbo].[Train];
CREATE TABLE [dbo].[Train](
    ID_Train VARCHAR(32) NOT NULL,
    ID_TrainClass INT NOT NULL,
    PRIMARY KEY (ID_Train)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Train, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Train, 'column', ID_Train;
EXEC sp_addextendedproperty 'MS_Description', 'The class of the train', 'SCHEMA', dbo, 'table', Train, 'column', ID_TrainClass;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubsetOfRoute]') AND type in (N'U'))
DROP TABLE [dbo].[SubsetOfRoute];
CREATE TABLE [dbo].[SubsetOfRoute](
    ID_SR INT NOT NULL IDENTITY(1,1),
    ID_R INT NOT NULL,
    ID_StartStation VARCHAR(255) NOT NULL,
    Ordinal_Start INT NOT NULL,
    ID_EndStation VARCHAR(255) NOT NULL,
    Ordinal_End INT NOT NULL,
    Distance DECIMAL(24,3) NOT NULL,
    PRIMARY KEY (ID_SR)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', SubsetOfRoute, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', ID_SR;
EXEC sp_addextendedproperty 'MS_Description', 'It is the subroute of which route in history.', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', ID_R;
EXEC sp_addextendedproperty 'MS_Description', 'The start station of this subroute', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', ID_StartStation;
EXEC sp_addextendedproperty 'MS_Description', 'The start station is the nth station in whole route (index from 1)', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', Ordinal_Start;
EXEC sp_addextendedproperty 'MS_Description', 'The end station of this subroute', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', ID_EndStation;
EXEC sp_addextendedproperty 'MS_Description', 'The end station is the nth station in whole route (index from 1)', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', Ordinal_End;
EXEC sp_addextendedproperty 'MS_Description', 'The distance between this two station (km)', 'SCHEMA', dbo, 'table', SubsetOfRoute, 'column', Distance;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Class_Train]') AND type in (N'U'))
DROP TABLE [dbo].[Class_Train];
CREATE TABLE [dbo].[Class_Train](
    ID_Class INT NOT NULL IDENTITY(1,1),
    ClassName VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID_Class)
);

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', Class_Train, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'PK', 'SCHEMA', dbo, 'table', Class_Train, 'column', ID_Class;
EXEC sp_addextendedproperty 'MS_Description', 'The name of class (e.g. EIP (Pendolino), TLK, IC)', 'SCHEMA', dbo, 'table', Class_Train, 'column', ClassName;

