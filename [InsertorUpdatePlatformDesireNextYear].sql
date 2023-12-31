/****** Object:  StoredProcedure [dbo].[InsertorUpdatePlatformDesireNextYear]    Script Date: 12/06/2023 16:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdatePlatformDesireNextYear]
as
	Begin
	with PlatformDesireNextYear_user as(
SELECT distinct Respondent,value AS PlatformDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(PlatformDesireNextYear, ';'))
	-- Merge DevType table
MERGE INTO PlatformDesireNextYear AS target
USING (select distinct PlatformDesireNextYear from PlatformDesireNextYear_user)  AS source ON target.PlatformDesireNextYear = source.PlatformDesireNextYear
WHEN NOT MATCHED THEN
    INSERT (PlatformDesireNextYear)
    VALUES (source.PlatformDesireNextYear);

with PlatformDesireNextYear_user as(
SELECT distinct Respondent,value AS PlatformDesireNextYear
FROM SurveyData
CROSS APPLY STRING_SPLIT(PlatformDesireNextYear, ';'))
,
user_adsid as (
	select Respondent, ID 
	FROM PlatformDesireNextYear_user ud
	LEFT JOIN PlatformDesireNextYear dt
	ON ud.PlatformDesireNextYear=dt.PlatformDesireNextYear
)

MERGE INTO dbo.PlatformDesireNextYear_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and  target.PlatformDesireNextYear = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.PlatformDesireNextYear = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, PlatformDesireNextYear)
    VALUES (source.Respondent, source.ID);


END





