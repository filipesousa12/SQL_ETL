/****** Object:  StoredProcedure [dbo].[InsertorUpdateaDatabaseDesireNextYear]    Script Date: 12/06/2023 16:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaDatabaseDesireNextYear]
as
	Begin
	with DatabaseDesireNextYear_user as(
SELECT distinct Respondent,value AS DatabaseDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(DatabaseDesireNextYear, ';'))

	-- Merge DevType table
MERGE INTO DatabaseDesireNextYear AS target
USING (select distinct DatabaseDesireNextYear from DatabaseDesireNextYear_user)  AS source ON target.DatabaseDesireNextYear = source.DatabaseDesireNextYear
WHEN NOT MATCHED THEN
    INSERT (DatabaseDesireNextYear)
    VALUES (source.DatabaseDesireNextYear);

with DatabaseDesireNextYear_user as(
SELECT distinct Respondent,value AS DatabaseDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(DatabaseDesireNextYear, ';'))

,
user_adsid as (
	select Respondent, ID 
	FROM DatabaseDesireNextYear_user ud
	LEFT JOIN DatabaseDesireNextYear dt
	ON ud.DatabaseDesireNextYear=dt.DatabaseDesireNextYear
)

MERGE INTO dbo.DatabaseDesireNextYear_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent AND target.DatabaseDesireNextYear = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.DatabaseDesireNextYear = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, DatabaseDesireNextYear)
    VALUES (source.Respondent, source.ID);


END





