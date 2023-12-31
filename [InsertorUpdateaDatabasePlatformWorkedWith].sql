/****** Object:  StoredProcedure [dbo].[InsertorUpdateaDatabasePlatformWorkedWith]    Script Date: 12/06/2023 16:00:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[InsertorUpdateaDatabasePlatformWorkedWith]
as
	Begin
	with PlatformWorkedWith_user as(
SELECT distinct Respondent,value AS PlatformWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(PlatformWorkedWith, ';'))

	-- Merge DevType table
MERGE INTO PlatformWorkedWith AS target
USING (select distinct PlatformWorkedWith from PlatformWorkedWith_user)  AS source ON target.PlatformWorkedWith = source.PlatformWorkedWith
WHEN NOT MATCHED THEN
    INSERT (PlatformWorkedWith)
    VALUES (source.PlatformWorkedWith);

with PlatformWorkedWith_user as(
SELECT distinct Respondent,value AS PlatformWorkedWith
FROM SurveyData
CROSS APPLY STRING_SPLIT(PlatformWorkedWith, ';'))
,
user_adsid as (
	select Respondent, ID 
	FROM PlatformWorkedWith_user ud
	LEFT JOIN PlatformWorkedWith dt
	ON ud.PlatformWorkedWith=dt.PlatformWorkedWith
)

MERGE INTO dbo.PlatformWorkedWith_user AS target
USING user_adsid AS source ON (target.Respondent = source.Respondent and target.PlatformWorkedWith = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.PlatformWorkedWith = source.ID
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Respondent, PlatformWorkedWith)
    VALUES (source.Respondent, source.ID);


END





