--DROP TABLE #OHCostTable

		DECLARE @InitialDate bigint,
				@LastDate bigint;

		SELECT TOP 1 @InitialDate= t.TimePK FROM 
		[ColumbiaSportswear].[dbo].[TIME] t with (nolock) 
		ORDER BY TimePK

		SELECT TOP 1 @LastDate=t.TimePK FROM 
		[ColumbiaSportswear].[dbo].[TIME] t with (nolock) 
		ORDER BY TimePK desc

		SELECT * 
		INTO #OHCostTable 
		FROM [ColumbiaSportswear].[dbo].[FACT] 
		WHERE TimeFK=@InitialDate 
		

		SET @InitialDate= @InitialDate+1  
		 
		PRINT @InitialDate
		pRINT @LastDate
		WHILE @LastDate > @InitialDate
		BEGIN 
			IF EXISTS (SELECT 1 FROM [ColumbiaSportswear].[dbo].[FACT] WHERE TimeFK=@InitialDate )
			BEGIN
				UPDATE CSW
				SET CSW.AC = CASE WHEN OH.AC ='0' or OH.AC is null OR OH.AC='' THEN '10' ELSE OH.AC END
				FROM [ColumbiaSportswear].[dbo].[FACT] CSW
				LEFT JOIN #OHCostTable OH ON CSW.ItemFK=OH.ItemFK
				WHERE CSW.TimeFK=@InitialDate AND (CSW.AC ='0' or CSW.AC is null )
				--AND CSW.ItemFK= '-2147482666'

				TRUNCATE TABLE #OHCostTable
				INSERT INTO #OHCostTable
				SELECT * FROM [ColumbiaSportswear].[dbo].[FACT] WHERE TimeFK=@InitialDate --AND ItemFK= '-2147482666'

			SET @InitialDate= @InitialDate+1 
			
			END
			ELSE
			BEGIN
				SET @InitialDate= @InitialDate+1

			END
		END
