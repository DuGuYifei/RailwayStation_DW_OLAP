DECLARE @date INT
SET @date = 20220120
WHILE @date <= 20220131
BEGIN
	insert into [Date] values(cast(@date as char), 2022, 1, @date - 20220100,'January')
	SET @date = @date + 1
END
SET @date = 20220201
WHILE @date <= 20220228
BEGIN
	insert into [Date] values(cast(@date as char), 2022, 1, @date - 20220100,'February')
	SET @date = @date + 1
END
SET @date = 20220301
WHILE @date <= 20220320
BEGIN
	insert into [Date] values(cast(@date as char), 2022, 1, @date - 20220100,'March')
	SET @date = @date + 1
END


DECLARE @hour INT
DECLARE @minute INT
SET @hour = 0
while @hour < 12
BEGIN
	SET @minute = 0
	while @minute < 60
	BEGIN
		INSERT INTO [Time] VALUES(@hour,@minute)
		SET @minute = @minute + 1
	END
	SET @hour = @hour + 1
END
