--SELECT * FROM Class_Train
--SELECT * FROM Train
--SELECT * FROM Station
--SELECT * FROM Customer
SELECT * FROM SubsetOfRoute
--SELECT * FROM Ticket
SELECT * FROM Route

select Route.ID_R,datediff(day,'20220120',DepartureTime) as ID_Date, datepart(hh,DepartureTime)* 60 + datepart(mi,DepartureTime) + 1 as ID_Time, ID_Train,70 as Distance,Amount_Seat,op from Route,
(
	select b.ID_R, cast((cast(sd as float)/ss) as decimal(2,2)) as op from
	(
		select ID_R, sum(dis) as sd from 
		(
			select ID_R, count(ID_Ticket) * ABS(Ordinal_Start - Ordinal_End)*10 as dis from Ticket,SubsetOfRoute
			where Ticket.ID_SR = SubsetOfRoute.ID_SR
			group by ID_R, Ordinal_Start,Ordinal_End
		)a
		group by ID_R
	)b,
	(
		select ID_R, Amount_Seat * 70 as ss from Route
	)c
	where b.ID_R = c.ID_R
)d
where d.ID_R = Route.ID_R
order by ID_R