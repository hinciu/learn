-- Test de Evaluare SQL 



IF OBJECT_ID('tempdb..#Currency_Lookup') IS NOT NULL DROP TABLE #Currency_Lookup
IF OBJECT_ID('tempdb..#FORECAST_PREMIUMS') IS NOT NULL DROP TABLE #FORECAST_PREMIUMS
IF OBJECT_ID('tempdb..#FORECAST_Claims') IS NOT NULL DROP TABLE #FORECAST_Claims
IF OBJECT_ID('tempdb..#Rate_Of_Exchange') IS NOT NULL DROP TABLE #Rate_Of_Exchange

-- Create Temporary table #Currency_Lookup
Create table #Currency_Lookup
(
	Currency_Key int,
	Currency  varchar(5),
	Currency_DESC Varchar(255)
)

Insert into #Currency_Lookup
Values 
( 46, 'CAD' , 'Canadian Dollar' ),
( 80,'GBP' ,'British Pound Sterling'),
( 215, 'USD' ,'US Dollar')


-- Create Temporary table #Rate_Of_Exchange
Create table #Rate_Of_Exchange
(
	Currency_Key int,
	Rate_Of_Exchange_key  int,
	Rate_of_Exchange decimal (8,5)
)

Insert into #Rate_Of_Exchange
Values 
( 46, 3 , 1.59081 ),
( 80, 1 ,1),
( 215, 2 ,1.62289)


-- Create Temporary table #FORECAST_PREMIUMS

Create table #FORECAST_PREMIUMS
(
	Syndicate_Key int,
	Durg_Key int,
	Currency_Key int,
	Year_Of_Account varchar(10),
	Forecast_Premium int,
	CUML_EPI_Amount int 
)

Insert into #FORECAST_PREMIUMS
Values 
(NULL, NULL, NULL, 'UNKNOWN', 0,6),
( 3, 54, 46 ,'2000' , 109105 ,0 ),
( 3 ,54, 46, '2001' , 128645 , 128646),
( 5, 47, 80, '2002' , 117829, 6333),
( 6, 47, 80, '2002' , 125471, NULL),
( 6, 60, 80, '2003' , 82371, 82371),
( 10, 98, 215, '2006', 2093825, 77888),
( 10, 98, 215, '2007', 11111938, 4523645)

-- Create Temporary table #FORECAST_Claims
Create table #FORECAST_Claims
(
	Syndicate_Key int,
	Durg_Key int,
	Currency_Key int,
	Year_Of_Account varchar(10),
	Outward_Contract_Referrence Varchar(25),
	Forecast_Claims int,
	Ultimate_Profit_Comission int 
)

Insert into #FORECAST_Claims
Values 
(NULL, NULL, NULL, 'UNKNOWN', 'UNKNOWN', 0,-45),
( 5, 47, 80 ,'2002' , 'AB00ZZ021M12', -9991203 ,NULL ),
( 5, 47, 80 ,'2002' , 'AB00ZZ021M13', -4522 ,-74412 ),
( 9 ,60, 215, '2006' ,'AC04ZZ021M13', -2340299 , -895562),
( 10, 98, 46, '2007' , 'FAC0ZZ021M55', -2564123, -851298)


Select * from #Currency_Lookup
Select * from #Rate_Of_Exchange
Select * from #FORECAST_PREMIUMS
Select * from #FORECAST_Claims

/*
Tasks:


1.	Using #Forecast_Premiums and #Forecast_Claims tables write a query to find 
total amount of Pure Premium ,Cumulative EPI Amount, Forecast_Claims and Ultimate_Profit_Comission
received for each combination of Syndicate_Key, Durg_Key , Currency_key and Year_of_Account.
Note: In case the Key is NULL  set it as 'UNKNOWN' , In Case the Amount is NULL set it as 0


2. Using #Forecast_Premiums and #Forecast_Claims tables write a query to find SUM of Forecast_Premium + Forecast_Claims
for each Syndicate_Key, Durg_Key, Currency_Key and Year_of_Account
Note: In case the Key is NULL  set it as 'UNKNOWN' , In Case the Amount is NULL set it as 0


3. Using #Forecast_Premiums , #Currency_Lookup and #Rate_Of_Exchange tables calculate 
Totals of the Forecast_Premium and Cumulative EPI Amount, transformed in GBP grouped by Year_of_Account.
Note: In case the Key is NULL  set it as 'UNKNOWN' , In Case the Amount is NULL set it as 0
Example (Value of Forecast_Premium should be divided to the rate of exchange:
3	54	46	2000	109105	0   - currency is CAD, so we need to divide it to Rate_Of exchange of the CAD currency.)

*/


/* Write your queries Here */






