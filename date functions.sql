 
 -- Date functions

 /*  GETDATE() and SYSDATETIME()
SQL Server uses GETDATE() and SYSDATETIME() to get a current date and time. They are nondeterministic functions: 
views and expressions that reference these columns can’t be indexed. Both functions accept no arguments and 
return the local current date and time. 
The difference is, when we use
 GETDATE(), the precision is to the milliseconds and 
 in the case of SYSDATETIME(), the precision is to the nanoseconds. */


 --current Date
     select GETDATE() -- 2017-12-13 06:40:01.290
	  select SYSDATETIME()  --2017-12-14 00:29:24.9350104

--DateDIFF - DATEDIFF(datepart, date1, date2)
			-----------------------------------
	 -- Day Difference
			  SELECT DATEDIFF(DAY, '2017/08/25', '2017/08/26') AS DateDiff;  --=  1
			  SELECT DATEDIFF(DAY, '2017/08/25', '2017/08/24') AS DateDiff;  --= -1
	 --Month Difference														 
			  SELECT DATEDIFF(MONTH, '2017/08/25', '2017/09/26') AS DateDiff; --=  1
			  SELECT DATEDIFF(MONTH, '2017/08/25', '2017/07/26') AS DateDiff; --= -1
	  -- year Difference
			SELECT DATEDIFF(year, '2011/08/25', '2017/08/25') AS DateDiff;   -- = 6
			SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;   -- = -6

			SELECT DATEDIFF(hour,'2017-12-13 06:40:01.290', '2017-12-13 07:41:01.290') AS DateDiff;  -- 1
			SELECT DATEDIFF(minute,'2017-12-13 06:40:01.290', '2017-12-13 07:41:01.290') AS DateDiff; -- 61
			SELECT DATEDIFF(second,'2017-12-13 06:40:01.290', '2017-12-13 07:41:01.290') AS DateDiff; -- 3660
   ---------------------------

-- DateAdd -  DateAdd(datepart , number , date ) 

	-- add one day to date
		select DateAdd(day,1,'2017/12/13')  --2017-12-14 00:00:00.000
		select DateAdd(day,1, GETDATE())    -- 2017-12-14 00:00:00.000
		select DateAdd(day,-1, GETDATE())    -- 2017-12-12 06:51:05.183

	-- get tomorrow date, add 1 day to current date
		select DateAdd(day,1, GETDATE())   --2017-12-14 06:52:50.830

	-- yesterday	
		select DateAdd(day,-1, GETDATE())  --2017-12-12 06:56:20.830

	 --get next hout, add 1 hour to current time	
		select DateAdd(HOUR,1, GETDATE())  --2017-12-13 07:52:43.860

	--get next year, add 1 hour to current time
		select DateAdd(YEAR,1, GETDATE())  --2018-12-13 06:55:11.893



    select GETDATE()  --2017-12-13 07:07:33.927
	select	CONVERT (date, GETDATE()) -- 2017-12-13
--	select	CONVERT (year, GETDATE()) -- ERROR
 

/*DATEPART (datepart,date)
 DATEPART (datepart,date) returns an integer that represents the specified datepart of the specified date. 
 Datepart could be specified by a whole name or an abbreviated name */

	Select datepart(year,getdate())			--2017
	Select datepart(MONTH,getdate())		--12
	Select datepart(Week,getdate())	   ?
	Select datepart(HOUR,getdate())			--7
	Select datepart(MINUTE,getdate())		--19
	Select datepart(SECOND,getdate())		--14
	Select datepart(MILLISECOND,getdate())	--133
	Select datepart(NANOSECOND,getdate())	--133000000

	--or
	
	/*
			○ day could be specified as day, dd, d
			○ month could be specified as month, mm, m
			○ year could be specified as year yy.
	*/

	SELECT DATEPART(yy,  GETDATE() ) as year,
           DATEPART(mm,  GETDATE() ) as month,
           DATEPART(dd,  GETDATE() ) as day,
           DATEPART(ww,  GETDATE() ) as week




	declare @dt date = '2014-10-20'
    select year (@dt) as year,
       month (@dt) as month,
       day (@dt) as day


