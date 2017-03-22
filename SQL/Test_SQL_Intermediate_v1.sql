-- Test de Evaluare SQL  



IF OBJECT_ID('tempdb..#Currency_Lookup') IS NOT NULL DROP TABLE #Currency_Lookup
IF OBJECT_ID('tempdb..#Durg_Lookup') IS NOT NULL DROP TABLE #Durg_Lookup
IF OBJECT_ID('tempdb..#FORECAST_PREMIUMS') IS NOT NULL DROP TABLE #FORECAST_PREMIUMS
IF OBJECT_ID('tempdb..#FORECAST_Claims') IS NOT NULL DROP TABLE #FORECAST_Claims

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


-- Create Temporary table #Durg_Lookup
Create table #Durg_Lookup
(
	Durg_Key int,
	Durg_Code  varchar(6),
	Durg_Code_DESC Varchar(255)
)

Insert into #Durg_Lookup
Values 
	(0,	NULL, NULL),
	(4,	'5AHME',	'Medical'),
	(12, '5PSSA', '	South Africa'),
	(36, '8074M',	'807 Medical Expenses'),
	(54, 'WRIPR', 'Pro Rata'),
	(60, 'WRIMI', 'Miscellaneous RI'),
	(98, '5AVMH', 'Miscellaneous (includes Space) (Hull)')

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
	( 6, 47, 80, '2002' , 117829, 6333),
	( 6, 47, 80, '2002' , 125471, NULL),
	( 6, 60, 80, '2003' , 82371, 82371),
	( 10, 98, 215, '2006', 2093825, 77888),
	( 10, 98, 215, '2006', 11111938, 4523645)

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

-- may comment this when writting your own queries
Select * from #Currency_Lookup
Select * from #Durg_Lookup
Select * from #FORECAST_PREMIUMS
Select * from #FORECAST_Claims

/*
Tasks:

1.  Using #Currency_Lookup ,#Durg_Lookup and  #Forecast_Premiums tables write a query to find 
total amount of Forecast_Premium and CUML_EPI_Amount received for each combination of DURG_Code, Currency and Year_of_Account.
Note: In case the Key(all the columns that are keys) is NULL  set it as 'UNKNOWN' , In Case the Amount (all the columns that are amounts) is NULL set it as 0
If data type is different make a conversion(cast) in order to set the requested value. Don't use UPDATE.

2.  Using #Forecast_Claims and #Forecast_Premiums tables write a query to find 
for which combinations of SYNDICATE_KEY and DURG_KEY there were Forecast_premiums received, 
but there were NO Forecast_claims paid
Note: In case the Key(all the columns that are keys) is NULL  set it as 'UNKNOWN' , In Case the Amount (all the columns that are amounts)  is NULL set it as 0
If data type is different make a conversion(cast) in order to set the requested value. Don't use UPDATE.

3.  In Forecast_Premiums table write a query to find total amount of Forecast_premium  and CUML_EPI_Amount
for each combination of SYNDICATE_KEY, DURG_KEY and CURRENCY_KEY which received premium more than in one YEAR_OF_ACCOUNT
Note: In case the Key (all the columns that are keys) is NULL  set it as 'UNKNOWN' , In Case the Amount (all the columns that are amounts)  is NULL set it  as 0 
If data type is different make a conversion(cast) in order to set the requested value. Don't use UPDATE.




/* Write your queries Here */






