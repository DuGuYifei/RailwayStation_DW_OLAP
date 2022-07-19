SELECT ID_Ticket, ID_SR, DATEDIFF([day], '20220120', Time_Sales) AS DateID, DATEPART(hh, Time_Sales) * 60 + DATEPART(mi, Time_Sales) + 1 AS TimeID
FROM Ticket

SELECT Route.ID_R, Departure_Hub_EndName, CASE SIGN(Amount_Seat - 420) WHEN 1 THEN CASE SIGN(Amount_Seat - 480) WHEN - 1 THEN 'medium' ELSE 'large' END ELSE 'small' END AS cathegory_amount, B.cathegory_dist, ID_Train, CASE format(DepartureTime,'mm') WHEN '00' THEN 0 ELSE 1 END AS isdelay, DepartureTime
FROM Route,(SELECT ID_R, CASE SIGN(Route_Dist - 50) WHEN 1 THEN CASE SIGN(Route_Dist - 80) WHEN 1 THEN 'long' ELSE 'medium' END ELSE 'short' END AS cathegory_dist
FROM (SELECT ID_R, MAX(Distance) AS Route_Dist
    FROM SubsetOfRoute
    GROUP BY ID_R) AS A) AS B
WHERE Route.ID_R = B.ID_R
ORDER BY ID_R

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

select distinct(t.asr), datediff(day,'20220120',DepartureTime) as ID_Date, datepart(hh,DepartureTime)* 60 + datepart(mi,DepartureTime) + 1 as ID_Time, sst, 10 as Distance from Ticket,
(select a.asr,sum(st) as sst from
(select A.ID_SR as asr, B.ID_SR as bsr from SubsetOfRoute A, SubsetOfRoute B
where A.ID_R = B.ID_R
and 
((A.Ordinal_End - A.Ordinal_Start = 1
and A.Ordinal_Start >= B.Ordinal_Start 
and A.Ordinal_End <= B.Ordinal_End)
or
(A.Ordinal_Start - A.Ordinal_End = 1
and A.Ordinal_Start <= B.Ordinal_Start
and A.Ordinal_End >= B.Ordinal_End)))a,
(
select SubsetOfRoute.ID_SR, count(ID_Ticket) as st from Ticket,SubsetOfRoute
where Ticket.ID_SR = SubsetOfRoute.ID_SR
group by SubsetOfRoute.ID_SR
)b
where a.bsr = b.ID_SR
group by a.asr)t
where Ticket.ID_SR = t.asr
order by asr