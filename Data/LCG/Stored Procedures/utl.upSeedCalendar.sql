SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create   procedure [utl].[upSeedCalendar]
as 


Declare @l common.uttIntList
Declare @StartDate Datetime2 = '0001-01-01'

;WITH
  L0   AS (SELECT 1 AS n UNION ALL SELECT 1),              -- 2 rows
  L1   AS (SELECT 1 AS n FROM L0 AS a CROSS JOIN L0 AS b), -- 4 rows (2 x 2)
  L2   AS (SELECT 1 AS n FROM L1 AS a CROSS JOIN L1 AS b), -- 16 rows (4 x 4)
  L3   AS (SELECT 1 AS n FROM L2 AS a CROSS JOIN L2 AS b), -- 256 rows (16 x 16)
  L4   AS (SELECT 1 AS n FROM L3 AS a CROSS JOIN L3 AS b), -- 65 536 rows (256 x 256)
  L5   AS (SELECT 1 AS n FROM L4 AS a CROSS JOIN L4 AS b), -- 4 294 967 296 rows (65 536 x 65 536)
  Nums AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM L5)

Insert into @l
SELECT TOP (3652059) n FROM Nums ORDER BY n;

Insert into Common.Calendar (
	RataDieDate
	,GregorianDate
	,LilianDate
	,JulianDate
	,JulianDayNumber
	,YearDay
)
Select Common.ufsTransformedJDN(dateAdd(dd, SomeNumber-1, @StartDate), 'RataDie')
	 , cast(dateAdd(dd,SomeNumber-1, @StartDate) as date)
	 , iif(Common.ufsTransformedJDN(dateAdd(dd, SomeNumber-1, @StartDate), 'lilian') < 0, null, Common.ufsTransformedJDN(dateAdd(dd, SomeNumber-1, @StartDate), 'lilian'))
	 , Common.ufsJulianDateConverter(dateadd(dd, SomeNumber-1, @Startdate))
	 , FLOOR(Common.ufsJulianDateConverter(dateadd(dd, SomeNumber-1, @Startdate)))
	 , datepart(dayofyear, dateadd(dd,Somenumber-1, @startDate))
  from @l
  order by somenumber

  
GO
